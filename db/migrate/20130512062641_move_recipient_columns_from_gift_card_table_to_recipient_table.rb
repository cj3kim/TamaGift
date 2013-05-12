class MoveRecipientColumnsFromGiftCardTableToRecipientTable < ActiveRecord::Migration
  def up
    execute "INSERT INTO recipients (email, first_name, last_name, created_at, updated_at) SELECT recipient_email, recipient_first_name, recipient_last_name, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM gift_cards;"
  end

  def down
    Recipient.delete_all
  end
end
