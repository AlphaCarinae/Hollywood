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
  movie_url = "https://api.themoviedb.org/3/search/movie?api_key=#{API_KEY}&language=en-US&query=#{query_string}&page=1&include_adult=false"
  tmdb_response = HTTParty.get movie_url
  # raise 'hell'
  @tmdb_results = tmdb_response["results"][0,5]
end

def fetch
  movie_id = params[:id]

  movie_url = "#{BASE_MOVIE_URL}#{movie_id}?api_key=#{API_KEY}&language=en-US"
  tmdb_response_movie = HTTParty.get movie_url

  credits_url = "#{BASE_MOVIE_URL}#{movie_id}/credits?api_key=#{API_KEY}&language=en-US"
  tmdb_response_credits = HTTParty.get credits_url

# do we need to add the director for this movie
#or use an exisiting one
  director_id = tmdb_response_credits["crew"].first["id"]
  director_name = tmdb_response_credits["crew"].first["name"]
  local_director = Director.where(name: director_name)
  if local_director.present?
    local_director_id = local_director.first["id"]
  else
    director_url = "#{BASE_PERSON_URL}#{director_id}?api_key=#{API_KEY}&language=en-US"
    tmdb_response_director = HTTParty.get director_url
    director = Director.new
    director.name = tmdb_response_director["name"]
    director.yob = tmdb_response_director["birthday"][0,4]
    director.image = "#{BASE_IMAGE_URL}w300" + tmdb_response_director["profile_path"]
    director.save
    local_director_id = director.id

  end

  movie = Movie.new
  movie.title = tmdb_response_movie["title"]
  movie.image = "#{BASE_IMAGE_URL}w300" + tmdb_response_movie["poster_path"]
  movie.year = tmdb_response_movie["release_date"][0,4]
  movie.plot = tmdb_response_movie["overview"]
  movie.director_id = local_director_id
  movie.save

  redirect_to movie
end


    private
    def movie_params
      params.require(:movie).permit(:title, :image, :year, :plot)
    end
end
