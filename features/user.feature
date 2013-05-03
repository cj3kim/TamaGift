Feature: User
  Scenario: User can register as gift card for a recipient
     Given I login into the app
     And I go to my dashboard
     And I register a new gift card
     And I fill in the gift card fields
     When I click submit
     Then I am redirected to my dashboard



