class MoviesController < ApplicationController
  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new(movie: @movie)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Changes are saved!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie added to the list!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path, status: :see_other, alert: "Movie \"#{@movie.title}\" deleted!"
  end

  private
    def movie_params
      params[:movie].permit(:title, :description, :rating, :released_on, :total_gross, :director,
                            :duration, :image_file_name)
    end
end
