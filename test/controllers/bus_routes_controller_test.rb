require 'test_helper'

class BusRoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_route = bus_routes(:one)
  end

  test "should get index" do
    get bus_routes_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_route_url
    assert_response :success
  end

  test "should create bus_route" do
    assert_difference('BusRoute.count') do
      post bus_routes_url, params: { bus_route: { name: @bus_route.name } }
    end

    assert_redirected_to bus_route_url(BusRoute.last)
  end

  test "should show bus_route" do
    get bus_route_url(@bus_route)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_route_url(@bus_route)
    assert_response :success
  end

  test "should update bus_route" do
    patch bus_route_url(@bus_route), params: { bus_route: { name: @bus_route.name } }
    assert_redirected_to bus_route_url(@bus_route)
  end

  test "should destroy bus_route" do
    assert_difference('BusRoute.count', -1) do
      delete bus_route_url(@bus_route)
    end

    assert_redirected_to bus_routes_url
  end
end
