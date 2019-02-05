class NoFutureReleaseValidator < ActiveModel::Validator
  def validate(song)
    if song.release_year && song.release_year > Time.now.year
      song.errors[:release_year] << "No future release dates friend."
    end
  end
end
