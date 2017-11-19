class Genre
  include ActiveModel::Model
  attr_accessor *%i(id name url parent_id)

  class << self
    def root_genres
      %w(33 34).map { |id | find(id) }
    end

    def genres(type)
      where(parent_id: { movie: '33', music: '34' }[type])
    end

    def find(id)
      all_genres[id]
    end

    def find_by(conditions)
      where(conditions).first
    end

    def where(conditions)
      all_genres.select do |id, g|
        conditions.all? { |key, value| g.send(key) == value }
      end.values
    end

    private

    def all_genres
      @all_genres ||= all_genres_from_api
    end

    def load_genre(ret, parent, object)
      puts object['name']
      ret[object['id']] = new(object.slice(*%w(id name url)).merge(parent_id: parent&.[]('id')))

      object['subgenres'] && object['subgenres'].values.each { |value| load_genre(ret, object, value) }
    end

    def all_genres_from_api
      # TODO url をキーにresponse をキャッシュするぞ！
      url = "http://itunes.apple.com/WebObjects/MZStoreServices.woa/ws/genres?cc=jp"
      response = Faraday.get(url)
      result = JSON.parse(response.body)

      {}.tap do |ret|
        result.values.each do |value|
          load_genre(ret, nil, value)
        end
      end
    end
  end

  def parent
    Genre.find(parent_id)
  end

  def top10medias
    case parent_id
    when '33'
      Movie.top10(self)
    when '34'
      Music.top10(self)
    end
  end

  def to_param
    id
  end
end
