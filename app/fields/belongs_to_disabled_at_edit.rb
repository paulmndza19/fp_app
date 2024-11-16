class BelongsToDisabledAtEdit < Administrate::Field::BelongsTo
  def self.permitted_attribute(attr, options = {})
    resource_class = options[:resource_class]
    if resource_class
      foreign_key_for(resource_class, attr)
    else
      Administrate.warn_of_missing_resource_class
      :"#{attr}_id"
    end
  end

  def self.eager_load?
    true
  end

  def html_controller
    "select"
  end

  def permitted_attribute
    foreign_key
  end

  def associated_resource_options
    candidate_resources.map do |resource|
      [
        display_candidate_resource(resource),
        resource.send(association_primary_key)
      ]
    end
  end

  def selected_option
    data&.send(association_primary_key)
  end

  def include_blank_option
    options.fetch(:include_blank, true)
  end

  private

  def candidate_resources
    scope =
      if options[:scope]
        options[:scope].arity.positive? ? options[:scope].call(self) : options[:scope].call
      else
        associated_class.all
      end

    order = options.delete(:order)
    order ? scope.reorder(order) : scope
  end

  def display_candidate_resource(resource)
    associated_dashboard.display_resource(resource)
  end
end