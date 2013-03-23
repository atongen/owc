module Refinery
  module WaitingFamilies
    class WaitingFamily < Refinery::Core::BaseModel
      self.table_name = 'refinery_waiting_families'

      attr_accessible :title, :summary, :body, :picture_id, :position, :detailed_information, :images_attributes

      acts_as_indexed :fields => [:summary, :body]

      validates :summary, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'

      has_many :waiting_family_images,
        :order => 'position ASC',
        :dependent => :destroy
      has_many :images,
        :through => :waiting_family_images

      accepts_nested_attributes_for :images,
        :allow_destroy => false

      def all_images
        ([picture] + images.all).compact
      end

      def images_attributes=(data)
        ids_to_keep = data.map{|i, d| d['waiting_family_image_id']}.compact

        waiting_family_images_to_delete = if ids_to_keep.empty?
                                  self.waiting_family_images
                                else
                                  self.waiting_family_images.where(
                                    Refinery::WaitingFamilies::WaitingFamilyImage.arel_table[:id].not_in(ids_to_keep)
                                  )
                                end

        waiting_family_images_to_delete.destroy_all

        data.each do |i, image_data|
          waiting_family_image_id, image_id, caption =
            image_data.values_at('waiting_family_image_id', 'id', 'caption')

          next if image_id.blank?

          waiting_family_image = if waiting_family_image_id.present?
                         self.waiting_family_images.find(waiting_family_image_id)
                       else
                         self.waiting_family_images.build(:image_id => image_id)
                       end

          waiting_family_image.position = i
          waiting_family_image.caption = caption
          waiting_family_image.save
        end
      end

      def caption_for_image_index(index)
        self.waiting_family_images[index].try(:caption).presence || ""
      end

      def image_waiting_family_id_for_image_index(index)
        self.waiting_family_images[index].try(:id)
      end

    end
  end
end
