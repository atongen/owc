# This migration comes from refinery_featured_items (originally 1)
class CreateFeaturedItemsFeaturedItems < ActiveRecord::Migration

  def up
    create_table :refinery_featured_items do |t|
      t.string :title
      t.string :model
      t.integer :model_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-featured_items"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/featured_items/featured_items"})
    end

    drop_table :refinery_featured_items

  end

end
