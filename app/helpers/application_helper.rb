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
          :picture => featured_item_picture(data),
          :title => data.title,
          :link => dynamic_link_for(data),
          :type => data.class.name.demodulize.underscore.humanize.titlecase,
          :summary => item.callout_summary
        }
      end
    end
  end

  def featured_item_picture(featured_item)
    if featured_item.respond_to?(:picture)
      featured_item.picture
    elsif featured_item.respond_to?(:images)
      featured_item.images.first
    end
  end

  def carousel_images
    Refinery::CarouselImages::CarouselImage.order(:position).all
  end

  def facebook_url
    Refinery::Setting.find_or_set(:facebook_url, nil)
  end

  def twitter_url
    Refinery::Setting.find_or_set(:twitter_url, nil)
  end

  def youtube_url
    Refinery::Setting.find_or_set(:youtube_url, nil)
  end

  # change this to contains
  def get_page_color pageUrl
    if pageUrl.include? "pregnant"
      return 'purple'
    elsif pageUrl.include? "adopting"
      return 'green'
    elsif pageUrl.include? "support"
      return 'orange'
    else
      'blue'
    end
  end

  def get_callout_class(callout_type)
    case callout_type.downcase
    when 'waiting family'
      'green'
    when 'waiting kid'
      'green'
    when 'event'
      'blue'
    else
      'blue'
    end
  end

  def get_callout_name(callout_type)
    case callout_type.downcase
    when 'waiting family'
      'ADOPTING'
    when 'waiting kid'
      'ADOPTING'
    when 'event'
      'EVENT'
    else
      'ADOPTING'
    end
  end

  def site_section_class
    section = url_for(@page.url).to_s.split("/").select(&:present?).first || 'about-us'
    case section
    when 'waiting_kids';               'adopting'
    when 'waiting_families';           'pregnant'
    when 'staff', 'staffs', 'contact'; 'about-us'
    else; section
    end
  end
end
