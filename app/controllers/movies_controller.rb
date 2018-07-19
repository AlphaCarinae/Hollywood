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

  def destroy
    movie = Movie.find params[:id]
    movie.destroy
    redirect_to movies_path
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

  def addlist

    movie = Movie.find params[:movie_id]
    list = List.find params[:list_id]
    movie.lists << list
    redirect_to list
  end

def search
  query_string = params[:query]
  movie_url = "https://api.themoviedb.org/3/search/movie?api_key=#{API_KEY}&language=en-US&query=#{query_string}&page=1&include_adult=false"
  tmdb_response = HTTParty.get movie_url
  # raise 'hell'
  @tmdb_results = tmdb_response["results"][0,8]
end

def fetch
  movie_id = params[:id]

  movie_url = "#{BASE_MOVIE_URL}#{movie_id}?api_key=#{API_KEY}&language=en-US"
  tmdb_response_movie = HTTParty.get movie_url

  credits_url = "#{BASE_MOVIE_URL}#{movie_id}/credits?api_key=#{API_KEY}&language=en-US"
  tmdb_response_credits = HTTParty.get credits_url

# Directors!! do we need to add the director for this movie
# or use an exisiting one
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
##Let's create the movie entry now
  movie = Movie.new
  movie.title = tmdb_response_movie["title"]
  movie.image = "#{BASE_IMAGE_URL}w300" + tmdb_response_movie["poster_path"]
  movie.year = tmdb_response_movie["release_date"][0,4]
  movie.plot = tmdb_response_movie["overview"]
  movie.director_id = local_director_id
  movie.save
  new_movie_id = movie.id

# Let's create the actors and connect to the new movie
  tmdb_response_credits["cast"][0,9].each do |cast|
    actor_id = cast["id"]
    actor_name = cast["name"]
    local_actor = Actor.where(name: actor_name)
    if local_actor.present?
      movie.actors << local_actor
    else
      actor_url = "#{BASE_PERSON_URL}#{actor_id}?api_key=#{API_KEY}&language=en-US"
      tmdb_response_actor = HTTParty.get actor_url
      actor = Actor.new
      actor.name = tmdb_response_actor["name"]
      actor.yob = tmdb_response_actor["birthday"][0,4] if tmdb_response_actor["birthday"].present?
      actor.image = "#{BASE_IMAGE_URL}w300" + tmdb_response_actor["profile_path"] if tmdb_response_actor["profile_path"].present?
      actor.save
      movie.actors << actor
    end
  end

  redirect_to movie
end


    private
    def movie_params
      params.require(:movie).permit(:title, :image, :year, :plot)
    end
end
