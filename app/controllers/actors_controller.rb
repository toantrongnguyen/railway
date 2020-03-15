class ActorsController < ApplicationController
  before_action :logged_in_user

  def index
    @actors = ActorService.listAll
  end

  def show
    @actor = ActorService.find(params[:id])
  end

  def new
    @actor = ActorService.new
  end

  def edit
    @actor = ActorService.find(params[:id])
  end

  def create
    @actor = ActorService.create(actor_params)

    if @actor.valid?
      redirect_to @actor
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @actor = ActorService.find(params[:id])
    @actor.update(actor_params)

    if @actor.valid?
      redirect_to @actor
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def actor_params
      params.require(:actor).permit(:name, :biography, :birthday, :gender, :image)
    end
end
