class Admin::ProductsController < ApplicationController
  layout "admin_template"
  before_action :load_product, only: [:destroy, :edit, :update]

  def index
    @products = Product.all
  end

  def new
    @categories = Category.all
    $product_suggest = Suggest.find_by id: params[:product_suggest]
    if $product_suggest
      @product = Product.new name: $product_suggest.name,
      price: $product_suggest.price, description: $product_suggest.description,
      image: $product_suggest.image
    else
      @product = Product.new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "saved"
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "saved"
      if $product_suggest
        $product_suggest.update_attribute(:status, false)
      end
    else
      flash[:danger] = t "save_not_successfully"
    end
    redirect_to admin_products_path
  end

  def destroy
    if @product.destroy
      flash[:success] = t "delete_successfully"
    else
      flash[:danger] = t "delete_not_successfully"
    end
    redirect_to admin_root_path
  end

  private
  def product_params
    params.require(:product).permit :name, :price, :category_id,
      :quantity, :image, :description
  end

  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "product_not_exist"
      redirect_to admin_root_path
    end
  end
end
