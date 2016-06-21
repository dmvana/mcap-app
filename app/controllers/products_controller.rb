class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def new 
  end

  def create
    product = Product.create(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
    )
    flash[:success] = "Product was sucessfully added!"
    redirect_to '/products'

  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.update(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
      )
    flash[:success] = "Product was sucessfully edited!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "Product was succesfully deleted"
    redirect_to '/products'
  end
end
