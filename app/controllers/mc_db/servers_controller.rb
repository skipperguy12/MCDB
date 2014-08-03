require_dependency "mc_db/application_controller"

module McDb
  class ServersController < ApplicationController
    before_action :set_server, only: [:show, :update, :destroy]
    before_action :compile_cluster_list, only: [:show, :index, :new]
    before_action :fix_cluster, only: [:show]

    # GET /servers
    def index
      @servers = Server.all
    end

    # GET /servers/1
    def show
    end

    # GET /servers/new
    def new
      @server = Server.new
    end

    # POST /servers
    def create
      @server = Server.new(server_params)

      if @server.save
        redirect_to @server, notice: 'Server was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /servers/1
    def update
      if @server.update(server_params)
        redirect_to @server, notice: 'Server was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /servers/1
    def destroy
      @server.destroy
      redirect_to servers_url, notice: 'Server was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_server
        @server = Server.find(params[:id])
      end

      def compile_cluster_list
        @clusters = Array.new
        McDb::Cluster.all.each do |cluster|
          @clusters << cluster.name
        end
      end

      def fix_cluster
        @server.cluster = McDb::Cluster.where(:id => @server.cluster).first.name
      end

      # Only allow a trusted parameter "white list" through.
      def server_params
        params.require(:server).permit(:name, :address, :visibility, :internal_name, :internal_address, :port, :internal_port, :max_players, :uptime, :online_players, :online_staff, :online, :cluster)
      end
  end
end
