class CatsController < ApplicationController
  before_filter :find_cat, only: [:show, :destroy]
  def index
    @cats = Cat.all
  end

  def show
  end

  def search

  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cats_path
    else
      render :new
    end
  end

  def destroy
    @cat.destroy
    redirect_to cats_path
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date)
  end

  def find_cat
    @cat = Cat.find(params[:id])
  end
end
