module Refinery
  module Staffs
    class StaffsController < ::ApplicationController

      def index
        @staffs = Staff.where(:staff_type => 'Staff')
        @page_header_text = "Our Staff"
        @page = ::Refinery::Page.where(:link_url => "/staff").first
        render :action => "index"
      end

      def board
        # get all board members
        @staffs = Staff.where(:staff_type => 'Board')
        @page_header_text = "Board Members"
        @page = ::Refinery::Page.where(:link_url => "/staff/board").first
        render :action => "index"
      end

    end
  end
end
