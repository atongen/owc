# This migration comes from refinery_featured_items (originally 20130323160125)
class AddCalloutSummaryToFeaturedItems < ActiveRecord::Migration
  def change
    add_column :refinery_featured_items, :callout_summary, :string
  end
end
