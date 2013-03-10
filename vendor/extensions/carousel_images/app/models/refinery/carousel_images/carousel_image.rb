module Refinery
  module CarouselImages
    class CarouselImage < Refinery::Core::BaseModel
      self.table_name = 'refinery_carousel_images'

      attr_accessible :title, :page_id, :copy, :picture_id, :position, :color

      acts_as_indexed :fields => [:title, :copy]

      validates :title, :presence => true, :uniqueness => true
      validates :color, :presence => { :message => 'must be selected' }

      belongs_to :picture, :class_name => '::Refinery::Image'
      belongs_to :page, :class_name => '::Refinery::Page'

      def css_class
        picture.present? ? "#{color}" : "no-image #{color}"
      end
    end

    def self.colors
      [
        ['purple', '#a854a1'],
        ['gold', '#ffc749'],
        ['green', '#b7d433'],
        ['blue', '#00aeef'],
        ['orange', '#e86f15']
      ]
    end
  end
end
