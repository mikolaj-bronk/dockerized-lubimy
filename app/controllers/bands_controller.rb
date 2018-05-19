class BandsController < ApplicationController
  def index
    #@bands = band.all
    @bands = Band.search(params[:term], params[:page])
  end

  def show
    @bands = Band.find(params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = 'band added.'
      redirect_to root_path
    else
      flash[:error] = 'Failed to add that band!'
      render :new
    end
    #reder json: @band, status: :created
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      flash[:notice] = 'band updated.'
      redirect_to root_path
    else
      flash[:error] = 'Failed to update the band!'
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to action:"index"
  end

  private

  def band_params
    params.require(:band).permit(:name, :date_created, :photo)
  end
end
