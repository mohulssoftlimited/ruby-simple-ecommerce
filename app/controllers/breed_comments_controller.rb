class BreedCommentsController < ApplicationController
    def create
      @breed = Breed.find(params[:breed_id])
      @breed_comment = @breed.breed_comments.new(breed_comment_params)
  
      if @breed_comment.save
        redirect_to [@breed.breed_group, @breed], notice: 'Comment was successfully created.'
      else
        render 'breeds/show'
      end
    end
  
    private
  
    def breed_comment_params
      params.require(:breed_comment).permit(:name, :content) # Add :name here
    end
  end
  