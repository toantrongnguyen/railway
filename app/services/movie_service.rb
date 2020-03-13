class MovieService
  class << self
    def new
      Movie.new
    end

    def listAll
      Movie.order(created_at: :desc).all
    end

    def create(params)
      movie = Movie.new(movie_params(params))

      if movie.valid?
        movie.actors = getMovieActors(params[:actors])
        movie.save
      end

      return movie
    end

    def find(params)
      Movie.find(params)
    end

    def destroy(id)
      movie = Movie.find(id)
      movie.destroy
    end

    def updateMovieId(id, params)
      movie = MovieService.find(id)
      actors = getMovieActors(params[:actors])
      data = movie_params(params).merge(actors: actors)
      movie.update(data)
      return movie
    end

    def movie_params(params)
      params.permit(:title, :description, :release_date, thumbnails: [])
    end

    def getMovieActors(actorsIdList)
      actors = actorsIdList ? ActorService.find(actorsIdList) : []
    end
  end
end
