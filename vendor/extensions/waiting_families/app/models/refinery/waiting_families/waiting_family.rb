module Refinery
  module WaitingFamilies
    class WaitingFamily < Refinery::Core::BaseModel
      self.table_name = 'refinery_waiting_families'

      attr_accessible :title, :summary, :body, :picture_id, :position

      acts_as_indexed :fields => [:summary, :body]

      validates :summary, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end
