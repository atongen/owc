class AddDetailInformationToWorkingFamily < ActiveRecord::Migration
  def up
    add_column :refinery_waiting_families, :detailed_information, :text
  end

  def down
    remove_column :refinery_waiting_families, :detailed_information
  end
end
