Given /^I login into the app$/ do
  email = "eyor@winnie.com"
  password =  "mooomooo"

  FactoryGirl.create(:user, email: email, password: password)
  visit '/'
  click_on("sign in")
  fill_in("user_email", with: email)
  fill_in("user_password", with: password)
  click_button("Sign in")
end

And /^I go to my dashboard$/ do
  click_link("My Dashboard")
end

And /^I register a new gift card$/ do
  click_link("gift card")
end

And /^I fill in the gift card fields$/ do
  vendor = "Motoko's Tea Shop"
  description = "Very good tea. You should try some, buddy!"
  card_value = "45.0"
  email = "kaoru@su.org"
  first_name = "kaoru"
  last_name = "su"

  fill_in("gift_card_vendor", with: vendor)
  fill_in("gift_card_description", with: description)
  fill_in("gift_card_card_value", with: card_value)
  fill_in("gift_card_recipient_email", with: email)
  fill_in("gift_card_recipient_first_name", with: first_name)
  fill_in("gift_card_recipient_last_name", with: last_name)
end

When /^I click submit I create a gift card$/ do
  click_button("Create Gift card")
end

Then /^the page should contain this text: (.*)$/ do |text|
  page.should have_content(text)
end

Then /^the user has registered (\d*) gift cards$/ do |number|
  text = "You have registered #{number} gift cards."
  page.should have_content(text)
end
