require 'json' 
require 'rest-client' 

class ExpClient 
  attr_accessor :title, :position, :description 

  def initialize options={} 
    # @first_name = options[:first_name] 
    # @last_name = options[:last_name] 
    # @email = options[:email] 
    # @password = options[:password] 
  end 

  def show_all
    response = RestClient.get 'http://localhost:9292/api/experiences/', :experience =>{}, :accept => :json 
    puts response 
  end
  def save 
    response = RestClient.post 'http://localhost:9292/api/experiences/', :experience =>{ 
      title: title,
      position: position,
      description: "",
      start_date: "date"}.to_json, :accept => :json 
      puts response 
    end 
  end