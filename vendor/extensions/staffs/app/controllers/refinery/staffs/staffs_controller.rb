module Refinery
  module Staffs
    class StaffsController < ::ApplicationController

      before_filter :find_all_staffs
      before_filter :find_page

      def index
        @staffs = Staff.where(:staff_type => 'Staff')
        set_page_header
        render :action => "index"
      end

      def board
        # get all board members
        @staffs = Staff.where(:staff_type => 'Board')
        set_page_header
        render :action => "index"
      end

    protected
    
      def find_all_staffs
        @staffs = Staff.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/staffs").first
      end

      def set_page_header
        if @staffs.first != nil && @staffs.first.staff_type == 'Staff'
          @page_header_text = "Our Staff"
        else
          @page_header_text = "Board Members"
        end           
      end

    end
  end
end
