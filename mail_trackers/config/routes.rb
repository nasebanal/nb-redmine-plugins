# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'mail_trackers', :to => 'mail_trackers#index'
get 'mail_trackers/summary', :to => 'mail_trackers#summary'
get 'mail_trackers/bounce', :to => 'mail_trackers#bounce'
get 'mail_trackers/reject', :to => 'mail_trackers#reject'
get 'mail_trackers/delay', :to => 'mail_trackers#delay'
