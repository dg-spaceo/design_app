class AdminsController < ApplicationController
  before_action :authenticate_user!

  layout 'admin_layout'

  private

  def authenticate_user!
    if session[:user_id].present?
      @current_user = User.find_by_id(session[:user_id].to_i)
      redirect_to admins_sign_in_path if @current_user.blank?
    else
      redirect_to admins_sign_in_path
    end
  end
end
