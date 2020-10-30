class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    get '/signin' do
        erb :'/users/signin'
    end

    post '/signup' do
        user = User.create(params)
        session[:user_id] = user.id
        redirect "/users/#{user.id}"
    end

    post '/signin' do
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
        else
            redirect '/signin'
        end
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        #@subscriptions defined here so that user show page can function
        #as the index of the user's subscriptions
        erb :'users/show'
    end

    get '/logout' do
        session.clear
        redirect :'/signin'
    end

end