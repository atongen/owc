module Refinery
  module WaitingFamilies
    module Admin
      class WaitingFamiliesController < ::Refinery::AdminController

        crudify :'refinery/waiting_families/waiting_family', :xhr_paging => true

      end
    end
  end
end
