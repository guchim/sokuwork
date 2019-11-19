class CompaniesController < ApplicationController
    def home
    end
    
    def offer
    end
    
    def create
        Offer.create(category:params["offers"]["category"],title:params["offers"]["title"],date:params["offers"]["date"],start_time:params["offers"]["start_time"],end_time:params["offers"]["end_time"],contents:params["offers"]["contents"],caution:params["offers"]["caution"])
        redirect_to "/companies/show"
    end
    
    def show
        @offers = Offer.all
    end

    def destroy
        offer = Offer.find(params["id"])
        offer.destroy
        redirect_to "/companies/show"
    end
    
    def edit
        @offer = Offer.find(params["id"])
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
        offer.save
        redirect_to "/companies/show"
    end
    
end
