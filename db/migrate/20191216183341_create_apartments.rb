class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.decimal :sqm, precision: 10, scale: 2, default: 0.0, null: false
      t.integer :bedrooms, null: false, default: 0
      t.integer :bathrooms, null: false, default: 0

      t.timestamps
    end
  end
end
