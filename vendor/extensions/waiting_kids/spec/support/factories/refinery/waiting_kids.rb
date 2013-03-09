
FactoryGirl.define do
  factory :waiting_kid, :class => Refinery::WaitingKids::WaitingKid do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

