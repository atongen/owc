# This migration comes from refinery_staffs (originally 20130323184252)
class AddDescriptionToStaffs < ActiveRecord::Migration
  def change
    add_column :refinery_staffs, :summary, :string
    add_column :refinery_staffs, :body, :string
  end
end
