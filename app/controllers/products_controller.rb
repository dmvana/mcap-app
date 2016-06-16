class ProductsController < ApplicationController

  def home
    @product = Product.last
  end

  def index
    @products = Product.all
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def create_product 
  end

  def show_create_product_result
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
    )
  end
end
