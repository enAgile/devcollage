class WelcomeController < ApplicationController
  def index
    @hot_movies= Medium.top10('映画', Genre.root_genres.find_by(name: '映画')).first(5)
    @hot_musics= Medium.top10('ミュージック', Genre.root_genres.find_by(name: 'ミュージック')).first(5)
  end
end
