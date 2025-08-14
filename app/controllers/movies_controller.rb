class MoviesController < ApplicationController
  def index
    @movies = ["Terra", "Final Fantasy", "Iron Man"]
  end
end
