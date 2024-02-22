class List < ApplicationRecord
  # When a list is destroyed, all of its associated bookmarks must be destroyed as well.
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, uniqueness: true
  validates :name, presence: true
end
