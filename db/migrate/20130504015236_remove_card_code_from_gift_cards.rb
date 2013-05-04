class RemoveCardCodeFromGiftCards < ActiveRecord::Migration
  def up
    remove_column :gift_cards, :card_code
  end

  def down
    add_column :gift_cards, :card_code, :string
  end
end
