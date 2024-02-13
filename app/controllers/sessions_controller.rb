class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

	# if the user is found and the password is correct, we will return a token. Otherwise, we will return an error message
	# payload represents the data that we want to include in our token. We are passing in the user's id as the payload.
  

  private

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i  # convert to integer
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
	# encoding payload and expiration time of the token, using the secret key base of Rails object (Rails::Application class) to encode 

  #- test to login in Postman using post /login, enter username and password created
   # -> the result is token# , e.g "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE3MDcSdo"


