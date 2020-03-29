# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    return unless user_signed_in?

    @user_profile = UserProfile.find_by(user_id: current_user.id)
  end

  def search
    if user_signed_in?
      @user_profile = UserProfile.find_by(user_id: current_user.id)
      @user = current_user
    end
    @q = Offer.ransack(params[:q])
    @offer = @q.result(distinct: true)
    @offers = @offer.page(params[:page]).per(9).order(created_at: :desc)
    @categories = Category.all
    @walfares = Walfare.all
  end

  def detail
    @offer = Offer.find(params['id'])
    return unless user_signed_in?

    @user_profile = UserProfile.find_by(user_id: current_user.id)
    @user = current_user
  end

  def create
    @offer = Offer.find(params['id'])
    applicant = Applicant.create(applicant_params)
    applicant.user_id = current_user.id
    applicant.company_id = @offer.company_id
    applicant.offer_id = @offer.id
    applicant.save
    redirect_to '/search', notice: '応募が完了しました'
  end

  private

  def applicant_params
    params.permit(:user_id, :offer_id, :company_id)
  end
end
