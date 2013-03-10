class AddCustomFieldsToInquiry < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :info_place_baby, :boolean
    add_column :refinery_inquiries_inquiries, :info_adopt_child, :boolean
    add_column :refinery_inquiries_inquiries, :info_other, :boolean
    add_column :refinery_inquiries_inquiries, :info_other_message, :text
    add_column :refinery_inquiries_inquiries, :contact_street, :string
    add_column :refinery_inquiries_inquiries, :contact_city, :string
    add_column :refinery_inquiries_inquiries, :contact_zip, :string
    add_column :refinery_inquiries_inquiries, :contact_secondary_phone, :string
  end
end
