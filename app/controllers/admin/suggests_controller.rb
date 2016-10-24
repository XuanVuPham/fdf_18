class Admin::SuggestsController < ApplicationController
  layout "admin_template"
  before_action :load_suggest, only: :destroy

  def index
    @suggests = Suggest.all
  end

  def destroy
    if @suggest.destroy
      flash[:success] = t "delete_successfully"
    else
      flash[:danger] = t "delete_not_successfully"
    end
    redirect_to admin_suggests_path
  end

  def load_suggest
    @suggest = Suggest.find_by id: params[:id]
    unless @suggest
      flash[:danger] = t "suggest_not_exist"
      redirect_to admin_suggests_path
    end
  end
end
