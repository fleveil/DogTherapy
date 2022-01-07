class DogsController < ApplicationController
  def index
    @dogs = Dog.all.reject do |planet| # this could definitely be made more efficient with a better SQL querry
      current_user == planet.users
    end
  end


end
