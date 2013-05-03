class AddDescriptionToGiftCard < ActiveRecord::Migration
  def change
     add_column :gift_cards, :description, :text
  end
end
