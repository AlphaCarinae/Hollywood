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

    def addlist

      director = Director.find params[:director_id]
      list = List.find params[:list_id]
      director.lists << list
      redirect_to list
    end


    private
    def director_params
      params.require(:director).permit(:name, :image, :yob)
    end
end
