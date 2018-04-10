require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/flash'
require './models'
require 'rake'
enable :sessions

set :database, "sqlite3:second_app.sqlite3"

post'/users' do
  @newpost = Post.create( title: params[:title], content: params[:blog], user_id: current_user.id)
end

def current_user
    if session[:user_id]
        @current_user = User.find(session[:user_id])
    end
end

get '/' do
    erb :home
end

get '/about' do
    @users = User.all
    erb :about
end

get '/about/:id' do
    @user = User.find(params[:id])
    erb :abouts
end

get '/users' do
    @users = User.all
    erb :users
end

get '/user/:id' do
    @user = User.find(params[:id])
    @posts = @user.posts
    erb :user
end

get '/user' do
  erb :user
end	

post '/user' do
    @user = current_user
    if params[:fnameEd].empty?
      @user.fname = @user.fname
    else
       @user.fname = params[:fnameEd]
    end

    if params[:lnameEd].empty?
      @user.lname == @user.lname
    else
       @user.lname = params[:lnameEd]
    end

    if params[:passEd].empty?
      @user.password == @user.password
    else
       @user.password = params[:passEd]
    end

    if params[:ageEd].empty?
      @user.age == @user.age
    else
       @user.age = params[:ageEd]
    end
    @user.save
    redirect ('/users')
end

get '/user/destroy/:id' do
    session[:user_id] = nil
    @user = User.find(params[:id])
    @user.destroy
    erb :home
end

get '/account' do
    erb :account
end

get '/sign-out' do
  session[:user_id] = nil
  redirect '/'
end

post '/users/new' do
    puts "****************************"
    puts params
    puts "****************************"
    User.create(params[:post])
    redirect '/users'
end

post '/sign-in' do
    @user = User.where(fname: params[:fname]).first
    if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect '/about'
    else
        flash[:notice] = "FAILED LOGIN :("
        redirect '/not-signed-in'
    end
end

post '/not_signed_in' do
    erb :not_signed_in
end

get '/not-signed-in' do
    erb :not_signed_in
end
