# This migration comes from refinery_featured_items (originally 20130310020842)
class AddCalloutTextToFeaturedItems < ActiveRecord::Migration
  def change
    add_column :refinery_featured_items, :callout_text, :string
  end
end
