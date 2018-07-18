class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find params[:id]
  end

  def edit
    @list = List.find params[:id]
  end

  def new
    @list = List.new
  end

    def create
      list = List.create list_params
      @current_user.lists << list
      redirect_to list
    end

    def update
      list = List.find params[:id]
      list.update list_params
      redirect_to list
    end

def removeitem
  raise 'hell'
end


    private
    def list_params
      params.require(:list).permit(:name)
    end
end
