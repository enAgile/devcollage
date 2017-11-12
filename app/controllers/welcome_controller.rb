class WelcomeController < ApplicationController
  def index
    @hot_movies= Movie.top10(:movie).first(5)
    @hot_musics= Music.top10(:music).first(5)
  end
end
