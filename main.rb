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
    # namespace "/sessions" do
    # # get "/" do
    # #   session[:user_id].as_json
    # # end

    #     post "/new" do
    #          puts "SIGNING IN"
    #          # jdata = JSON.parse(params[:data],:symbolize_names => true) 
    #          jons = JSON.parse(params[:params], :symbolize_names => true)
    #          puts "params are #{jons.inspect}"

    #          @user = User.authenticate(jons[:email], jons[:password])
    #          @user ? session[:user_id] = @user.id : nil
    #          @user.to_json 
    #     end  

    #     get "/destroy" do
    #       session[:user_id] = nil
    #       {success: "User logged out successfully."}.to_json
    #     end
    # end

    namespace "/users" do 
        post '/' do 
            puts "Params Are: #{params}"
            # params = parsed_params[:user]
            # puts "EMAIL"
            # puts parsed_params[:email]
            # @user = User.where(email: params[:email]).first
            # puts @user if @user != nil
            # parsed_params.to_json
            "PARAMS"
        end
        get '/' do 
            User.all.to_json
        end
    end
end
