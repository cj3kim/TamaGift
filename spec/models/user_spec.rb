require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user, email: "bak@choy.com", password: "asdfasdfasdfa") }

  let!(:gift_one) { FactoryGirl.create(:gift_card, user: user) }
  let!(:gift_two) { FactoryGirl.create(:gift_card, user: user) }
  let!(:gift_three) { FactoryGirl.create(:gift_card, user: user) }
  #gift four and five's execution is deferred until it's called in an It block
  let(:gift_four) { FactoryGirl.create(:gift_card, user: user) }
  let(:gift_five) { FactoryGirl.create(:gift_card, user: user) }

  describe "#count_of_gift_cards" do
    it "retrieves the amount of gift cards a user has registered" do
      user.count_of_gift_cards.should == 3

      gift_four

      user.count_of_gift_cards.should == 4

      gift_five

      user.count_of_gift_cards.should == 5
    end
  end
end
