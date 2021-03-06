# frozen_string_literal: true

class UsersController < ApplicationController
  def profile
    @user_profile = UserProfile.find_or_initialize_by(user_id: current_user.id)
  end

  def update
    @user_profile = UserProfile.find_or_initialize_by(user_id: current_user.id)
    if @user_profile.update(profile_params)
      redirect_to '/users/profile'
    else
      render :edit
    end
  end

  def confirmation
    @user_profile = UserProfile.find_by(user_id: current_user.id)
    @applicants = Applicant.where(user_id: current_user.id)
    @offer_id = @applicants.pluck(:offer_id)
    @offers = Offer.where(id: @offer_id).page(params[:page]).per(5).order(created_at: :desc)
  end

  private

  def profile_params
    params.require(:user_profiles).permit(:profile_photo, :introduction, :image_cache)
  end
end
