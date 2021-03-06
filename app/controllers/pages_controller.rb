class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @dogs = homepage_dogs
  end

  def search
    @search = Search.new
  end

  def create_search
    @search = Search.new(search_params)
    if @search.save
      redirect_to dogs_path(search: @search)
    else
      @dogs = homepage_dogs
      render :search
    end
  end

  private

  def search_params
    params.require(:search).permit(:date, :address, :radius)
  end

  def homepage_dogs
    Dog.first(3) # could be changed to display something more randomized/varied
  end
end
