module Refinery
  module WaitingKids
    class WaitingKid < Refinery::Core::BaseModel
      self.table_name = 'refinery_waiting_kids'

      attr_accessible :title, :summary, :body, :picture_id, :position

      acts_as_indexed :fields => [:title, :summary, :body]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end
