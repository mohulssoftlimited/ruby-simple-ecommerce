class AddDetailsToBreedGroups < ActiveRecord::Migration[7.1]
  def change
    add_column :breed_groups, :origin, :string
    add_column :breed_groups, :characteristics, :text
  end
end
