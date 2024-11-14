module Admin
  class ContributionsController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    #
    def index
      search_term = params[:search].to_s.strip

      if search_term.present?
        # Perform search with Algolia
        algolia_results = Contribution.algolia_search(search_term)
        resource_ids = algolia_results.map(&:id)
        resources = Contribution.where(id: resource_ids)
          .includes(:user)
          .page(params[:_page])
          .per(records_per_page)
      else
        # Fallback to showing all resources if no search term is provided
        resources = Contribution.includes(:user).page(params[:_page]).per(records_per_page)
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
      if resource_params["date_from"].empty?
        dummy_contribution = Contribution.new
        dummy_contribution.errors.add(:base, "Date from value should be supplied")

        render :new, locals: {
                    page: Administrate::Page::Form.new(dashboard, dummy_contribution)
                  }, status: :unprocessable_entity
        return
      end

      if resource_params["date_to"].empty?
        dummy_contribution = Contribution.new
        dummy_contribution.errors.add(:base, "Date to value should be supplied")

        render :new, locals: {
                    page: Administrate::Page::Form.new(dashboard, dummy_contribution)
                  }, status: :unprocessable_entity
        return
      end

      date_from = Date.parse(resource_params["date_from"])
      date_to = Date.parse(resource_params["date_to"])
      date_range = date_from..date_to

      date_months = date_range.map { |date| Date.new(date.year, date.month) }.uniq

      ActiveRecord::Base.transaction do
        params_array = date_months.map do |date|
          {
            user_id: resource_params["user_id"],
            amount: resource_params["amount"],
            month: date,
            document: resource_params["document"],
            receipt_number: resource_params["receipt_number"]
          }
        end

        if Contribution.where(receipt_number: resource_params['receipt_number']).exists?
          dummy_contribution = Contribution.new(params_array.first)
          dummy_contribution.errors.add(:receipt_number, "is invalid or already taken")
          render :new, locals: {
                    page: Administrate::Page::Form.new(dashboard, dummy_contribution)
                  }, status: :unprocessable_entity
          return
        end

        params_array.each do |params|
          contribution = Contribution.new(params)
          contribution. skip_uniqueness_check = true
          unless contribution.valid?
            render :new, locals: {
              page: Administrate::Page::Form.new(dashboard, contribution)
            }, status: :unprocessable_entity

            return
          end

          next if contribution.save
        end
      end

      redirect_to admin_contributions_path, notice: 'Contributions created successfully.'
    end

    def update
      resource_params.delete("date_from")
      resource_params.delete("date_to")

      super
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
     def resource_params
       params.require(:contribution).permit(:user_id, :amount, :date_from, :date_to, :receipt_number, :document)
        #  permit(dashboard.permitted_attributes(action_name)).
        #  transform_values { |value| value == "" ? nil : value }
     end

    # See https://administrate-demo.herokuapp.com/customizing_controller_actions
    # for more information



    private
    def check_receipt_number
      if resource_params["receipt_number"]
        dummy_contribution.errors.add(:base, "No receipt number.")
      end
    end

    def check_amount
      if resource_params["amount"]
        dummy_contribution.errors.add(:base, "No amount.")
      end
    end

  end
end
