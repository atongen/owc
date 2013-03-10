module Refinery
  module Inquiries
    class Inquiry < Refinery::Core::BaseModel

      filters_spam :message_field => :message,
                   :email_field => :email,
                   :author_field => :name,
                   :other_fields => [:phone],
                   #:secondary_phone, :info_place_baby, :info_adopt_child, :info_other, :info_other_message, :contact_street, :contact_city, :contact_state, :contact_state, :contact_zip
                   :extra_spam_words => %w()

      validates_presence_of :name, :message, :phone
      validates :email, :format=> { :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
      validates :contact_zip, :format=> { :with => /^\d{5}(?:[-\s]\d{4})?$/}

      acts_as_indexed :fields => [:name, :email, :message, :phone, :phone, :info_other_message,
                                  :contact_street, :contact_city, :contact_state, :contact_zip]

      default_scope :order => 'created_at DESC'

      attr_accessible :name, :phone, :message, :email, :secondary_phone, :info_place_baby, :info_adopt_child, :info_other,
                      :info_other_message, :contact_street, :contact_city, :contact_state, :contact_state, :contact_zip

      def self.latest(number = 7, include_spam = false)
        include_spam ? limit(number) : ham.limit(number)
      end

    end
  end
end