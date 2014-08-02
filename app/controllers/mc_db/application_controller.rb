  class McDb::ApplicationController < ApplicationController
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
  end
