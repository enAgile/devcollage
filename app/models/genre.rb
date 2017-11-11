class Genre
  include ActiveModel::Model
  # attr_accessor *%i(name id url rssUrls chartUrls subgenres)
  class << self
    def music_genres
      @music_genres ||= all_genres[:music_genres]
    end

    def movie_genres
      @movie_genres ||= all_genres[:movie_genres]
    end

    private

    def all_genres
      @all_genres ||= all_genres_from_api
    end

    def all_genres_from_api
      url = "http://itunes.apple.com/WebObjects/MZStoreServices.woa/ws/genres?cc=jp"
      response = Faraday.get(url)
      result = JSON.parse(response.body)
      # puts result
      result.values.each.with_object({}) do |value, ret|
        case  value["name"]
        when "映画"
          ret[:movie_genres] = value["subgenres"].values.map{|subgenre| MovieGenre.new(subgenre.slice(*%w(id name url)))}
        when "ミュージック"
          ret[:music_genres] = value["subgenres"].values.map{|subgenre| MusicGenre.new(subgenre.slice(*%w(id name url)))}
        end
      end
    end
  end
end
