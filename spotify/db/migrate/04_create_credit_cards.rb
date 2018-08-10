class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.integer :cvc 
      t.belongs_to :user
    end
  end
end