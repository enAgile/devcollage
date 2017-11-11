class Media
  include ActiveModel::Model

  class << self
    def top10_from_api(resource_name, genre)
      category = "top#{resource_name.to_s.pluralize}"

      url = "https://itunes.apple.com/jp/rss/#{category}/limit=10/genre=#{genre}/json"
      response = Faraday.get(url)
      result = JSON.parse(response.body)
      result['feed']['entry'] || []
    end

    def movies_top10(genre)
      top10_from_api(:movies, genre).map do |entry|
        Movie.new(
          name: entry['im:name']['label'],
          copyrights: entry['im:name']['rights'],
          rental_price: build_price(entry['im:rentalPrice']),
          price: build_price(entry['im:price']),
          summary: entry['summary']['lable']
        )
      end
    end

    def musics_top10(genre)
      top10_from_api(:songs, genre).map do |entry|
        Music.new(
          name: entry['im:name']['label'],
          copyrights: entry['im:name']['rights'],
          rental_price: build_price(entry['im:rentalPrice']),
          price: build_price(entry['im:price'])
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
end
