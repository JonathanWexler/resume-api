require './config'


# def current_user
#   session[:user_id].nil? ? nil : User.find(session[:user_id])
# end

# def resp(code, result = {})
#   {status: code, result: result}.to_json
# end

get '/' do 

    "Ok"
end

# namespace '/api' do

# end
