class WelcomeController < ApplicationController
  def index
    @hot_movies= Medium.top10(:movie, Genre.root_genres.find_by(name: '映画')).first(5)
    @hot_musics= Medium.top10(:music, Genre.root_genres.find_by(name: 'ミュージック')).first(5)
  end
end
