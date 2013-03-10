class CreateEventsEventImages < ActiveRecord::Migration
  create_table Refinery::Events::EventImage.table_name do |t|
      t.integer :image_id
      t.integer :event_id
      t.integer :position
      t.string :caption
    end

    add_index Refinery::Events::EventImage.table_name, :image_id
    add_index Refinery::Events::EventImage.table_name, :event_id

end
