module Refinery
  module CarouselImages
    class CarouselImagesController < ::ApplicationController

      before_filter :find_all_carousel_images
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @carousel_image in the line below:
        present(@page)
      end

      def show
        @carousel_image = CarouselImage.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @carousel_image in the line below:
        present(@page)
      end

    protected

      def find_all_carousel_images
        @carousel_images = CarouselImage.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/carousel_images").first
      end

    end
  end
end
