class AddStateToInquiry < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :contact_state, :string
  end
end
