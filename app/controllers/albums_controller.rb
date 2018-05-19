class AlbumsController < ApplicationController
  def index
    #@albums = album.all
    @albums = Album.search(params[:term], params[:page])
  end

  def show
    @albums = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = 'album added.'
      redirect_to root_path
    else
      flash[:error] = 'Failed to add the album!'
      render :new
    end
    #reder json: @album, status: :created
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      flash[:notice] = 'album updated.'
      redirect_to root_path
    else
      flash[:error] = 'Failed to update the album!'
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to action:"index"
  end

  private

  def album_params
    params.require(:album).permit(:title, :premiere_date, :band_id)
  end
end
