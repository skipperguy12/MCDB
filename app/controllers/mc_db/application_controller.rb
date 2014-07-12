  class McDb::ApplicationController < ApplicationController
    def index
    end

    add_flash_types :error, :success, :alert
  end
