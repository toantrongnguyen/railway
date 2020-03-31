class ActorService
  class << self
    def new
      Actor.new
    end

    def listAll(params)
      Actor.all
    end

    def create(params)
      Actor.create(params)
    end

    def find(params)
      Actor.find(params)
    end
  end
end
