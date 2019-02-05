class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    set_params
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    set_params
  end

  def update
    set_params
    # byebug
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    set_params.destroy
    redirect_to songs_path
  end

  private
  def set_params
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year)
  end

end
