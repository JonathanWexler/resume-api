require 'json' 
require 'rest-client' 

class UserClient 
  attr_accessor :first_name, :last_name, :email, :password 

  def initialize options={} 
    @first_name = options[:first_name] 
    @last_name = options[:last_name] 
    @email = options[:email] 
    @password = options[:password] 
  end 

  # def sign_in 
  #   response = RestClient.post 'http://localhost:9292/api/sessions/new', :data => {email: @email, password: @password}.to_json, :accept => :json 
  #   puts response
  # end 

  # def sign_out 
  #   response = RestClient.get 'http://localhost:9292/api/sessions/destroy', :data => {:email => @email}.to_json    
  #   puts response 
  # end 

  # def sessions 
  #   response = RestClient.get 'http://localhost:9292/api/sessions/', :data =>{}.to_json, :accept => :json 
  #   puts response 
  # end 
  def show_all
    response = RestClient.get 'http://localhost:9292/api/users/', :user =>{}, :accept => :json 
    puts response 
  end
  def save 
    response = RestClient.post 'http://localhost:9292/api/users/', :user =>{          first_name: @first_name,
      last_name: @last_name,
      password: @password,
      email: @email}.to_json, :accept => :json 
      puts response 
    end 

  end