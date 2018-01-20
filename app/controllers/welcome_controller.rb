class WelcomeController < ApplicationController
  def index
    @hot_movies = Medium.where(category: '映画').limit(4)
    @hot_musics = Medium.where(category: 'ミュージック').limit(4)
  end
end
