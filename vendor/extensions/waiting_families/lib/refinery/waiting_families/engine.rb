module Refinery
  module WaitingFamilies
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::WaitingFamilies

      engine_name :refinery_waiting_families

      initializer "register refinerycms_waiting_families plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "waiting_families"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.waiting_families_admin_waiting_families_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/waiting_families/waiting_family'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::WaitingFamilies)
      end
    end
  end
end
