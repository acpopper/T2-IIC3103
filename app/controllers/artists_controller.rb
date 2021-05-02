require "base64"

class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]
  

  # GET /artists
  def index
    @artists = Artist.all
    
    render json: @artists.to_json(:only => [:id, :name, :age])
  end

  # GET /artists/1
  def show
    render json: {"id": @artist.id_custom, "name": @artist.name, "age": @artist.age, "albums": "https://localhost:3000/artists/%s/albums" % @artist.id_custom,
      "tracks": "https://localhost:3000/artists/%s/tracks" % @artist.id_custom, "self": "https://localhost:3000/artists/%s" % @artist.id_custom}, status: :ok
  end

  # POST /artists
  def create
    @artist = Artist.new(artist_params)
    @artist.id_custom = (Base64.encode64(artist_params[:name]))[0..21]

    if @artist.save
      render json: {"id": @artist.id_custom, "name": @artist.name, "age": @artist.age, "albums": "https://localhost:3000/artists/%s/albums" % @artist.id_custom,
      "tracks": "https://localhost:3000/artists/%s/tracks" % @artist.id_custom, "self": "https://localhost:3000/artists/%s" % @artist.id_custom}, status: :created
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artists/1
  def update
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      params.require(:artist).permit(:name, :age)
    end
end
