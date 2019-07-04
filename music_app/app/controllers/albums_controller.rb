class AlbumsController < ApplicationController
  
  def new
    @album = Album.new
    render :new
  end

  def create
    # params[:album][:live] = Boolean.new.cast(params[:album][:live]) if ["true","false"].include?(params[:ablum][:live])
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    band_id = @album.band_id
    @album.destroy
    redirect_to band_url(band_id)
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end

end