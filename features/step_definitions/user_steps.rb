Given /^I login into the app$/ do
  email = "eyor@winnie.com"
  password =  "mooomooo"

  FactoryGirl.create(:user, email: email, password: password)
  visit '/'
  click_on("sign in")
  fill_in("user_email", with: email)
  fill_in("user_password", with: password)
  click_button("Sign in")

  save_and_open_page
end

And /^I go to my dashboard$/ do

end

And /^I register a new gift card$/ do

end

And /^I fill in the gift card fields$/ do

end

When /^I click submit$/ do

end

Then /^I am redirected to my dashboard$/ do

end
