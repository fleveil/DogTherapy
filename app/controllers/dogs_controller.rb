class DogsController < ApplicationController
  def index
    search = Search.find(params[:search])

    # find dogs in X radius of search address
    dogs = Dog.near([search.latitude, search.longitude], search.radius, units: :km)

    @dogs = dogs.reject do |dog| # removes dogs owned by the user from the list
      current_user == dog.user
    end

    raise
  end

  def show
    @dog = Dog.find(params[:id])
    @markers = [{ lat: @dog.latitude, lng: @dog.longitude }]
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    redirect_to my_dogs_path
  end

  def my_dogs
    @dogs = current_user.dogs
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :energy, :affection,
                                :size, :hypoallergenic, :description,
                                :address, :photo)
  end
end
