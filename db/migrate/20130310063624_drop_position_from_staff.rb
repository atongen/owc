class DropPositionFromStaff < ActiveRecord::Migration
  def up
    remove_column :refinery_staffs, :employment_position
  end

  def down
    add_column :refinery_staffs, :employment_position, :string
  end
end
