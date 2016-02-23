require './config'

def current_user
  session[:user_id].nil? ? nil : User.find(session[:user_id])
end

def resp(code, result = {})
  {status: code, result: result}.to_json
end

get '/' do 

    "Ok"
end

namespace '/api' do
  namespace "/sessions" do
    get "/" do
      resp(200, current_user.as_json)
  end

  post "/new" do
      @user = User.authenticate(params[:email], params[:password])
      @user ? session[:user_id] = @user.id : nil
      resp(200, current_user.as_json)
  end

  get "/destroy" do
      session[:user_id] = nil
      resp(200, {success: "User logged out successfully."})
  end
end
end
