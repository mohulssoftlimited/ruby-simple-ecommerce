class Breed < ApplicationRecord
  belongs_to :breed_group, optional: true
  has_many :breed_comments, dependent: :destroy  # Add this line
end