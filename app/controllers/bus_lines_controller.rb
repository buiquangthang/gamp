class BusLinesController < ApplicationController
  before_action :set_bus_line, only: [:show, :edit, :update, :destroy]

  # GET /bus_lines
  # GET /bus_lines.json
  def index
    @bus_lines = BusLine.all
  end

  # GET /bus_lines/1
  # GET /bus_lines/1.json
  def show
    @bus_route_di = @bus_line.bus_routes.di.first
    @bus_route_ve = @bus_line.bus_routes.ve.first
    @bus_stations = BusStation.of_ids(@bus_route_di.list_bus_stations) + 
      BusStation.of_ids(@bus_route_ve.list_bus_stations)
    @distances = @bus_route_di.distances + @bus_route_ve.distances
    @hash = Gmaps4rails.build_markers(@bus_stations) do |bus_station, marker|
      marker.lat bus_station.latitude
      marker.lng bus_station.longitude
      marker.infowindow bus_station.title
    end
  end

  # GET /bus_lines/new
  def new
    @bus_line = BusLine.new
  end

  # GET /bus_lines/1/edit
  def edit
  end

  # POST /bus_lines
  # POST /bus_lines.json
  def create
    @bus_line = BusLine.new(bus_line_params)

    respond_to do |format|
      if @bus_line.save
        format.html { redirect_to @bus_line, notice: 'Bus line was successfully created.' }
        format.json { render :show, status: :created, location: @bus_line }
      else
        format.html { render :new }
        format.json { render json: @bus_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_lines/1
  # PATCH/PUT /bus_lines/1.json
  def update
    respond_to do |format|
      if @bus_line.update(bus_line_params)
        format.html { redirect_to @bus_line, notice: 'Bus line was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_line }
      else
        format.html { render :edit }
        format.json { render json: @bus_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_lines/1
  # DELETE /bus_lines/1.json
  def destroy
    @bus_line.destroy
    respond_to do |format|
      format.html { redirect_to bus_lines_url, notice: 'Bus line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_line
      @bus_line = BusLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_line_params
      params.require(:bus_line).permit(:name, :operating_from, :operating_to, :in_charge_unit, :ticket_fee, :description)
    end
end
