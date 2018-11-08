# Hollywood Collections

## About
Hollywood collections is a tool for making various collections/lists of all things Hollywood. you might wanna put your favourite actors, directors or movies in various collections depending on your movie preferences. Each item in your collection will then lead you to movies you like, the actors playing in such movies, or directors with a specific taste of movie making and so on. Get started [here:](https://hollywood-listmaker.herokuapp.com/)

## How to find what you like
Everything starts with adding your movie to the local database (original data generously provided by [TMDB](https://www.themoviedb.org/)):
1. use the search box in the movies page and see if the movie you are looking for is on that list
2. add the movie to the local database and wait for the import to complete
3. you will be directed to the movie page you added where you can find details about the movie as well as links to the actors and the director of that movie
4. from there on those actors and directors will also be available on their respective pages accessible through the nav bar
5. when browsing actors, directors or movies you can add them to your collections using the drop down selector on their details page.

## How to make lists/Collections
1. You need to be logged on to be able to make collections
2. Use the upper right buttons to create an account
3. You will then have access to the collections tab from the nav bar where you can create new list names
4. the list names you create are then available on each Actor, Movie or Director info page for addition
5. Simply choose the list name from the drop down menu and add the item to that lists
6. Collections can be accessed and edited through the collections tab
7. Every Person's Collections are personal and unique; Public lists are not available as a feature


## Built using

Hollywood is built using the following tools:
- Ruby on Rails
- Active Records
- Bootstrap
- HTTparty



## Database design

The database has 5 Main models:

- directors
- actors
- movies
- lists
- users

and two join tables:

- categories: acting as the polymorphic join table
- actors_movies: actor to movie joint table with many to many relationship

The diagram below depicts the relationships :

![Database Models](https://github.com/AlphaCarinae/Hollywood/tree/master/app/assets/images/Hollywood - Database Models.jpg)

## APIs
The movie, actor, and director information on Hollywood has been made available through the [TMDB](https://www.themoviedb.org/) API.

## Hosting
Hollywood is deployed on [Heroku](https://www.heroku.com).
