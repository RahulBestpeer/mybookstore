class Addcolumnstockquantity < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :stock_quntity, :integer
  end
end
