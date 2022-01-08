class DogsController < ApplicationController
  def index
    @dogs = Dog.all.reject do |dog| # this could definitely be made more efficient with a better SQL querry
      current_user == dog.user
    end
  end




end
