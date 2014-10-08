class CatsController < ApplicationController
  before_filter :find_cat, only: [:show, :destroy, :delete_image]
  def index
    @cats = Cat.all
  end

  def show
  end

  def search
    search_term = params[:name] 
    if search_term != "" || search_term.nil?
      @cats = Cat.where(['name LIKE ?', "%#{search_term}%"])  
      
    else
      @cats = []

    end
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

  def delete_image
    @cat.remove_picture!
    @cat.save
    redirect_to :back
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :picture)
  end

  def find_cat
    @cat = Cat.find(params[:id])
  end
end
