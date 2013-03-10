module Refinery
  module FeaturedItems
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::FeaturedItems

      engine_name :refinery_featured_items

      initializer "register refinerycms_featured_items plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "featured_items"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.featured_items_admin_featured_items_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/featured_items/featured_item'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::FeaturedItems)
      end
    end
  end
end
