class AddTitleToWaitingFamilies < ActiveRecord::Migration
  def up
    add_column :refinery_waiting_families, :title, :string
  end

  def down
    remove_column :refinery_waiting_families, :title
  end
end
