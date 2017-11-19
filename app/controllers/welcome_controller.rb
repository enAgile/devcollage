class WelcomeController < ApplicationController
  def index
    @hot_movies= Movie.top10(Genre.root_genres.find_by(name: '映画')).first(5)
    @hot_musics= Music.top10(Genre.root_genres.find_by(name: 'ミュージック')).first(5)
  end
end
