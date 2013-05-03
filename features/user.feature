Feature: User
  Scenario: User can register as gift card for a recipient
     Given I login into the app
     And I go to my dashboard
     And I register a new gift card
     And I fill in the gift card fields
     When I click submit I create a gift card 
     Then the page should contain this text: Motoko's Tea Shop
     Then the page should contain this text: $45.00
     Then the page should contain this text: kaoru@su.org
     Then the page should contain this text: kaoru
     Then the page should contain this text: su



