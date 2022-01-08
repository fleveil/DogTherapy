class DogsController < ApplicationController
  def index
    @dogs = Dog.all.reject do |dog| # this could definitely be made more efficient with a better SQL querry
      current_user == dog.user
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to my_dog_path(@dog)
    else
      render :new
    end
  end






end
