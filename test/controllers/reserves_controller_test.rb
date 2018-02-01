require 'test_helper'

class ReservesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reserf = reserves(:one)
  end

  test "should get index" do
    get reserves_url
    assert_response :success
  end

  test "should get new" do
    get new_reserf_url
    assert_response :success
  end

  test "should create reserf" do
    assert_difference('Reserve.count') do
      post reserves_url, params: { reserf: { busy: @reserf.busy, exitTime: @reserf.exitTime, initTime: @reserf.initTime, price: @reserf.price, slot_id: @reserf.slot_id, totalTime: @reserf.totalTime, vehicle_id: @reserf.vehicle_id } }
    end

    assert_redirected_to reserf_url(Reserve.last)
  end

  test "should show reserf" do
    get reserf_url(@reserf)
    assert_response :success
  end

  test "should get edit" do
    get edit_reserf_url(@reserf)
    assert_response :success
  end

  test "should update reserf" do
    patch reserf_url(@reserf), params: { reserf: { busy: @reserf.busy, exitTime: @reserf.exitTime, initTime: @reserf.initTime, price: @reserf.price, slot_id: @reserf.slot_id, totalTime: @reserf.totalTime, vehicle_id: @reserf.vehicle_id } }
    assert_redirected_to reserf_url(@reserf)
  end

  test "should destroy reserf" do
    assert_difference('Reserve.count', -1) do
      delete reserf_url(@reserf)
    end

    assert_redirected_to reserves_url
  end
end
