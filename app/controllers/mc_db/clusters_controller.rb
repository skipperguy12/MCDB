require_dependency "mc_db/application_controller"

module McDb
  class ClustersController < ApplicationController
    before_action :set_cluster, only: [:show, :edit, :update, :destroy]

    # GET /clusters
    def index
      @clusters = Cluster.all
    end

    # GET /clusters/1
    def show
    end

    # GET /clusters/new
    def new
      @cluster = Cluster.new
    end

    # GET /clusters/1/edit
    def edit
    end

    # POST /clusters
    def create
      @cluster = Cluster.new(cluster_params)

      if @cluster.save
        redirect_to @cluster, success: 'Cluster was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /clusters/1
    def update
      if @cluster.update(cluster_params)
        redirect_to @cluster, success: 'Cluster was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /clusters/1
    def destroy
      @cluster.destroy
      redirect_to clusters_url, notice: 'Cluster was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cluster
        @cluster = Cluster.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def cluster_params
        params.require(:cluster).permit(:name)
      end
  end
end
