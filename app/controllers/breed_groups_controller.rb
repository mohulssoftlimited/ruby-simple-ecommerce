class BreedGroupsController < ApplicationController
  def index
    @breed_groups = if params[:search].present?
                      BreedGroup.where('name LIKE ?', "%#{params[:search]}%")
                    else
                      BreedGroup.all
                    end
  end

  def show
    @breed_group = BreedGroup.find(params[:id])
    @breeds = @breed_group.breeds

    # Filtering breeds within this breed group
    @breeds = @breeds.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end
end
