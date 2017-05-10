class BusStationsController < ApplicationController
  before_action :set_bus_station, only: [:show, :edit, :update, :destroy]

  # GET /bus_stations
  # GET /bus_stations.json
  def index
    @bus_stations = BusStation.all
    @hash = Gmaps4rails.build_markers(@bus_stations) do |bus_station, marker|
      marker.lat bus_station.latitude
      marker.lng bus_station.longitude
      marker.infowindow bus_station.title
    end
  end

  # GET /bus_stations/1
  # GET /bus_stations/1.json
  def show
    @hash = Gmaps4rails.build_markers(@bus_station) do |bus_station, marker|
      marker.lat bus_station.latitude
      marker.lng bus_station.longitude
      marker.infowindow bus_station.title
    end
  end

  # GET /bus_stations/new
  def new
    @bus_station = BusStation.new
  end

  # GET /bus_stations/1/edit
  def edit
  end

  # POST /bus_stations
  # POST /bus_stations.json
  def create
    @bus_station = BusStation.new(bus_station_params)

    respond_to do |format|
      if @bus_station.save
        format.html { redirect_to @bus_station, notice: 'BusStation was successfully created.' }
        format.json { render :show, status: :created, location: @bus_station }
      else
        format.html { render :new }
        format.json { render json: @bus_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_stations/1
  # PATCH/PUT /bus_stations/1.json
  def update
    respond_to do |format|
      if @bus_station.update(bus_station_params)
        format.html { redirect_to @bus_station, notice: 'BusStation was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_station }
      else
        format.html { render :edit }
        format.json { render json: @bus_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_stations/1
  # DELETE /bus_stations/1.json
  def destroy
    @bus_station.destroy
    respond_to do |format|
      format.html { redirect_to bus_stations_url, notice: 'BusStation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    BusStation.import(params[:file])
    redirect_to bus_stations_path, notice: "Products imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_station
      @bus_station = BusStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_station_params
      params.require(:bus_station).permit(:latitude, :longitude, :name, :address, :title)
    end
end
