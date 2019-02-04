class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name], message: "should happen once per year per artist"}
  validates :released, inclusion: { in: [true,false]}
  validate :require_song_year,
    :date_greater_than_today
  validates :artist_name, presence: true

  def require_song_year
    if released == true && release_year == nil
      errors.add(:release_year, "need a release year if released")
    end
  end

  def date_greater_than_today
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be greater than today's year")
    end
  end
end
