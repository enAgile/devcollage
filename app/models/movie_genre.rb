class MovieGenre < Genre
  attr_accessor *%i(id name url)

  def self.all
    movie_genres
  end
end
