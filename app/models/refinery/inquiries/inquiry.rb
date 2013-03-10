module Refinery
  module Inquiries
    class Inquiry < Refinery::Core::BaseModel

      filters_spam :message_field => :message,
                   :email_field => :email,
                   :author_field => :name,
                   :other_fields => [:phone],
                   #:secondary_phone, :info_place_baby, :info_adopt_child, :info_other, :info_other_message, :contact_street, :contact_city, :contact_state, :contact_state, :contact_zip
                   :extra_spam_words => %w()

      validates_presence_of :name, :message
      validates :email, :format=> { :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
      validates :phone, :format=> { :with => //}
      validate :information_selection
      validate :other_information_selection
      validate :exit_question_selection
      validate :exit_question_other_selection

      acts_as_indexed :fields => [:name, :email, :message, :phone, :phone, :info_other_message,
                                  :contact_street, :contact_city, :contact_state, :contact_zip,
                                  :exit_question_other_message]

      default_scope :order => 'created_at DESC'

      attr_accessible :name, :phone, :message, :email, :contact_secondary_phone, :info_pregnancy_support, :info_adopt_child, :info_other,
                      :info_other_message, :info_volunteering, :contact_street, :contact_city, :contact_state, :contact_state, :contact_zip,
                      :exit_question_web, :exit_question_referral, :exit_question_advertisement, :exit_question_other, :exit_question_other_message

      def self.latest(number = 7, include_spam = false)
        include_spam ? limit(number) : ham.limit(number)
      end
      
      def information_selection
        errors.add(:information_request, 'type must be selected.') unless self.info_pregnancy_support? | self.info_adopt_child? | self.info_volunteering? | self.info_other?
      end
      
      def other_information_selection
        errors.add(:other_information, 'field must be completed.') unless self.info_other_message?
      end
      
      def exit_question_selection
        errors.add(:how, 'did you hear about us section must be completed.') unless self.exit_question_web? | self.exit_question_referral? | self.exit_question_advertisement? | self.exit_question_other?
      end
      
      def exit_question_other_selection
        errors.add(:how, 'did you hear about us \"Other\" section must be completed.') unless self.exit_question_other_message?
      end
      
      def requested_info_fields
        x = []
        x.push("Pregnancy Support") if self.info_pregnancy_support?
        x.push("Adopting a Child") if self.info_adopt_child?
        x.push("Volunteering") if self.info_volunteering?
        x.push("Other Info") if self.info_other?
        x.join(" | ")
      end

    end
  end
end