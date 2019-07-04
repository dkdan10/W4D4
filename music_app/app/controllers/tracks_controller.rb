class TracksController < ApplicationController
  
  def new

    @track = Track.new
    render :new
  end

  def create
    # debugger
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track.id)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to album_url(@track.id)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album_id = @track.album_id
    @track.destroy
    redirect_to album_url(album_id)
  end

  private

  def track_params
    params.require(:track).permit(:title, :year, :live, :album_id, :lyrics)
  end

end