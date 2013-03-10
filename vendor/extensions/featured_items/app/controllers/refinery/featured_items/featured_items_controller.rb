module Refinery
  module FeaturedItems
    class FeaturedItemsController < ::ApplicationController

      before_filter :find_all_featured_items
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @featured_item in the line below:
        present(@page)
      end

      def show
        @featured_item = FeaturedItem.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @featured_item in the line below:
        present(@page)
      end

    protected

      def find_all_featured_items
        @featured_items = FeaturedItem.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/featured_items").first
      end

    end
  end
end
