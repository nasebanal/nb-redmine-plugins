class MailTrackersController < ApplicationController
  unloadable

  before_filter :find_project, :authorize, :only => :index

  def index
#    @project = Project.find(params[:project_id])
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end
end
