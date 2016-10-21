class UsersController < ApplicationController
  def edit
    @user = current_user
    @preference_collection = User::PREFERENCE
    @gender_collection = User::GENDER
    @favorite = @user.favorite

  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    if @user.save
      flash[:notice] = 'Profile updated successfully.'
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages.join(', ')
      render 'locations/users/' + user.id + 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:favorite, :preference, :gender)
  end



end
