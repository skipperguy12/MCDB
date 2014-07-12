  class McDb::ApplicationController < ApplicationController
    def index
      flash[:notice] = "HI MOM"
    end

  end
