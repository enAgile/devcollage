class GenresController < ApplicationController
  def show
    # XXX
    @genre = Genre.find(params[:id])
  end
end
