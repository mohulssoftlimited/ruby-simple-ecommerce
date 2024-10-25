class CreateBreeds < ActiveRecord::Migration[7.1]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :weight
      t.string :height
      t.string :bred_for
      t.references :breed_group, null: false, foreign_key: true
      t.string :life_span
      t.string :temperament
      t.string :origin
      t.string :reference_image_id

      t.timestamps
    end
  end
end
