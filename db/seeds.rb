def add_genre(parent, object)
  genre = Genre.create!(parent_id: parent&.id, name: object['name'], itunes_genre_id: object['id'])
  object['subgenres']&.values&.each do |value|
    add_genre(genre, value)
  end
end

Genre.delete_all
url = 'http://itunes.apple.com/WebObjects/MZStoreServices.woa/ws/genres?cc=jp'
response = Faraday.get(url)
result = JSON.parse(response.body)
result.values.each do |value|
  add_genre(nil, value)
end
puts "Import #{Genre.count} genres."
