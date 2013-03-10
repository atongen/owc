module Refinery
  module CarouselImages
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::CarouselImages

      engine_name :refinery_carousel_images

      initializer "register refinerycms_carousel_images plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "carousel_images"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.carousel_images_admin_carousel_images_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/carousel_images/carousel_image'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CarouselImages)
      end
    end
  end
end
