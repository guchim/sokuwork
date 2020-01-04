class CompaniesController < ApplicationController
    def home
    end
    
    def offer
        @categories = Category.all
        @offer = Offer.new
        @offer.offer_walfares.build
    end
    
    def create
        offer = Offer.create(offer_params)
        offer.company_id = current_company.id
        offer.save
        redirect_to "/companies/show"
    end
    
    def show
        @company = current_company
        @offers = @company.offers
    end
    
    def detail
        @offer = Offer.find(params["id"])
    end

    def destroy
        offer = Offer.find(params["id"])
        offer.destroy
        redirect_to "/companies/show"
    end
    
    def edit
        @offer = Offer.find(params["id"])
        @categories = Category.all
        offer = Offer.new
        offer.offer_walfares.build
    end
    
    def update
        offer = Offer.find(params["id"])
        offer.update(offer_params)
        redirect_to "/companies/show"
    end
    
    def offer_params
        params.require(:offers).permit(:images, :category_id, :title, :date, :start_time, :end_time, :contents, :cautions, :payment, :address, :access, :belongings, :conditions, { :walfare_ids=> [] })
    end
    
end
