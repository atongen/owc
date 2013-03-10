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
          :link => dynamic_link_for(data),
          :type => data.class.name.demodulize.underscore.humanize.titlecase
        }
      end
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
    elsif pageUrl.include? "about_us"
      return 'dark green'
    elsif pageUrl.include? "get-involved"
      return 'gold'
    elsif pageUrl.include? "events"
      return 'blue'
    else
      return 'purple'
    end
  end

  def site_section_class
    @page.link_url.to_s.split("/").select(&:present?).first
  end
end
