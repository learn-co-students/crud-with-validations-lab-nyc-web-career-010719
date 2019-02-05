class TitleValidator < ActiveModel::Validator
  def validate(song)
    @songs = Song.all
    @songs.each do |s|
      if song.title == s.title && song.release_year == s.release_year && song.artist_name == s.artist_name
        song.errors[:title] << "Title can't be repeated by the same artist in the same year."
      end
    end
  end
end
