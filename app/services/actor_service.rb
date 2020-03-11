class ActorService
  class << self
    def new
      Actor.new
    end

    def getList
      Actor.order(created_at: :desc).all
    end

    def create(params)
      Actor.create(params)
    end

    def find(params)
      Actor.find(params)
    end
  end
end
