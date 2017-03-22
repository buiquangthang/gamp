class UsersController < ApplicationController
  include GeoRuby::SimpleFeatures
  require 'google_maps_service'

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_distance_matrix
  # before_action :google_service
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.title
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:latitude, :longitude, :name, :address, :title)
    end

    def set_distance_matrix
      @matrix = GoogleDistanceMatrix::Matrix.new
      @matrix.configure do |config|
        config.mode = 'driving'
        config.avoid = 'tolls'
        config.google_api_key = "AIzaSyCzjkYK_6usldy2pnjk7COj7CM0qf2w388"
      end

      lat_lng = GoogleDistanceMatrix::Place.new lng: 108.1959171, lat: 16.0657942
      dest_address = GoogleDistanceMatrix::Place.new lng: 108.212316, lat: 16.066769

      @matrix.origins << lat_lng
      @matrix.destinations << dest_address
      # binding.pry
    end

    def google_service
      # Setup API keys
      gmaps = GoogleMapsService::Client.new(key: 'AIzaSyDHTH-lfgx2dnuJzvgCq_mN2eYcodjLM2M')
      routes = gmaps.directions(
        '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA',
        '2400 Amphitheatre Parkway, Mountain View, CA 94043, USA',
        mode: 'walking',
        alternatives: false)
    end
end
