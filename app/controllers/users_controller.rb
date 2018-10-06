class UsersController < ApplicationController
	layout 'users'
	
  def new
  end

  def create 
  	user = User.find_by_phone(params[:phone])
  	return render json: { error: 'error-exsit-phone' } if user.present?

  	user = User.create(name: params[:name], phone: params[:phone])
  	render json: { status: 'ok' }
  end
end
