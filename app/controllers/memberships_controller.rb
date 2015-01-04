class MembershipsController < ApplicationController

    before_action do
     @project = Project.find(params[:project_id])
    end

    def index
      @memberships = @project.memberships.all
      @membership = @project.memberships.new
    end

    def create
      @membership = @project.memberships.new(membership_params)
      if @membership.save
        redirect_to project_memberships_path(@project), notice: "#{@membership.user.name} was successfully created."
      else
        redirect_to project_memberships_path(@project), alert: @membership.errors.full_messages
      end
    end

    def destroy
      @membership = @project.memberships.find(params[:id])
      if @membership.destroy
       redirect_to project_memberships_path(@project), notice: "#{@membership.user.name} was removed successfully."
      else
        redirect_to project_memberships_path(@project)
      end
    end

    def update
      @membership = @project.memberships.find(params[:id])
      if @membership.update(membership_params)
        redirect_to project_memberships_path(@project), notice: "#{@membership.user.name} was successfully updated."
      else
        render :index
      end
    end

    private

    def membership_params
      params.require(:membership).permit(:project_id, :user_id, :role)


    end

end
