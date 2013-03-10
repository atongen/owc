class AddRenameTypeFieldOnStaff < ActiveRecord::Migration
  def up 
    rename_column :refinery_staffs, :type, :staff_type
  end

  def down
    rename_column :refinery_staffs, :staff_type, :type
  end
end
