class AddAdditionsToInquiry < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :info_pregnancy_support, :boolean
    add_column :refinery_inquiries_inquiries, :info_volunteering, :boolean
    add_column :refinery_inquiries_inquiries, :exit_question_web, :boolean
    add_column :refinery_inquiries_inquiries, :exit_question_referral, :boolean
    add_column :refinery_inquiries_inquiries, :exit_question_advertisement, :boolean
    add_column :refinery_inquiries_inquiries, :exit_question_other, :boolean
    add_column :refinery_inquiries_inquiries, :exit_question_other_message, :string
  end
end
