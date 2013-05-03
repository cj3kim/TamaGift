class GiftCardsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @gift_cards = @user.gift_cards
  end

  def buy_gift_card
  end
end
