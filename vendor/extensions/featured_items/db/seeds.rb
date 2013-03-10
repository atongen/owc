(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-featured_items').blank?
        user.plugins.create(:name => 'refinerycms-featured_items',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/featured_items"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Featured Items',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end

  unless Refinery::FeaturedItems::FeaturedItem.any?
    (1..3).each do |i|
      Refinery::FeaturedItems::FeaturedItem.create(
        :title => "Featured Item #{i}",
        :model => '',
        :model_id => 0,
        :position => i - 1
      )
    end
  end
end
