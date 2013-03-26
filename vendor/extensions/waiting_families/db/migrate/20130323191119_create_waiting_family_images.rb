class CreateWaitingFamilyImages < ActiveRecord::Migration
  def up
    create_table :refinery_waiting_family_images do |t|
      t.integer :waiting_family_id, :null => false
      t.integer :image_id, :null => false
      t.integer :position, :null => false, :default => 0
      t.string :caption
    end
    add_index :refinery_waiting_family_images, :waiting_family_id
    add_index :refinery_waiting_family_images, :image_id
  end

  def down
    drop_table :refinery_waiting_family_images
  end
end
