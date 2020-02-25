class UsersController < ApplicationController
    get '/signup' do
        erb :signup
    end

    post '/signup' do
        @user = user.new(user_params)
        if @user.save 
            redirect '/' 
        else 
            @errors = ["Please enter the required information"]
    end

    private

    def user_params 
        {username: params[:username], password: params[:password]}
    end
end
