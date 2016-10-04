class ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:sort] && params[:sort_order]
      @products = Product.order(params[:sort] => params[:sort_order])
    end
    if params[:disocunt]
      @products = Product.where("price < ?", 10)
    end
  end  

  def show
    if params[:id] == "random"
      products = Product.all
      @product = products.sample
    else
    @product = Product.find_by(id: params[:id])
    end 
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
