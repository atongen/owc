
FactoryGirl.define do
  factory :carousel_image, :class => Refinery::CarouselImages::CarouselImage do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

