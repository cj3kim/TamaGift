class GiftCardsController < ApplicationController
  def index
    @gift_cards = current_user.gift_cards
  end

  def new
    @gift_card = current_user.gift_cards.build
  end

  def create
    @gift_card = GiftCard.new(params[:gift_card])
    @gift_card.user = current_user
    
    if @gift_card.save
      flash[:notice] = "Thanks for registering your gift card!"
      redirect_to user_gift_cards_path(current_user)
    else
      flash[:notice] = "Sorry. Your gift card did not register"
      redirect_to user_gift_cards_path(current_user)
    end
  end

end
