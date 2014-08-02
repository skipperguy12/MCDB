require_dependency "mc_db/application_controller"

module McDb
  class MembersController < ApplicationController
    before_action :group, only: [:create, :destroy]

    def create
      if User.where(:last_username => params[:user_id]).first == nil
        flash[:alert] = "That User does not exist!"
        redirect_to groups_path + '/'
      end
      player = User.where(:last_username => params[:user_id]).first
      unless @group.members && @group.members.include?(player.id)
          @group.members << player.id
          @group.save
      end
      redirect_to @group
    end

    def destroy
      @user = User.where(:id => group.members[params[:id].to_f]).first
      @group.members.delete(@user.id)
      puts "#{@user.last_username}"
      @group.save
      flash[:alert] = @user.last_username + " was removed from the group"
      redirect_to @group
    end

    private

    def group
      @group = Group.find(params[:group_id])
    end
  end
end
