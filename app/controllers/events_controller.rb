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
        @event = current_user.events.build(event_params)
        @event.user = User.find(session[:user_id])
        if @event.save
            erb :show
        else 
            event_params.nil? || event_params.empty?
            @errors = ["Event is Invalid"]
            erb :failure
        end
    end

    get '/events/:id' do
        @event = Event.find(params[:id])
        erb :show
    end

    get '/events/:id/edit' do
        redirect_if_not_logged_in
        if current_user 
            @event = current_user.events.find_by(id: params[:id])
            if @event 
                erb :edit
            else 
                redirect '/'
            end
        else 
            redirect '/'
        end
    end

    patch '/events/:id' do 
        redirect_if_not_logged_in
        @event = current_user.events.find_by(id: params[:id])
        @event.date = params[:date] 
        @event.location = params[:location]
        @event.time = params[:time]
        @event.save 
        erb :show
    end

    delete '/events/:id' do
        redirect_if_not_logged_in
        if current_user
            @event = current_user.events.find_by(id: params[:id])
            if @event
                @event.delete
                redirect '/profile'
            else 
                redirect '/'
            end
             else 
            redirect '/'
        end
    end

        private 

    def event_params
        {date: params[:date], location: params[:location], time: params[:time]}
    end

    end