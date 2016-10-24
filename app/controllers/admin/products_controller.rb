class Admin::ProductsController < ApplicationController
  before_action :load_product_suggest, only: [:new, :create]
  def new
    if @product_suggest
      @product = Product.new name: @product_suggest.name,
      price: @product_suggest.price, description: @product_suggest.description,
      image: @product_suggest.image
    else
      @product = Product.new
    end
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "saved"
      if @product_suggest
        @product_suggest.update_attribute(:status, false)
      end
    else
      flash[:danger] = t "save_not_successfully"
    end
    redirect_to admin_suggests_path
  end

  private
  def product_params
    params.require(:product).permit :name, :price,
      :quantity, :image, :description
  end

  def load_product_suggest
    @product_suggest = Suggest.find_by id: params[:product_suggest]
  end
end
