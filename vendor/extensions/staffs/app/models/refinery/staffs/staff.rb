module Refinery
  module Staffs
    class Staff < Refinery::Core::BaseModel
      self.table_name = 'refinery_staffs'

      attr_accessible :full_name, :title, :email, :picture_id, :position, :staff_type, :summary

      acts_as_indexed :fields => [:full_name, :title, :email]

      validates :full_name, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'

      default_scope(order(:position))

      [:full_name, :title, :email, :summary].each do |attr|
        validates attr, :length => { :maximum => 255 }
      end

      def staff?
        staff_type ==  'Staff'
      end

      def board?
        staff_type == 'Board'
      end
    end
  end
end
