# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift_card do |f|
    f.vendor nil
    f.card_value nil
    f.card_code nil
    f.recipient_email nil
    f.recipient_first_name nil
    f.recipient_last_name nil
  end
end
