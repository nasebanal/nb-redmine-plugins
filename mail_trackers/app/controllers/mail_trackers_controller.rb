class MailTrackersController < ApplicationController
  unloadable

  before_filter :find_project, :get_params, :authorize, :only => [:index, :summary, :bounce, :delay, :reject]

  def index
    @yaml = Rails.root.join('config','configuration.yml')

    if File.exists? ( @yaml )
      @config = YAML.load_file( @yaml )
      @address = @config["production"]["email_delivery"]["smtp_settings"]["address"]
      @domain = @config["production"]["email_delivery"]["smtp_settings"]["domain"]
      @user_name = @config["production"]["email_delivery"]["smtp_settings"]["user_name"]
      @password = @config["production"]["email_delivery"]["smtp_settings"]["password"]
    else
      @config = {}
    end
  end


  def summary


    #======= Get Metrics =======
#    url = "https://api.sparkpost.com/api/v1/metrics/deliverability?from=2014-07-11T08:00&to=2014-07-20T09:00&domains=gmail.com,yahoo.com,hotmail.com&campaigns=Black Friday&templates=summer-sale&sandbox=true&metrics=count_injected&timezone=America/New_York"
    url = "https://private-anon-614d24f90-sparkpostapi.apiary-mock.com/api/v1/metrics/deliverability/time-series?from=2014-07-11T07:00&to=2014-07-20T08:00&domains=gmail.com,yahoo.com,hotmail.com&campaigns=summerSale,promotionX&templates=summer-sale&sandbox=true&precision=day&metrics=metrics&timezone=America/New_York"

    begin
      @response = {}
      @response['results'] = [{},{}]
      json = RestClient.get  url, :authorization => @password , :accept => "application/json"
      @response = JSON.parse json
    rescue => ex
      @message = ex.message
    end
  end


  def bounce
    
    #======= Get Metrics =======

    url = "https://private-anon-614d24f90-sparkpostapi.apiary-mock.com/api/v1/metrics/deliverability/time-series?from=2014-07-11T07:00&to=2014-07-20T08:00&domains=gmail.com,yahoo.com,hotmail.com&campaigns=summerSale,promotionX&templates=summer-sale&sandbox=true&precision=day&metrics=metrics&timezone=America/New_York"

    json = RestClient.get  url, :authorization => @password , :accept => "application/json"
    @response = JSON.parse json
  end

  def reject

    #======= Get Metrics =======

    url = "https://private-anon-614d24f90-sparkpostapi.apiary-mock.com/api/v1/metrics/deliverability/time-series?from=2014-07-11T07:00&to=2014-07-20T08:00&domains=gmail.com,yahoo.com,hotmail.com&campaigns=summerSale,promotionX&templates=summer-sale&sandbox=true&precision=day&metrics=metrics&timezone=America/New_York"

    json = RestClient.get  url, :authorization => @password , :accept => "application/json"
    @response = JSON.parse json
  end

  def delay

    #======= Get Metrics =======

    url = "https://private-anon-614d24f90-sparkpostapi.apiary-mock.com/api/v1/metrics/deliverability/time-series?from=2014-07-11T07:00&to=2014-07-20T08:00&domains=gmail.com,yahoo.com,hotmail.com&campaigns=summerSale,promotionX&templates=summer-sale&sandbox=true&precision=day&metrics=metrics&timezone=America/New_York"

    json = RestClient.get  url, :authorization => @password , :accept => "application/json"
    @response = JSON.parse json
  end

  private


  def get_params
    @from = params[:from]
    @to = params[:to]
    @domains = params[:domains]
    @campaigns = params[:campaigns]
    @templates = params[:templates]
    @sandbox = params[:sandbox]
  end

  def find_project
    @project_id = params[:project_id]
    @project = Project.find(params[:project_id])
  end
end
