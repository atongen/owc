module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :summary, :body, :start_date, :end_date, :pdf_link_id, :category_type, :position, :images_attributes

      acts_as_indexed :fields => [:title, :summary, :body, :category_type]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :pdf_link, :class_name => '::Refinery::Resource'

      has_many :event_images,
        :order => 'position ASC',
        :dependent => :destroy
      has_many :images,
        :through => :event_images

      accepts_nested_attributes_for :images,
        :allow_destroy => false

      def images_attributes=(data)
        ids_to_keep = data.map{|i, d| d['event_image_id']}.compact

        event_images_to_delete = if ids_to_keep.empty?
                                  self.event_images
                                else
                                  self.event_images.where(
                                    Refinery::Events::EventImage.arel_table[:id].not_in(ids_to_keep)
                                  )
                                end

        event_images_to_delete.destroy_all

        data.each do |i, image_data|
          event_image_id, image_id, caption =
            image_data.values_at('event_image_id', 'id', 'caption')

          next if image_id.blank?

          event_image = if event_image_id.present?
                         self.event_images.find(event_image_id)
                       else
                         self.event_images.build(:image_id => image_id)
                       end

          event_image.position = i
          event_image.caption = caption
          event_image.save
        end
      end

      def caption_for_image_index(index)
        self.event_images[index].try(:caption).presence || ""
      end

      def image_event_id_for_image_index(index)
        self.event_images[index].try(:id)
      end

    end
  end
end
