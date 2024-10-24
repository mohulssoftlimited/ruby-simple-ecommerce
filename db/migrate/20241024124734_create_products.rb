class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.integer :stock_count

      t.timestamps
    end
  end
end
