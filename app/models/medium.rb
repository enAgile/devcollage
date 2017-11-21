class Medium
  include ActiveModel::Model

  attr_accessor *%i(name summary rental_price price copyrights artist image_url genre_id)

  class << self
    # XXX
    def find(name)
      movies_top10(Genre.root_genres.find_by(name: '映画')).first
    end

    def top10_from_api(resource_name, genre)
      category = "top#{resource_name.to_s.pluralize}"

      url = "https://itunes.apple.com/jp/rss/#{category}/limit=10/genre=#{genre.itunes_genre_id}/json"
      response = Faraday.get(url)
      result = JSON.parse(response.body)
      result['feed']['entry'] || []
    end

    def top10(category, genre)
      type = case category
             when '映画'
               :movies
             when 'ミュージック'
               :songs
             end

      top10_from_api(type, genre).map do |entry|
        new(
          name: entry['im:name']['label'],
          copyrights: entry['im:name']['rights'],
          rental_price: build_price(entry['im:rentalPrice']),
          price: build_price(entry['im:price']),
          summary: entry['summary']&.fetch('lable', nil),
          image_url: entry['im:image'].last['label'],
          genre_id: entry['category']['attributes']['im:id']
        )
      end
    end

    def build_price(params)
      return unless params
      price = Price.new(price: params['label'])
      return price unless params['attributes']
      price.ammount = params['attributes']['ammount']
      price.currency = params['attributes']['currency']
      price
    end
  end

  # XXX image が不適切, 一覧では荒い画像でよい
  def image
    image_url.sub(/\d+x\d+bb-\d+.jpg/, '400x400bb.jpg')
  end

  # XXX title が不要
  alias title name

  def genre
    Genre.find_by(itunes_genre_id: genre_id)
  end

  def to_param
    name
  end
end
