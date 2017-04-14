class BusRoutesController < ApplicationController
  before_action :set_bus_route, except: :index
  before_action :list_places, only: [:add_places, :destroy_places]

  # GET /bus_routes
  # GET /bus_routes.json
  def index
    @bus_routes = BusRoute.all
  end

  # GET /bus_routes/1
  # GET /bus_routes/1.json
  def show
    # @places = @bus_route.places
    # @another_places = Place.not_in_object @places
    @places = Place.of_ids(@bus_route.list_places)
    @another_places = Place.not_in_routes(@bus_route.list_places)
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.title
    end
  end

  # GET /bus_routes/new
  def new
    @bus_route = BusRoute.new
  end

  # GET /bus_routes/1/edit
  def edit
  end

  # POST /bus_routes
  # POST /bus_routes.json
  def create
    @bus_route = BusRoute.new(bus_route_params)

    respond_to do |format|
      if @bus_route.save
        format.html { redirect_to @bus_route, notice: 'Bus route was successfully created.' }
        format.json { render :show, status: :created, location: @bus_route }
      else
        format.html { render :new }
        format.json { render json: @bus_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_routes/1
  # PATCH/PUT /bus_routes/1.json
  def update
    respond_to do |format|
      if @bus_route.update(bus_route_params)
        format.html { redirect_to @bus_route, notice: 'Bus route was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_route }
      else
        format.html { render :edit }
        format.json { render json: @bus_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_routes/1
  # DELETE /bus_routes/1.json
  def destroy
    @bus_route.destroy
    respond_to do |format|
      format.html { redirect_to bus_routes_url, notice: 'Bus route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_places
    @bus_route.list_places += @list_places
    @bus_route.save
    # params[:bus_route][:list_places].each do |place|
    #   PlaceRoute.transaction do
    #     PlaceRoute.create place_id: place.to_i, bus_route: @bus_route
    #   end 
    # end
    redirect_to @bus_route
  end

  def destroy_places
    @bus_route.list_places -= @list_places
    @bus_route.save
    # params[:bus_route][:list_places].each do |place|
    #   PlaceRoute.transaction do
    #     place_route = PlaceRoute.find_by place_id: place.to_i, bus_route: @bus_route
    #     place_route.destroy
    #   end 
    # end
    redirect_to @bus_route
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_route
      @bus_route = BusRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_route_params
      params.require(:bus_route).permit(:name, list_places: [])
    end

    def list_places
      @list_places = bus_route_params.values.first.map(&:to_i)
      return if @list_places.any?
      flash[:alert] = t "dashboard.whitelist.update.not_choose"
      redirect_to request.referer
    end
end
