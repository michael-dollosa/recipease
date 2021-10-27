class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.string :account_type
      t.string :payment_intent
      t.timestamps
    end
  end
end
