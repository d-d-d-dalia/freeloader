class SubscriptionsController < ApplicationController

    get '/subscriptions/new' do
        erb :'subscriptions/new'
    end

    post '/subscriptions' do
        @subscription = current_user.subscriptions.create(service: params[:service])
        redirect :"subscriptions/#{@subscription.id}"
    end

    get '/subscriptions' do
        @subscriptions = current_user.subscriptions
        erb :'subscriptions/index'
    end

    get '/subscriptions/:id' do
        @subscription = Subscription.find(params[:id])
        erb :'subscriptions/show'
    end

    get '/subscriptions/:id/edit' do # like get /new
        @subscription = Subscription.find(params[:id])
        erb :'subscriptions/edit'
    end

    patch '/subscriptions/:id' do # like post /subscriptions
        #does the subscription in question belong to the current_user
        @subscription = Subscription.find(params[:id])
        @subscription.update(service: params[:service])
        redirect :"/subscriptions/#{@subscription.id}"
    end

    delete '/subscriptions/:id/delete' do
        @subscription = Subscription.find(params[:id])
        @subscription.delete
        redirect :'/subscriptions'
    end

end