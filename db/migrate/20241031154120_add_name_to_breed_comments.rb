class AddNameToBreedComments < ActiveRecord::Migration[7.1]
  def change
    add_column :breed_comments, :name, :string
  end
end
