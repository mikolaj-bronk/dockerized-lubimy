class V1::SongsController < ApplicationController
  def index
    @songs = Song.all

    render json: @songs, status: :ok
  end

  def show
    @songs = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = 'Song added.'
      redirect_to root_path
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
    if @song.update_attributes(product_params)
      flash[:notice] = 'Song updated.'
      redirect_to root_path
    else
      flash[:error] = 'Failed to update the song!'
      render :edit
    end
  end

  def delete
    @song = Song.where(id: params[:id]).first
    if @song.delete
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def song_params
    params.require(:song).permit(:author, :album, :name, :length)
  end
end
