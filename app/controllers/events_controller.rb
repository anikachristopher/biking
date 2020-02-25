class EventsController < ApplicationController
    get '/events' do
        redirect_if_not_logged_in
        @events = Event.all 
        erb :index 
    end

    get '/events/new' do
        redirect_if_not_logged_in
        erb :new
    end

    post '/events' do
        redirect_if_not_logged_in
        @event = current_user.events.build
    end

        private 

        def event_params
            {date: params[:date], location: params[:location], time: params[:time]}
        end

    end