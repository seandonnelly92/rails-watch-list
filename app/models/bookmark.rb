class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # A bookmark must be linked to a movie and a list,
  validates :movie_id, presence: true
  validates :list_id, presence: true
  # and the [movie, list] pairings should be unique
  validates :movie_id, uniqueness: { scope: :list_id,
  message: "Movie/List pairings must be unique" }
  validates :list_id, uniqueness: { scope: :movie_id,
    message: "Movie/List pairings must be unique" }
    # The comment of a bookmark cannot be shorter than 6 characters.
  validates :comment, length: { minimum: 6 }
end
