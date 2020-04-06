class MovieController < ApplicationController

    #create

    get '/movie/new' do
        if logged_in?
            erb :'movie/new'
        else 
            flash[:alert] = "Please login to add a new movie"
            redirect "/user/login"
        end
    end 

    post '/movie/add' do
        @movie = Movie.create(
            name: params[:title], 
            year: params[:year],
            category: params[:category],
            rating: params[:rating]
        )
        @user = current_user
        @user.movies << @movie
        redirect "/movie/#{@movie.id}"
    end 

    #read
    
    get '/movie/:id' do
        @movie = Movie.find(params[:id])
        erb :'/movie/show'
    end 

    get '/movies' do
        @movies = Movie.all
        erb :'/movie/index'
    end 
    
    #update

    get '/movie/:id/edit' do
        @movie = Movie.find(params[:id])
        erb :'/movie/edit'
    end

    post '/movie/:id' do
        @movie = Movie.find(params[:id])
        @movie.update(
            name: params[:title], 
            year: params[:year],
            category: params[:category],
            rating: params[:rating]
        )
        redirect "/movie/#{@movie.id}"
    end
    #delete

    delete '/movie/:id' do
        @movie = Movie.find(params[:id])
        @movie.delete
        redirect '/movies'
    end 

end 