module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :summary, :body, :start_date, :end_date, :pdf_link_id, :category_type, :position

      acts_as_indexed :fields => [:title, :summary, :body, :category_type]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :pdf_link, :class_name => '::Refinery::Resource'
    end
  end
end
