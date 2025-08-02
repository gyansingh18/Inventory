class CateogoriesController < ApplicationController

  def new
    @cateogory = Cateogory.new
  end

  def create
    @cateogory = Cateogory.new(cateogory_params)
    if @cateogory.save
      redirect_to new_product_path, notice: 'Cateogory added'
    else
      render :new
    end
  end

  def show
    @cateogory = Cateogory.find(params[:id])
    @products = @cateogory.products
  end

  private

  def set_cateogory
    @cateogory = Cateogory.find(params[:id])
  end

  def cateogory_params
    params.require(:cateogory).permit(:name)
  end
end
