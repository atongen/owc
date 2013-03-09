module Refinery
  module WaitingFamilies
    class WaitingFamiliesController < ::ApplicationController

      before_filter :find_all_waiting_families
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @waiting_family in the line below:
        present(@page)
      end

      def show
        @waiting_family = WaitingFamily.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @waiting_family in the line below:
        present(@page)
      end

    protected

      def find_all_waiting_families
        @waiting_families = WaitingFamily.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/waiting_families").first
      end

    end
  end
end
