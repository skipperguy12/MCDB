require_dependency "mc_db/application_controller"

module McDb
  class PunishmentsController < ApplicationController
    before_action :set_punishment, only: [:show, :edit, :update, :destroy]
    before_action :compile_cluster_list, only: [:show]
    before_action :fix_cluster, only: [:show]

    # GET /punishments
    def index
      @punishments = Punishment.all
    end

    # GET /punishments/1
    def show
    end

    # GET /punishments/new
    def new
      @punishment = Punishment.new
    end

    # GET /punishments/1/edit
    def edit
    end

    # POST /punishments
    def create
      @punishment = Punishment.new(punishment_params)

      if @punishment.save
        redirect_to @punishment, notice: 'Punishment was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /punishments/1
    def update
      if @punishment.update(punishment_params)
        redirect_to @punishment, notice: 'Punishment was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /punishments/1
    def destroy
      @punishment.destroy
      redirect_to punishments_url, notice: 'Punishment was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_punishment
        @punishment = Punishment.find(params[:id])
      end

      def compile_cluster_list
        @clusters = Array.new
        Cluster.all.each do |cluster|
          @clusters << cluster.name
        end
      end

      def fix_cluster
        @punishment.cluster = Cluster.where(:id => @punishment.cluster).first.name
      end

      # Only allow a trusted parameter "white list" through.
      def punishment_params
        params.require(:punishment).permit(:punisher, :punished, :reason, :server, :type, :cluster, :active, :appealable, :automatic, :when, :expires)
      end
  end
end
