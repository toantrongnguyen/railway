class ActorsController < ApplicationController
  def index
    @actors = Actor.order(created_at: :desc).all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
    @actor = Actor.new
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def create
    @actor = Actor.create(actor_params)

    if @actor.valid?
      redirect_to @actor
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # puts 'he', actor_params[:profile]
    # File.open(Rail.root.join('public', 'uploads'))
    # @actor = Actor.find(params[:id])
    # @actor.update(actor_params)
    # if @actor.valid?
    #   redirect_to @actor
    # else
    #   render :edit, status: :unprocessable_entity
    # end
  end

  private
    def actor_params
      params.require(:actor).permit(:name, :biography, :birthday, :gender, :profile)
    end
end
