# == Schema Information
#
# Table name: genres
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  parent_id       :integer
#  itunes_genre_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category        :string
#
# Indexes
#
#  index_genres_on_parent_id  (parent_id)
#

class Genre < ApplicationRecord
  belongs_to :parent, class_name: 'Genre', required: false

  validates :name, presence: true

  class << self
    def root_genres
      where(name: %w(映画 ミュージック), parent_id: nil)
    end

    def genres(category)
      where(parent: root_genres.find_by!(name: category))
    end
  end

  def top10media
    Medium.top10(category, self)
  end
end
