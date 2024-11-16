module Admin
  class ClaimRequestsController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    #
    def index
      search_term = params[:search].to_s.strip

      if search_term.present?
        # Perform search with Algolia
        algolia_results = ClaimRequest.algolia_search(search_term)
        resource_ids = algolia_results.map(&:id)
        resources = ClaimRequest.where(id: resource_ids).includes(:claim_request_type).page(params[:_page]).per(records_per_page)
      else
        # Fallback to showing all resources if no search term is provided
        resources = ClaimRequest.includes(:claim_request_type).page(params[:_page]).per(records_per_page)
      end

      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
        show_search_bar: true
      }
    end

    def create
      @claim_request = ClaimRequest.new(resource_params)

      @claim_request_type = ClaimRequestType.find(resource_params[:claim_request_type_id])
      if @claim_request_type.name != 'Retirement'
        @claim_request.amount = @claim_request_type.amount
      else
        contribution_count = current_user.contributions.count

        if contribution_count < 13
          @claim_request.amount = ClaimRequest::BASE_BENEFIT
        else
          base_value = ClaimRequest::RANGE_TO_VALUE_MAP.select { |range, _| range.include?(contribution_count) }.values.first
          @claim_request.amount = base_value + ClaimRequest::ADDITIONAL_RETIREMENT_VALUE
        end
      end

      @claim_request.save
      super
    end



    def update
      super
      @claim_request = ClaimRequest.find(params[:id])
      if params[:claim_request][:status] == 'Approved'
        @claim_request.approved_at = Time.zone.now
        @claim_request.save
        ClaimRequestUpdateMailer.approval_email(requested_resource).deliver_now
      else
        @claim_request.rejected_at = Time.zone.now
        @claim_request.save
        ClaimRequestUpdateMailer.rejection_email(requested_resource).deliver_now
      end
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.with_less_stuff
    #   end
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    # def resource_params
    #   params.require(resource_class.model_name.param_key).
    #     permit(dashboard.permitted_attributes(action_name)).
    #     transform_values { |value| value == "" ? nil : value }
    # end

    # See https://administrate-demo.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
