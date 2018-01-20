class WelcomeController < ApplicationController
  DISPLAY_SIZE= 4
  def index
    @hot_movies = Medium.where(category: '映画').limit(DISPLAY_SIZE)
    @hot_musics = Medium.where(category: 'ミュージック').limit(DISPLAY_SIZE)
  end
end
