module Refinery
  module Staffs
    class Staff < Refinery::Core::BaseModel
      self.table_name = 'refinery_staffs'

      attr_accessible :full_name, :title, :email, :picture_id, :position

      acts_as_indexed :fields => [:full_name, :title, :email]

      validates :full_name, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end