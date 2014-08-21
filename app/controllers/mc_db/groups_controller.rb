require_dependency "mc_db/application_controller"

module McDb
  class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :update, :destroy]
    before_action :compile_cluster_list, only: [:show, :new]
    before_action :fix_cluster, only: [:show]

    # GET /groups
    def index
      @groups = Group.all.desc(:priority)
    end

    # GET /groups/1
    def show
      if @group.mc_permissions != nil
        @group.mc_permissions = @group.mc_permissions.join("\n")
      end
    end

    # GET /groups/new
    def new
      @group = Group.new
    end

    # POST /groups
    def create
      @group = Group.new(group_params)

      if @group.save
        redirect_to @group, notice: 'Group was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /groups/1
    def update
      if @group.update(group_params)
        redirect_to @group, notice: 'Group was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /groups/1
    def destroy
      @group.destroy
      redirect_to groups_url, notice: 'Group was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_group
        @group = Group.find(params[:id])
      end

      def compile_cluster_list
        @clusters = Array.new
        Cluster.all.each do |cluster|
          @clusters << cluster.name
        end
      end

      def fix_cluster
        @group.cluster = Cluster.where(:id => @group.cluster).first.name if @group.cluster
      end

      # Only allow a trusted parameter "white list" through.
      def group_params
        params.require(:group).permit(:name, :flair, :flair_color, :priority, :members, :mc_permissions, :cluster, :web_permissions, :give_to_new, :is_staff)
      end
  end
end
