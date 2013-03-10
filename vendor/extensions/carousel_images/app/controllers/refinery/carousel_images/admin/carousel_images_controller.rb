module Refinery
  module CarouselImages
    module Admin
      class CarouselImagesController < ::Refinery::AdminController

        crudify :'refinery/carousel_images/carousel_image', :xhr_paging => true

      end
    end
  end
end
