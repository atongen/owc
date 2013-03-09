module Refinery
  module WaitingKids
    module Admin
      class WaitingKidsController < ::Refinery::AdminController

        crudify :'refinery/waiting_kids/waiting_kid', :xhr_paging => true

      end
    end
  end
end
