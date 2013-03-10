module ApplicationHelper
  include ::FeaturedItemsHelper

  def dynamic_link_for(item)
    method = item.class.name.underscore.gsub(/refinery\//, '').gsub(/\//, '_')
    Refinery::Core::Engine.routes.url_helpers.send("#{method}_url".to_s, item, :only_path => true)
  end

  def featured_items
    Refinery::FeaturedItems::FeaturedItem.order(:position).all.map do |item|
      model = namespaced_model(item.model)
      data = model.where(:id => item.model_id).first if model.present?

      if data.present?
        {
          :text => item.callout_text,
          :picture => data.picture,
          :title => data.title,
          :link => dynamic_link_for(data)
        }
      end
    end
  end

  # change this to contains
  def get_page_color pageUrl
    if pageUrl.include? "pregnant"
      return 'purple'
    elsif pageUrl.include? "adopting"
      return ''
    elsif pageUrl.include? "support"
      return ''
    elsif pageUrl.include? "about_us"
      return ''
    elsif pageUrl.include? "get_involved"
      return ''
    elsif pageUrl.include? "events"
      return ''
    else
      return 'purple'
    end
  end
end
