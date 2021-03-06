class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/' do
        erb :home
    end

    helpers do

        def current_user
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end
    
        def logged_in?
          !!current_user
        end
    
    end

end