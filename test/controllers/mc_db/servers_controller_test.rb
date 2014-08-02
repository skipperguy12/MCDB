require 'test_helper'

module McDb
  class ServersControllerTest < ActionController::TestCase
    setup do
      @server = servers(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:servers)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create server" do
      assert_difference('Server.count') do
        post :create, server: { address: @server.address, internal_address: @server.internal_address, internal_name: @server.internal_name, internal_port: @server.internal_port, max_players: @server.max_players, name: @server.name, online: @server.online, online_players: @server.online_players, online_staff: @server.online_staff, port: @server.port, uptime: @server.uptime, visibility: @server.visibility }
      end

      assert_redirected_to server_path(assigns(:server))
    end

    test "should show server" do
      get :show, id: @server
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @server
      assert_response :success
    end

    test "should update server" do
      patch :update, id: @server, server: { address: @server.address, internal_address: @server.internal_address, internal_name: @server.internal_name, internal_port: @server.internal_port, max_players: @server.max_players, name: @server.name, online: @server.online, online_players: @server.online_players, online_staff: @server.online_staff, port: @server.port, uptime: @server.uptime, visibility: @server.visibility }
      assert_redirected_to server_path(assigns(:server))
    end

    test "should destroy server" do
      assert_difference('Server.count', -1) do
        delete :destroy, id: @server
      end

      assert_redirected_to servers_path
    end
  end
end
