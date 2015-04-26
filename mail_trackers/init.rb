Redmine::Plugin.register :mail_trackers do
  name 'Mail Trackers plugin'
  author 'Shunjiro Yatsuzuka'
  description 'This is a plugin for Mail Tracking connecting with SparkPost'
  version '0.0.1'
  url 'https://github.com/nasebanal/nb-redmine-plugins'
  author_url 'https://github.com/syatsuzuka'
  project_module :mail_trackers do
    permission :mail_trackers, :mail_trackers => [:index, :summary, :bounce, :reject, :delay]
  end
  menu :project_menu, :mail_trackers, { :controller => 'mail_trackers', :action => 'index' }, :caption => 'MailTrackers', :after => :repository, :param => :project_id
end
