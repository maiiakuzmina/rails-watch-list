class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_error
  before_destroy :check_for_bookmarks

  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
end
