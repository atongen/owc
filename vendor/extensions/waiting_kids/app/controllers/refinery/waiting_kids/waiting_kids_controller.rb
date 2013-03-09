module Refinery
  module WaitingKids
    class WaitingKidsController < ::ApplicationController

      before_filter :find_all_waiting_kids
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @waiting_kid in the line below:
        present(@page)
      end

      def show
        @waiting_kid = WaitingKid.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @waiting_kid in the line below:
        present(@page)
      end

    protected

      def find_all_waiting_kids
        @waiting_kids = WaitingKid.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/waiting_kids").first
      end

    end
  end
end
