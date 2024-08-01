class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.references :account, null: false, foreign_key: true
      t.belongs_to :book, null: false
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
