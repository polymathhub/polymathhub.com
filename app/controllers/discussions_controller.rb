class DiscussionsController < ApplicationController
  before_action :authenticate_member!, only: [:create, :new]

  def new
    @project = Project.find(params[:project_id])
    @discussion = Discussion.new
  end

  def create
    if (helpers.member_signed_in_and_owns_project?(params[:project_id]))
      @project = Project.find(params[:project_id])
      @discussion = @project.discussions.create(discussion_params)
    end

    redirect_to projects_path(@project)
  end

  private def discussion_params
    params.require(:discussion).permit(:name, :goal)
  end
end
