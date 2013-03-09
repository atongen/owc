module Refinery
  module WaitingKids
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::WaitingKids

      engine_name :refinery_waiting_kids

      initializer "register refinerycms_waiting_kids plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "waiting_kids"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.waiting_kids_admin_waiting_kids_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/waiting_kids/waiting_kid'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::WaitingKids)
      end
    end
  end
end
