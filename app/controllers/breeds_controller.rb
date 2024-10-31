# class BreedsController < ApplicationController
#   before_action :set_breed_group, only: [:index, :show]

#   def index
#     @breeds = @breed_group.breeds

#     # Filtering breeds
#     @breeds = @breeds.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
#   end

#   def show
#     @breed = @breed_group.breeds.find(params[:id])
#   end

#   private

#   def set_breed_group
#     @breed_group = BreedGroup.find(params[:breed_group_id])
#   end
# end

class BreedsController < ApplicationController
  before_action :set_breed_group, only: [:index, :show]
  before_action :set_breed, only: [:show, :create_comment]

  def index
    @breeds = @breed_group.breeds
    @breeds = @breeds.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @comments = @breed.breed_comments
    @new_comment = BreedComment.new
  end

  def create_comment
    @comment = @breed.breed_comments.new(comment_params)
    if @comment.save
      redirect_to breed_path(@breed), notice: 'Comment was successfully posted.'
    else
      redirect_to breed_path(@breed), alert: 'Failed to post comment.'
    end
  end

  private

  def set_breed_group
    @breed_group = BreedGroup.find(params[:breed_group_id])
  end

  def set_breed
    @breed = @breed_group.breeds.find(params[:id])
  end

  def comment_params
    params.require(:breed_comment).permit(:name, :content)  # Permit name and content
  end
end
