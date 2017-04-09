class DistancesController < ApplicationController
  before_action :set_distance, only: [:show, :edit, :update, :destroy]

  # GET /distances
  # GET /distances.json
  def index
    @distances = Distance.all
  end

  # GET /distances/1
  # GET /distances/1.json
  def show
  end

  # GET /distances/new
  def new
    @distance = Distance.new
  end

  # GET /distances/1/edit
  def edit
  end

  # POST /distances
  # POST /distances.json
  def create
    @distance = Distance.new(distance_params)

    place_from_id = params[:distance][:busstop_from].to_i
    place_to_id = params[:distance][:busstop_to].to_i

    distance_meters = get_distance(place_from_id, place_to_id)

    @distance.distance_metter = distance_meters
    respond_to do |format|
      if @distance.save
        format.html { redirect_to @distance, notice: 'Distance was successfully created.' }
        format.json { render :show, status: :created, location: @distance }
      else
        format.html { render :new }
        format.json { render json: @distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distances/1
  # PATCH/PUT /distances/1.json
  def update
    place_from_id = params[:distance][:busstop_from].to_i
    place_to_id = params[:distance][:busstop_to].to_i

    distance_meters = get_distance(place_from_id, place_to_id)

    params[:distance][:distance_metter] = distance_meters
    respond_to do |format|
      if @distance.update(distance_params)
        format.html { redirect_to @distance, notice: 'Distance was successfully updated.' }
        format.json { render :show, status: :ok, location: @distance }
      else
        format.html { render :edit }
        format.json { render json: @distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distances/1
  # DELETE /distances/1.json
  def destroy
    @distance.destroy
    respond_to do |format|
      format.html { redirect_to distances_url, notice: 'Distance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distance
      @distance = Distance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def distance_params
      params.require(:distance).permit(:busstop_from, :busstop_to, :distance_metter)
    end

    def get_distance place_from_id, place_to_id
      place_from = Place.find_by id: place_from_id
      place_to = Place.find_by id: place_to_id

      @matrix = GoogleDistanceMatrix::Matrix.new
      @matrix.configure do |config|
        config.mode = 'driving'
        config.avoid = 'tolls'
        config.google_api_key = "AIzaSyCzjkYK_6usldy2pnjk7COj7CM0qf2w388"
      end

      lat_lng = GoogleDistanceMatrix::Place.new lng: place_from.longitude, lat: place_from.latitude
      dest_address = GoogleDistanceMatrix::Place.new lng: place_to.longitude, lat: place_to.latitude

      @matrix.origins << lat_lng
      @matrix.destinations << dest_address
      @matrix.route_for(origin: lat_lng, destination: dest_address).distance_in_meters
      binding.pry
    end
end
