class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token  

	layout 'users'
	
  def new
  end

  def create 
    if params[:name].blank?
      flash[:not_right_name] = '请输入正确的姓名'
      return redirect_to :back
    elsif params[:name].blank?
      flash[:not_right_phone] = '请输入正确的手机号码'
      return redirect_to :back
    end

    user = User.find_by_phone(params[:phone])

    if user.present?
      flash[:exit_phone] = '该手机号码已经报名成功!'
      return redirect_to :back
    end

  	user = User.create(name: params[:name], phone: params[:phone])
    redirect_to success_users_path
  end
end
