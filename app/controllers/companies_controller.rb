class CompaniesController < ApplicationController
    def home
    end
    
    def offer
        @categories = Category.all
    end
    
    def create
        @offer = Offer.create(
            images:params["offers"]["images"],
            category_id:params["offers"]["category_id"],
            walfare_id:params["offers"]["walfare_id"],
            title:params["offers"]["title"],
            date:params["offers"]["date"],
            start_time:params["offers"]["start_time"],
            end_time:params["offers"]["end_time"],
            contents:params["offers"]["contents"],
            cautions:params["offers"]["cautions"],
            pay:params["offers"]["pay"])
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
        offer.cautions = params["offers"]["cautions"]
        offer.images = params["offers"]["images"]
        offer.save
        redirect_to "/companies/show"
    end
    
    private
    
    def company_params
      params.require(:company).permit(:category_id,:title,:date,:start_time,:end_time,:contents,:cautions,:company_id,:images,:pay,:walfare_id)
      params.require(:company).permit(:offers, walfare_id: [])
    end
    
    
end
