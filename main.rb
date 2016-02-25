require './config'

# def current_user
#   session[:user_id].nil? ? nil : User.find(session[:user_id])
# end

def resp(code, result = {})
  {status: code, result: result}.to_json
end

def parsed_params
    puts JSON.parse(params, :symbolize_names => true)
end

get '/' do 
    "Ok"
end

get '/users/all' do 
    @users = User.all
    @users.first.to_json
end

get '/users/:id' do 
    @user = User.find(params[:id])
    @user.to_json
end

namespace '/api' do
    namespace "/users" do 
        post '/' do 
            puts "Params Are: #{params}"
            puts "USER IS: #{user_params}"
            u = User.new(user_params)
            if u.save
                "YEP"
            else
                "NOPe"
            end
            # params = parsed_params[:user]
            # puts "EMAIL"
            # puts parsed_params[:email]
            # @user = User.where(email: params[:email]).first
            # puts @user if @user != nil
            # parsed_params.to_json
            
        end
        get '/' do 
            User.all.to_json
        end
    end
end

private

def user_params
    u = params[:user]
    puts u = JSON.parse(u)

    puts h =  {first_name: u['first_name'], last_name: u['last_name'], email: u['email'], password: u['password']}
    h
end
