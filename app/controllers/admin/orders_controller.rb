class Admin::OrdersController < ApplicationController
  layout "admin_template"
  before_action :load_order, only: :update

  def index
    @orders = Order.all
  end

  def update
    if @order.status == "open"
      if @order.update_attribute(:status, "close")
        flash[:success] = t "saved"
        redirect_to admin_orders_path
        respond_to do |format|
          format.html
          format.js
        end
      else
        redirect_to admin_orders_path
      end
    else
      if @order.update_attribute(:status, "open")
        flash[:success] = t "saved"
        redirect_to admin_orders_path
         respond_to do |format|
          format.html
          format.js
        end
      else
        redirect_to admin_orders_path
      end
    end

  end

  private
  # def order_params
  #   params.require(:order).permit :status
  # end

  def load_order
    @order = Order.find_by id: params[:id]
    # binding.pry
    unless @order
      flash[:danger] = t "order_not_exist"
      redirect_to admin_orders_path
    end
  end
end
