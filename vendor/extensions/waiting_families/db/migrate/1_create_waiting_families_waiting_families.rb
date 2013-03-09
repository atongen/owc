class CreateWaitingFamiliesWaitingFamilies < ActiveRecord::Migration

  def up
    create_table :refinery_waiting_families do |t|
      t.text :summary
      t.text :description
      t.integer :picture_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-waiting_families"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/waiting_families/waiting_families"})
    end

    drop_table :refinery_waiting_families

  end

end
