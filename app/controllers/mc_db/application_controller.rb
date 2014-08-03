  class McDb::ApplicationController < ApplicationController

  before_filter :authenticate_user

  def index
  end

  def autocomplete
    users = User.autocomplete(params[:q])
    usersmap = Array.new
    users.each do |user|
      usersmap << {"user" => user.last_username}
    end
    render :json => usersmap.to_a
  end

    add_flash_types :error, :success, :alert

    private

      def authenticate_user
        unless current_user && current_user.admin?
            rendirect_to main_app.root_path, error: "You do not have permission to view this page!"
        end
      end

  end
