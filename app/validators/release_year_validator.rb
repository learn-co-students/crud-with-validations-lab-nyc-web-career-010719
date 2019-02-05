class ReleaseYearValidator < ActiveModel::Validator
  def validate(song)
    if song.released && !song.release_year
      song.errors[:release_year] << "Need a release year if the song's been released."
    end
  end
end
