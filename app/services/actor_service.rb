class ActorService
  class << self
    def new
      Actor.new
    end

    def listAll(params)
      Actor.order(created_at: :desc).paginate(page: params[:page] || 1)
    end

    def create(params)
      Actor.create(params)
    end

    def find(params)
      Actor.find(params)
    end
  end
end
