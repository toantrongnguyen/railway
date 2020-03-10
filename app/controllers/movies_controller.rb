class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: :desc).all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.create(movie_params)

    if @movie.valid?
      redirect_to @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)

    if @movie.valid?
      redirect_to @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :description, :release_date)
    end
end
