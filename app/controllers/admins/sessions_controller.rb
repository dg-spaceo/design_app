class Admins::SessionsController < AdminsController
  skip_before_action :authenticate_user!
  layout 'plan_layout'

  def new
  end

  def create
    @user = User.find_by_email(user_params[:email])
    if @user.present? && @user.authenticate(user_params[:password])
      flash.notice = 'Sign-in Successfull'
      session[:user_id] = @user.id
      redirect_to admins_dashboard_path
    else
      flash.alert = 'Username & Password is incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash.notice = 'Sign-out Successfull'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
