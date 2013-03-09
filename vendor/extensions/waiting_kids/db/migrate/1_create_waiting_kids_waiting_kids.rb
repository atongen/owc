class CreateWaitingKidsWaitingKids < ActiveRecord::Migration

  def up
    create_table :refinery_waiting_kids do |t|
      t.string :title
      t.text :summary
      t.text :body
      t.integer :picture_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-waiting_kids"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/waiting_kids/waiting_kids"})
    end

    drop_table :refinery_waiting_kids

  end

end
