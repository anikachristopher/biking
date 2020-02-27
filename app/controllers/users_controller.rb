class UsersController < ApplicationController
    get '/signup' do
        erb :signup
    end

    post '/signup' do
        @user = User.new(user_params)
        if @user.save 
            redirect '/' 
        else 
            @errors = ["Please enter the required information"]
            erb :failure
        end
    end

    get '/login' do
        erb :login
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect '/profile'
        else
            @errors = ["Please enter valid information"]
            erb :failure
        end
    end

    get '/signout' do
        redirect_if_not_logged_in
        session.clear 
        redirect '/'
    end

    get '/profile' do
        redirect_if_not_logged_in
        @user = User.find(session[:user_id])
        erb :profile
    end

    private

    def user_params 
        {username: params[:username], password: params[:password]}
    end
end
