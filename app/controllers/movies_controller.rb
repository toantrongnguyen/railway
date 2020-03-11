class MoviesController < ApplicationController
  def index
    @movies = MovieService.listAll
  end

  def show
    @movie = MovieService.find(params[:id])
  end

  def new
    @movie = MovieService.new
  end

  def edit
    @movie = MovieService.find(params[:id])
    @actors = ActorService.listAll
  end

  def create
    @movie = MovieService.create(movie_params)

    if @movie.valid?
      redirect_to @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def update
    @movie = MovieService.find(params[:id])
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
