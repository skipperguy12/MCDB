require 'test_helper'

module McDb
  class GroupsControllerTest < ActionController::TestCase
    setup do
      @group = groups(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:groups)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create group" do
      assert_difference('Group.count') do
        post :create, group: { cluster: @group.cluster, flair: @group.flair, flair_color: @group.flair_color, mc_permissions: @group.mc_permissions, members: @group.members, name: @group.name, priority: @group.priority, web_permissions: @group.web_permissions }
      end

      assert_redirected_to group_path(assigns(:group))
    end

    test "should show group" do
      get :show, id: @group
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @group
      assert_response :success
    end

    test "should update group" do
      patch :update, id: @group, group: { cluster: @group.cluster, flair: @group.flair, flair_color: @group.flair_color, mc_permissions: @group.mc_permissions, members: @group.members, name: @group.name, priority: @group.priority, web_permissions: @group.web_permissions }
      assert_redirected_to group_path(assigns(:group))
    end

    test "should destroy group" do
      assert_difference('Group.count', -1) do
        delete :destroy, id: @group
      end

      assert_redirected_to groups_path
    end
  end
end
