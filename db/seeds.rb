# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed

# Added by Refinery CMS Inquiries engine
Refinery::Inquiries::Engine.load_seed

# Added by Refinery CMS Search engine
Refinery::Search::Engine.load_seed

# Load the seed file specific to this environment if it exists
# This should be last!
seed_env_file = Rails.root.join('db', 'seeds', "#{Rails.env}.rb").to_s
if File.file?(seed_env_file)
  puts "Seeding #{Rails.env} environment."
  require seed_env_file
end

# Added by Refinery CMS Waiting Families extension
Refinery::WaitingFamilies::Engine.load_seed
# Added by Refinery CMS Waiting Kids extension
Refinery::WaitingKids::Engine.load_seed
