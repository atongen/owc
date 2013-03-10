module ApplicationHelper
  include ::FeaturedItemsHelper

  def featured_items
    Refinery::FeaturedItems::FeaturedItem.order(:position).all.map do |item|
      model = namespaced_model(item.model)
      data = model.where(:id => item.model_id).first if model.present?
      if data.present?
        {
          :text => item.callout_text,
          :picture => data.picture,
          :title => data.title,
          :link => "/#{data.class.name.demodulize.underscore.pluralize}/#{data.id}"  #Andrew Tongen did this
        }
      end
    end
  end
end
