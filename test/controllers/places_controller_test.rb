require 'test_helper'

class BusStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_station = bus_stations(:one)
  end

  test "should get index" do
    get bus_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_station_url
    assert_response :success
  end

  test "should create bus_station" do
    assert_difference('BusStation.count') do
      post bus_stations_url, params: { bus_station: { address: @bus_station.address, latitude: @bus_station.latitude, longtitude: @bus_station.longtitude, name: @bus_station.name, title: @bus_station.title } }
    end

    assert_redirected_to bus_station_url(BusStation.last)
  end

  test "should show bus_station" do
    get bus_station_url(@bus_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_station_url(@bus_station)
    assert_response :success
  end

  test "should update bus_station" do
    patch bus_station_url(@bus_station), params: { bus_station: { address: @bus_station.address, latitude: @bus_station.latitude, longtitude: @bus_station.longtitude, name: @bus_station.name, title: @bus_station.title } }
    assert_redirected_to bus_station_url(@bus_station)
  end

  test "should destroy bus_station" do
    assert_difference('BusStation.count', -1) do
      delete bus_station_url(@bus_station)
    end

    assert_redirected_to bus_stations_url
  end
end
