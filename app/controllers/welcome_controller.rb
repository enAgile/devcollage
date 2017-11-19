class WelcomeController < ApplicationController
  def index
    @hot_movies= Movie.top10(Genre.find('33')).first(5)
    @hot_musics= Music.top10(Genre.find('34')).first(5)
  end
end
