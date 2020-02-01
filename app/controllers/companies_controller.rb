class CompaniesController < ApplicationController
    def show
        @company = current_company
        @offers = @company.offers
    end
    
    def confirmation
        @applicant = Applicant.all.order(created_at: :desc)
        @date_format = "%Y%m%d"
    end
    
    def review
    end
    
    def offer
        @categories = Category.all
        @offer = Offer.new
        @offer.offer_walfares.build
    end
    
    def create
        offer = Offer.create(offer_params)
        offer.company_id = current_company.id
        if offer.save
            redirect_to "/companies/show", notice: "応募要項を作成しました"
        end
    end

    def destroy
        offer = Offer.find(params["id"])
        offer.destroy
        redirect_to "/companies/show"
    end
    
    def edit
        @offer = Offer.find(params["id"])
        @offer.images.cache! unless @offer.images.blank?
        @categories = Category.all
    end
    
    def update
        offer = Offer.find(params["id"])
        if offer.company_id == current_company.id
          offer.update(offer_params)
        end
        redirect_to "/companies/show"
    end
    
    private
    
    def offer_params
        params.require(:offers).permit(:images, :image_cache, :category_id, :title, :date, :start_time, :end_time, :contents, :cautions, :payment, :address, :access, :belongings, :conditions, { :walfare_ids=> [] })
    end
    
end
