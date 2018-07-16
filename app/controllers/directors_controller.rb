class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find params[:id]
  end

  def edit
    @director = Director.find params[:id]
  end

  def new
    @director = Director.new
  end


    def create
      director = Director.create director_params
      redirect_to director
    end

    def update
      director = Director.find params[:id]
      director.update director_params
      redirect_to director
    end




    private
    def director_params
      params.require(:director).permit(:name, :image, :yob)
    end
end
