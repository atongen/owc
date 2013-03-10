
FactoryGirl.define do
  factory :staff, :class => Refinery::Staffs::Staff do
    sequence(:full_name) { |n| "refinery#{n}" }
  end
end

