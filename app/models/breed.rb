class Breed < ApplicationRecord
  belongs_to :breed_group, optional: true
end