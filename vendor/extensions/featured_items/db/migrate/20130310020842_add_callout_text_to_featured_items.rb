class AddCalloutTextToFeaturedItems < ActiveRecord::Migration
  def change
    add_column :refinery_featured_items, :callout_text, :string
  end
end
