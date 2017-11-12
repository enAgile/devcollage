class MediaController < ApplicationController
  def show
    # FIXME: Media -> Medium
    @medium = Media.find(params[:id])
  end
end
