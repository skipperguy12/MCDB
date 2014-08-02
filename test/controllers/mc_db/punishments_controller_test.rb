require 'test_helper'

module McDb
  class PunishmentsControllerTest < ActionController::TestCase
    setup do
      @punishment = punishments(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:punishments)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create punishment" do
      assert_difference('Punishment.count') do
        post :create, punishment: { active: @punishment.active, appealable: @punishment.appealable, automatic: @punishment.automatic, cluster: @punishment.cluster, expires: @punishment.expires, punished: @punishment.punished, punisher: @punishment.punisher, reason: @punishment.reason, server: @punishment.server, type: @punishment.type, when: @punishment.when }
      end

      assert_redirected_to punishment_path(assigns(:punishment))
    end

    test "should show punishment" do
      get :show, id: @punishment
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @punishment
      assert_response :success
    end

    test "should update punishment" do
      patch :update, id: @punishment, punishment: { active: @punishment.active, appealable: @punishment.appealable, automatic: @punishment.automatic, cluster: @punishment.cluster, expires: @punishment.expires, punished: @punishment.punished, punisher: @punishment.punisher, reason: @punishment.reason, server: @punishment.server, type: @punishment.type, when: @punishment.when }
      assert_redirected_to punishment_path(assigns(:punishment))
    end

    test "should destroy punishment" do
      assert_difference('Punishment.count', -1) do
        delete :destroy, id: @punishment
      end

      assert_redirected_to punishments_path
    end
  end
end
