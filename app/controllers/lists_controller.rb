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
  category = Category.find params[:id]
  list = category.list_id
  category.destroy
  redirect_to list_path(list)
end

def destroy
  list = List.find params[:id]
  list.categories.each do |category|
    category.destroy

  end
  list.destroy
  redirect_to lists_path
end


    private
    def list_params
      params.require(:list).permit(:name)
    end
end
