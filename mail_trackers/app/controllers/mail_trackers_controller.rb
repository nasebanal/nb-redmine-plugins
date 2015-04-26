class MailTrackersController < ApplicationController
  unloadable

  before_filter :find_project, :authorize, :only => :index

  def index
    @yaml = Rails.root.join('config','configuration.yml')

    if File.exists? ( @yaml )
      @config = YAML.load_file( @yaml )
    else
      @config = {}
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end
end
