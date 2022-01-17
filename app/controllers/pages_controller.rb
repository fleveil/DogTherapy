class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @search = Search.new
    @dogs = Dog.first(3)
  end

  def create_search
    puts 'it works?'
    raise
  end
end
