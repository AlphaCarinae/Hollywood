class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find params[:id]
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def new
    @movie = Movie.new
  end

  def create
    movie = Movie.create movie_params
    redirect_to movie
  end

  def update
    movie = Movie.find params[:id]
    movie.update movie_params
    redirect_to movie
  end

def search
  query_string = params[:query]
  movie_url = "https://api.themoviedb.org/3/search/movie?api_key=0592fff444660851064418c3f0d290d1&language=en-US&query=#{query_string}&page=1&include_adult=false"
  tmdb_response = HTTParty.get movie_url
  # raise 'hell'
  @tmdb_results = tmdb_response["results"][0,5]
end

def fetch
  raise 'test'
end


    private
    def movie_params
      params.require(:movie).permit(:title, :image, :year, :plot)
    end
end
