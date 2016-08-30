require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
  )

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
  end

class Comment < ActiveRecord::Base
end

get '/' do
  @comments = Comment.order("id desc").all
  erb :index2
end

post '/new' do
  Comment.create({:body => params[:body]})
  redirect '/'
end

post '/delete' do
  Comment.find(params[:id]).destroy
end

#6,7,8,9,10回
#before do
 # @auther = "keisuke"
#end

#after do
 # logger.info "page displayed successfully"
#end

#helpers do
 # def strong(s)
  #  "<strong>#{s}</strong>"
  #end
#end

#get '/' do
 # @name = "ikeda"+ @auther
  #@str = "main"
  #erb :index
#end

#get '/about' do
 # @about = "this page is ..."+ strong(@auther)
 # @str = "kei@gmail.com"
 # erb :about
#end



#4,5回
#get '/from/*/to/*' do |f,t|

 #"from #{f} to #{t}"
#end

#2,3回
#get '/' do

 # "hello world"
  #erb :index
#end
