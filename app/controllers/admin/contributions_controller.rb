module Admin
  class ContributionsController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    def create
      date_from = Date.parse(resource_params["date_from"])
      date_to = Date.parse(resource_params["date_to"])
      date_range = date_from..date_to

      date_months = date_range.map{|date| Date.new(date.year, date.month)}.uniq
      ActiveRecord::Base.transaction do
        date_months.each do |date|
          Contribution.create!(
            user_id: resource_params["user_id"],
            amount: resource_params["amount"],
            month: date,
            document: resource_params["document"],
            receipt_number: resource_params["receipt_number"] 
          )
        end 
        redirect_to action: "index"
      end
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
  end
end
