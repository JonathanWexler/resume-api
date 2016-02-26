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
                u
            else
                "Was not able to save the user"
            end
        end
        get '/' do 
            User.all.to_json
        end
    end
    namespace '/experiences' do 
        post '/' do 
            puts "Params Are: #{params}"
            puts "USER IS: #{experience_params}"
            e = Experience.new(experience_params)
            if e.save
                e
            else
                "Was not able to save the Experience"
            end
            
        end

        get '/' do 
            Experience.all.to_json
        end
    end
end

private

def user_params
    u = JSON.parse(params[:user])
    {first_name: u['first_name'], last_name: u['last_name'], email: u['email'], password: u['password']}
end

def experience_params
    u = JSON.parse(params[:experience])
    {title: u['title'], position: u['position'], start_date: u['start_date'], end_date: u['end_date'], description: u['description']}
end
