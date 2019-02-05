class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: { scope: %i[release_year artist_name],
    message: "nope!" }
  validates :released, inclusion: { in: [true, false] }
  # validates :release_year, numericality: { less_than_or_equal_to: 2019}
  with_options if: :was_released? do |a|
     a.validates :release_year, presence: true
     a.validates :release_year, numericality: {less_than_or_equal_to: 2019}
   end

   def was_released?
     released
   end
end
#
