
FactoryGirl.define do
  factory :featured_item, :class => Refinery::FeaturedItems::FeaturedItem do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

