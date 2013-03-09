class RenameDescriptionToBodyForWaitingFamilies < ActiveRecord::Migration
  def up
    rename_column :refinery_waiting_families, :description, :body
  end

  def down
    rename_column :refinery_waiting_families, :body, :description
  end
end
