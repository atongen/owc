module Refinery
  module FeaturedItems
    class FeaturedItem < Refinery::Core::BaseModel
      self.table_name = 'refinery_featured_items'

      attr_accessible :title, :model, :model_id, :position, :callout_text

      acts_as_indexed :fields => [:title, :model]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
