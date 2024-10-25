class BreedsController < ApplicationController
  before_action :set_breed_group, only: [:index, :show]

  def index
    @breeds = @breed_group.breeds

    # Filtering breeds
    @breeds = @breeds.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @breed = @breed_group.breeds.find(params[:id])
  end

  private

  def set_breed_group
    @breed_group = BreedGroup.find(params[:breed_group_id])
  end
end
