class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end
  def show
    set_song
  end

  def create
    @song = Song.create(song_params(:title,:artist_name,:release_year,:released))
    if @song.valid?
      redirect_to @song
    else
      render :new
    end
  end

  def update
    @song = set_song
    @song.update(song_params(:title,:release_year))
    if @song.valid?
      redirect_to @song
    else
      render :edit
    end
  end

  def edit
    @song = set_song
  end

  def destroy
    @song = set_song
    @song.destroy
    redirect_to @song
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end
  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
