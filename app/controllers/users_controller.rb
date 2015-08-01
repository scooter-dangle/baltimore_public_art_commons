class UsersController < ApplicationController

  require 'random_hash'

  def new
    @user = User.new
  end

  def create
    user = User.new(new_user_params)
    confirmation_hash(user)
    if user.save
      flash[:notice] = "Success!"
      UserMailer.invite(user.id).deliver_now
    else
      flash[:notice] = "You must be missing something."
    end
    redirect_to new_user_path
  end

  def update_password
    @user = User.find params[:user_id]
    token = params[:token]
    if token != @user.confirmation_hash
      #TODO we should add error pages with explanations
      redirect_to root_path
    end
  end

  private

  def new_user_params
    params.require(:user).permit(:email,
                                 :role).merge(password: RandomHash.generate)
  end

  def user_params
    params.require(:user).permit(:email,
                                 :role,
                                 :password)
  end

  def confirmation_hash(user)
    user.confirmation_hash = RandomHash.generate
  end
end
