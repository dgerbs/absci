require 'test_helper'

class ProtocolsControllerTest < ActionController::TestCase
  setup do
    @protocol = protocols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:protocols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create protocol" do
    assert_difference('Protocol.count') do
      post :create, protocol: { blocking_buffer: @protocol.blocking_buffer, cell: @protocol.cell, description: @protocol.description, detection: @protocol.detection, gel: @protocol.gel, lysis_buffer: @protocol.lysis_buffer, membrane: @protocol.membrane, primary_description: @protocol.primary_description, secondary_description: @protocol.secondary_description, statement: @protocol.statement, transfer: @protocol.transfer, washes: @protocol.washes }
    end

    assert_redirected_to protocol_path(assigns(:protocol))
  end

  test "should show protocol" do
    get :show, id: @protocol
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @protocol
    assert_response :success
  end

  test "should update protocol" do
    put :update, id: @protocol, protocol: { blocking_buffer: @protocol.blocking_buffer, cell: @protocol.cell, description: @protocol.description, detection: @protocol.detection, gel: @protocol.gel, lysis_buffer: @protocol.lysis_buffer, membrane: @protocol.membrane, primary_description: @protocol.primary_description, secondary_description: @protocol.secondary_description, statement: @protocol.statement, transfer: @protocol.transfer, washes: @protocol.washes }
    assert_redirected_to protocol_path(assigns(:protocol))
  end

  test "should destroy protocol" do
    assert_difference('Protocol.count', -1) do
      delete :destroy, id: @protocol
    end

    assert_redirected_to protocols_path
  end
end
