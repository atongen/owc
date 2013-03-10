module Refinery
  module Staffs
    class StaffsController < ::ApplicationController

      before_filter :find_all_staffs
      before_filter :find_page

      def index
        @staffs = Staff.where(:staff_type => 'staff')
        render :action => "index"
      end

      def board
        # get all board members
        @staffs = Staff.where(:staff_type => 'board')
        render :action => "index"
      end

    protected
    
      def find_all_staffs
        @staffs = Staff.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/staffs").first
      end

    end
  end
end
