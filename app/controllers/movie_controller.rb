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
        if logged_in?
            @movie = Movie.find(params[:id])
            erb :'/movie/show'
        else
            flash[:alert] = "Please login to see movies"
            redirect "/user/login"
        end
    end 

    get '/movies' do
        if logged_in?
            @movies = Movie.all
            erb :'/movie/index'
        else 
            flash[:alert] = "Please login to see movies"
            redirect "/user/login"
        end
    end 
    
    #update

    get '/movie/:id/edit' do
        @movie = Movie.find(params[:id])
        if !logged_in?
            flash[:alert] = "Please login to edit movies"
            redirect "/user/login"
        elsif @movie.user != current_user
            redirect '/user/login'
        else
            erb :'/movie/edit'
        end 
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
        if !logged_in?
            flash[:alert] = "Please login to delete movies"
            redirect "/user/login"
        elsif @movie.user != current_user
            redirect '/user/login'
        else
            @movie.delete
            redirect '/movies'
        end 
    end 

end 