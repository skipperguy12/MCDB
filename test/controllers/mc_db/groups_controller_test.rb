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
        post :create, group: { active: @group.active, cluster: @group.cluster, html_color: @group.html_color, members: @group.members, minecraft_permissions: @group.minecraft_permissions, name: @group.name, priority: @group.priority, staff: @group.staff, website_permissions: @group.website_permissions }
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
      patch :update, id: @group, group: { active: @group.active, cluster: @group.cluster, html_color: @group.html_color, members: @group.members, minecraft_permissions: @group.minecraft_permissions, name: @group.name, priority: @group.priority, staff: @group.staff, website_permissions: @group.website_permissions }
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
