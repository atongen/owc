module Refinery
  module WaitingFamilies
    class WaitingFamilyImage < Refinery::Core::BaseModel
      self.table_name = 'refinery_waiting_family_images'

      attr_accessible :image_id, :position, :caption

      belongs_to :waiting_family
      belongs_to :image,
        :class_name => "::Refinery::Image"

      validates :waiting_family_id,
        :presence => true
      validates :image_id,
        :presence => true
    end
  end
end
