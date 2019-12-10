class UsersController < ApplicationController
    def home
        @offers = Offer.all
    end
    
    def search
        @offers = Offer.all
    end
    
    def show
    end
end
