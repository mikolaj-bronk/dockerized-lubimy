class SongsController < ApplicationController
  def index
    #@songs = Song.all
    @songs = Song.search(params[:term], params[:page])
  end

  def show
    @song = Song.find(params[:id])
   
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = 'Song added.'
      redirect_to songs_path
    else
      flash[:error] = 'Failed to add the song!'
      render :new
    end
    #reder json: @song, status: :created
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(song_params)
      flash[:notice] = 'Song updated.'
      redirect_to songs_path
    else
      flash[:error] = 'Failed to update the song!'
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to action:"index"
  end

  private

  def song_params
    params.require(:song).permit(:title, :length, :lyrics, :album_id)
  end
end
