# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    if user_signed_in?
      @user_profile = UserProfile.find_by(user_id: current_user.id)
    end
  end

  def search
    if user_signed_in?
      @user_profile = UserProfile.find_by(user_id: current_user.id)
      @user = current_user
    end
    @q = Offer.ransack(params[:q])
    @offer = @q.result(distinct: true)
    @offers = @offer.page(params[:page]).per(12)
    @categories = Category.all
    @walfares = Walfare.all
  end

  def detail
    @offer = Offer.find(params['id'])
    if user_signed_in?
      @user_profile = UserProfile.find_by(user_id: current_user.id)
      @user = current_user
    end
  end

  def create
    @offer = Offer.find(params['id'])
    applicant = Applicant.create(applicant_params)
    applicant.company_id = @offer.company_id
    applicant.user_id = current_user.id
    applicant.offer_id = @offer.id
    applicant.save
    redirect_to '/search', notice: '応募が完了しました'
  end

  private

  def applicant_params
    params.require(:applicants).permit(:name, :photo, :introduction, :user_id, :company_id, :offer_id, :phone_number, :gender, :birthday)
  end
end
