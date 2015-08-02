class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create_invited_user(user_params)
    if user.save
      flash[:notice] = "Success!"
      UserMailer.invite(user.id).deliver_now
    else
      flash[:notice] = "You must be missing something."
    end
    redirect_to new_user_path
  end

  def edit
    @user = User.find params[:id]
    token = params[:token]
    if token != @user.confirmation_hash
      #TODO we should add error pages with explanations
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :role)
  end
end
