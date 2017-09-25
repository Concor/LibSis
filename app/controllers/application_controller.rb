class ApplicationController < ActionController::Base
  USERS = { "kosenko" => "711782","r.nesytov"=>"123456" }
 
  before_action :authenticate
 
  
 
  
  protect_from_forgery with: :exception
  private

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
