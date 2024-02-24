class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  before_destroy :check_for_bookmarks

  validates :name, presence: true, uniqueness: true
end
