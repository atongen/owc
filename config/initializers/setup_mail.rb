opts = %w{
  address
  port
  domain
  user_name
  password
  authenication
  enable_starttls_auto
}.each_with_object do |opts, k|
  key = "SMTP_#{k.upcase}"
  opts[key.to_sym] = ENV[key] if ENV[key].present?
end

if opts.present?
  ActionMailer::Base.smtp_settings = opts
end
