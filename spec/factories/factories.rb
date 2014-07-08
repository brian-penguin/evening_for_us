FactoryGirl.define do
  factory :number do
    name {Faker::Name.first_name}
    mobile_number {Faker::Number.number(10)}
  end
end
