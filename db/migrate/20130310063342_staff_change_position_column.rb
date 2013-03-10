class StaffChangePositionColumn < ActiveRecord::Migration
  def up 
    rename_column :refinery_staffs, :position, :employment_position
  end

  def down
    rename_column :refinery_staffs, :employment_position, :position
  end
end
