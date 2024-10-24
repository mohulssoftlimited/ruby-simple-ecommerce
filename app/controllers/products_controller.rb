class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    if params[:search].present?
      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
    else
      @products = Product.all
    end
  end

  def show
    # Correctly find the product using the product ID
    @product = Product.find(params[:id])

    # Optionally get the category associated with the product
    @category = @product.category

    # Search within products of the category if needed
    if params[:search].present?
      @products = @category.products.where("name LIKE ?", "%#{params[:search]}%")
    else
      @products = @category.products
    end
  end

  private

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
