class Movie < ApplicationRecord
  # You can’t delete a movie if it is referenced in at least one bookmark.
  has_many :bookmarks
  # A movie must have a unique title and an overview.
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
end
