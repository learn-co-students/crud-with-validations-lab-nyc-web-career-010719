require 'Time'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :release_year
  # validates :release_year,  {:maximum => Date.today.year}, if: -> { released.true }
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'cannot be repeated by the same artist in the same year'
  }
#need to review this
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality:
    { less_than_or_equal_to: Date.today.year }
  end

  def released?
    released
  end
end


#   def release_year
#   if release_year.present? && release_year > Date.today
#     errors.add(:release_year, "can't be in the past")
#     end
#   end
# end
