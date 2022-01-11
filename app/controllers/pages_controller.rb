class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @dogs = Dog.first(3)
  end
end
