require "base64"

class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :update, :destroy]
  before_action :get_artist, unless: -> { @artist.nil? }

  # GET /albums
  def index
    
    if @artist.nil?
      @albums = Album.all
    else
      @albums = @artist.albums
      
    end
    render json: @albums
  end

  # GET /albums/1
  def show
    render json: @album
  end

  # POST /albums
  def create
    @album = @artist.album.new(album_params)
    @album.id_custom = (Base64.encode64(@album.name+":"+@artist.id_custom))[0..21]

    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(album_params)
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = @artist.album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:name, :genre)
    end
    
    def get_artist
      @artist = Artist.find(params[:artist_id])
    end

end
