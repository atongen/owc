class AddTypeToStaff < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :type, :string
  end

  def down
    remove_column :refinery_staffs, :type
  end
end
