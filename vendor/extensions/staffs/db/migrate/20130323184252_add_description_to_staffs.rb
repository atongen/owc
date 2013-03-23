class AddDescriptionToStaffs < ActiveRecord::Migration
  def change
    add_column :refinery_staffs, :summary, :string
    add_column :refinery_staffs, :body, :string
  end
end
