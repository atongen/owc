opts = %w{
  address
  port
  domain
  user_name
  password
  authenication
  enable_starttls_auto
}.each_with_object({}) do |k,opts|
  key = "SMTP_#{k.upcase}"
  opts[k.to_sym] = ENV[key] if ENV[key].present?
end

if opts.present?
  ActionMailer::Base.smtp_settings = opts
end
