class ApplicationController < ActionController::Base
  config.time_zone = 'Eastern Time (US & Canada)'
  protect_from_forgery

  def after_sign_in_path_for(resources)
    meetups_path
  end
end