recipients = ENV['EXCEPTION_RECIPIENTS'].to_s.split(/[\s,]+/).map(&:strip).select(&:present?)
unless recipients.blank? || ENV['MAIL_FROM'].blank?
  Owc::Application.config.middleware.use ExceptionNotifier,
      :email_prefix => "[OWC-#{Rails.env}] ",
      :sender_address => %{"Exception Notifier" <#{ENV['MAIL_FROM']}>},
      :exception_recipients => recipients
end
