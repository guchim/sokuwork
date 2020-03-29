# frozen_string_literal: true

class CompaniesController < ApplicationController
  def show
    @company = current_company
    @offers = @company.offers.order(created_at: :desc)
  end

  def confirmation
    @applicants = Applicant.where(company_id: current_company.id).order(created_at: :desc)
    @date_format = '%Y%m%d'
  end

  def review; end

  def offer
    @categories = Category.all
    @offer = Offer.new
    @offer.offer_walfares.build
  end

  def create
    offer = Offer.create(offer_params)
    offer.company_id = current_company.id
    redirect_to '/companies/show', notice: '応募要項を作成しました' if offer.save
  end

  def destroy
    offer = Offer.find(params['id'])
    offer.destroy
    redirect_to '/companies/show'
  end

  def edit
    @offer = Offer.find(params['id'])
    @offer.images.cache! if @offer.images.blank?
    @categories = Category.all
  end

  def update
    offer = Offer.find(params['id'])
    offer.update(offer_params) if offer.company_id == current_company.id
    redirect_to '/companies/show'
  end

  private

  def offer_params
    params.require(:offers).permit(:images, :image_cache, :category_id,
                                   :title, :date, :start_time, :end_time,
                                   :contents, :cautions, :payment, :address,
                                   :access, :belongings, :conditions,
                                   { walfare_ids: [] })
  end
end
