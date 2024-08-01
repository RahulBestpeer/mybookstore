class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.date :date_submit
      t.integer :status, default: 0
      t.decimal :subtotal
      t.decimal :tax, default: 18
      t.decimal :total
      t.decimal :shipping, default: 40
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
