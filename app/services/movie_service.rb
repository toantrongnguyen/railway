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
  end
end
