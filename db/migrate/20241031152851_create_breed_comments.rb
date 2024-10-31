class CreateBreedComments < ActiveRecord::Migration[7.1]
  def change
    create_table :breed_comments do |t|
      t.text :content
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
