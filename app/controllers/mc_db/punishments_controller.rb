require_dependency "mc_db/application_controller"

module McDb
  class PunishmentsController < ApplicationController
    before_action :set_punishment, only: [:show, :edit, :update, :destroy]

    # GET /punishments
    def index
      @punishments = Punishment.all.page(params[:page])
    end

    # GET /punishments/1
    def show
    end

    # GET /punishments/new
    #
    # Creation in-game only for now
    #def new
    #  @punishment = Punishment.new
    #end
    #

    # GET /punishments/1/edit
    def edit
      @expires = Hash.new
      @punishment.expires = Time.at(0) if @punishment.expires == nil
      @original = (@punishment.expires.mjd - @punishment.created.mjd).to_i # 7
      @days_left = (@punishment.expires.mjd - DateTime.now.mjd).to_i # 5
      @expires.merge!({"Never - Permanent ban" => nil})
      60.downto(-60) do |n|
        @expires.merge!({n.to_s + " day" + (n == 1 ? "" : "s") + " from now - " + (n - @days_left + @original).to_s + " day ban" => @punishment.expires - (@days_left - n).days})
      end
    end

    # POST /punishments
    #def create
    #  @punishment = Punishment.new(punishment_params)
    #
    #  if @punishment.save
    #    redirect_to @punishment, notice: 'Punishment was successfully created.'
    #  else
    #    render :new
    #  end
    #end

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

      # Only allow a trusted parameter "white list" through.
      def punishment_params
        params.require(:punishment).permit(:reason, :created, :expires, :type, :punisher, :punished, :appealable, :cluster, :active)
      end
  end
end
