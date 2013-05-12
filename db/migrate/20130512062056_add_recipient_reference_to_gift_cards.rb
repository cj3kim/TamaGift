class AddRecipientReferenceToGiftCards < ActiveRecord::Migration
  def change
    add_column :gift_cards, :recipient_id, :integer, references: :recipients
  end
end
