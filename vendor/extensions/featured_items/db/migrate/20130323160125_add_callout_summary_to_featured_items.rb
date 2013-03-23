class AddCalloutSummaryToFeaturedItems < ActiveRecord::Migration
  def change
    add_column :refinery_featured_items, :callout_summary, :string
  end
end
