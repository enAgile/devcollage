class Genre
  include ActiveModel::Model
  attr_accessor *%i(id name url type)

  class << self
    def genres(type)
      all_genres[type.to_sym]
    end

    def find(name)
      # XXX
      music_genres.first
    end

    private

    def all_genres
      @all_genres ||= all_genres_from_api
    end

    def all_genres_from_api
      # TODO url をキーにresponse をキャッシュするぞ！
      url = "http://itunes.apple.com/WebObjects/MZStoreServices.woa/ws/genres?cc=jp"
      response = Faraday.get(url)
      result = JSON.parse(response.body)
      # puts result
      result.values.each.with_object({}) do |value, ret|
        case  value["name"]
        when "映画"
          ret[:movie] = value["subgenres"].values.map{|subgenre| new(subgenre.slice(*%w(id name url)).merge(type: :movie))}
        when "ミュージック"
          ret[:music] = value["subgenres"].values.map{|subgenre| new(subgenre.slice(*%w(id name url)).merge(type: :music))}
        end
      end
    end
  end

  # XXX
  def parent
    Genre.genres(:music).first
  end

  # XXX
  def top10medias
    case type
    when :movie
      Movie.top10(:movie)
    when music
      Music.top10(:music)
    end
  end

  def to_param
    name
  end
end
