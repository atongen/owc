module Refinery
  module FeaturedItems
    module Admin
      module FeaturedItemsHelper
        def featured_info(item)
          return "None" if item.model.blank? or item.model_id == 0
          model = namespaced_model(item.model)
          return "None" if model.nil?
          data = model.where(:id => item.model_id).first
          return "None" if data.nil?

          data.title
        end

        def namespaced_model(model)
          return nil if model.blank?
          "Refinery::#{model.pluralize}::#{model}".constantize rescue nil
        end
      end
    end
  end
end