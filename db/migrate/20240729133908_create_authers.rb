class CreateAuthers < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.date :dob

      t.timestamps
    end
  end
end
