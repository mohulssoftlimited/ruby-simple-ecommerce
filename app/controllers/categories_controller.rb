class CategoriesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    if params[:search].present?
      @categories = Category.where('name LIKE ?', "%#{params[:search]}%")
    else
      @categories = Category.all
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  private

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
