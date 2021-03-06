require './config/environment'
require 'rack-flash'


class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :welcome
  end

  get '/failure' do
    erb :failure
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      unless logged_in?
        redirect '/login'
    end
  end

  def current_user
    User.find(session[:user_id])
  end
end

end
