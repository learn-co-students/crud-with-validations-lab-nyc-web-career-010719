class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "should happen once per year per artist"}
  validate :release_year_must_be_in_the_past, :release_year_required_if_song_was_released,

  def release_year_required_if_song_was_released
    if released == true && release_year == nil
      errors.add(:release_year, "needs to exist if song has been released")
    end
  end

  def release_year_must_be_in_the_past
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the past")
    end
  end


end
