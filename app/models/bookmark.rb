class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, presence: true, length: { minimum: 6 }

  private

  def check_for_bookmarks
    bookmarks.any?
    errors.add(:base, "Cannot delete a movie with associated bookmarks")
    throw :abort
  end
end
