# == Schema Information
#
# Table name: media_rankings
#
#  id         :integer          not null, primary key
#  medium_id  :integer
#  genre_id   :integer
#  rank       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_media_rankings_on_genre_id   (genre_id)
#  index_media_rankings_on_medium_id  (medium_id)
#

class MediaRanking < ApplicationRecord
  belongs_to :medium
  belongs_to :genre

  validates :rank, presence: true
end
