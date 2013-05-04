require 'spec_helper'

describe GiftCard do

  let!(:user) { FactoryGirl.create(:user, email: "bak@choy.com", password: "asdfasdfasdfa") }
  let(:starbucks_gift_card) do 
    FactoryGirl.create(:gift_card,
                       vendor: "Starbucks",
                       card_value: 2000,
                       card_code: nil ,
                       recipient_email: "narusegawa@tokyo.edu",
                       recipient_first_name: "Naru",
                       recipient_last_name: "Narusegawa",
                       user: user)
  end

  let(:turtle_gift_card) { FactoryGirl.create(:gift_card, vendor: "Tamaland", card_value: 2000, user: user) }

  describe "#pennies_to_dollars" do
    it "returns a float representation of pennies in dollars" do
      pennies = 5000
      dollars = 50.0
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

      pennies = 2012
      dollars = 20.12
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

      pennies = 3050
      dollars = 30.5
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

      pennies = "4050"
      dollars = 40.5
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

      pennies = "4000"
      dollars = 40.0
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

      pennies = 40
      dollars = 0.40
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

    end
  end

  describe "dollars_to_pennies" do
    it "returns and integer representation of dollars in pennies" do
      dollars = "10.53"
      pennies = 1053

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = 20.23
      pennies = 2023

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = 19.0
      pennies = 1900

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = "19.0"
      pennies = 1900

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = 0.04
      pennies = 4

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = ".04"
      pennies = 4

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

    end
  end
end
