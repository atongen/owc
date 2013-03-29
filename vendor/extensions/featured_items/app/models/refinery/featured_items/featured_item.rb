module Refinery
  module FeaturedItems
    class FeaturedItem < Refinery::Core::BaseModel
      self.table_name = 'refinery_featured_items'

      attr_accessible :title, :model, :model_id, :position, :callout_text, :callout_summary

      acts_as_indexed :fields => [:title, :model]

      validates :title, :presence => true, :uniqueness => true

      validates :callout_text,
        :length => {
          :maximum => 255
        }

      validates :callout_summary,
        :length => {
          :maximum => 255
        }
    end
  end
end
