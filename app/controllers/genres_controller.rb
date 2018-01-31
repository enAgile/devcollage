class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @medias = @genre.media.sort_rank
  end
end
