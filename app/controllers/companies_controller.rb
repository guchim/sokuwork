class CompaniesController < ApplicationController
    def home
    end
    
    def offer
        @categories = Category.all
    end
    
    def create
        @offer = Offer.create(category:params["offers"]["category_id"],title:params["offers"]["title"],date:params["offers"]["date"],start_time:params["offers"]["start_time"],end_time:params["offers"]["end_time"],contents:params["offers"]["contents"],caution:params["offers"]["caution"],images:params["offers"]["images"])
        @offer.company_id = current_company.id
        @offer.save
        redirect_to "/companies/show"
    end
    
    def show
        @company = current_company
        @offers = @company.offers
    end
    
    def detail
        offer = Offer.find(params["id"])
    end

    def destroy
        offer = Offer.find(params["id"])
        offer.destroy
        redirect_to "/companies/show"
    end
    
    def edit
        offer = Offer.find(params["id"])
    end
    
    def update
        offer = Offer.find(params["id"])
        offer.category = params["offers"]["category"]
        offer.title = params["offers"]["title"]
        offer.date = params["offers"]["date"]
        offer.start_time = params["offers"]["start_time"]
        offer.end_time = params["offers"]["end_time"]
        offer.contents = params["offers"]["contents"]
        offer.caution = params["offers"]["caution"]
        offer.images = params["offers"]["images"]
        offer.save
        redirect_to "/companies/show"
    end
    
    private
    def company_params
      params.require(:company).permit(:category,:title,:date,:start_time,:end_time,:contents,:caution,:company_id,:images)
    end
end
