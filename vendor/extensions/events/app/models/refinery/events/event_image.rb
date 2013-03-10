module Refinery
  module Events
    class EventImage < Refinery::Core::BaseModel
      self.table_name = 'refinery_event_images'

      belongs_to :image
      belongs_to :event

      attr_accessible :image_id, :position


    end
  end
end
