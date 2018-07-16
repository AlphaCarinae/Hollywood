class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find params[:id]
  end

  def edit
    @actor = Actor.find params[:id]
  end

  def new
    @actor = Actor.new
  end

  def create
    actor = Actor.create actor_params
    redirect_to actor
  end

  def update
    actor = Actor.find params[:id]
    actor.update actor_params
    redirect_to actor
  end




  private
  def actor_params
    params.require(:actor).permit(:name, :image, :yob)
  end

end
