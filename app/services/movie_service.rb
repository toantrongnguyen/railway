class MovieService
  class << self
    def new
      Movie.new
    end

    def listAll
      Movie.order(created_at: :desc).all
    end

    def create(params)
      Movie.create(params)
    end

    def find(params)
      Movie.find(params)
    end

    def updateMovieId(id, params)
      movie = MovieService.find(id)
      actors = params[:actors] ? ActorService.find(params[:actors]) : []
      data = params.permit(:title, :description, :release_date).merge(actors: actors)
      movie.update(data)
      return movie
    end
  end
end
