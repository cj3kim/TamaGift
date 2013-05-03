# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.email nil
    f.first_name nil
    f.last_name nil
    f.dob nil
  end
end
