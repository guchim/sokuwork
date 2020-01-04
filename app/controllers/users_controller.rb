class UsersController < ApplicationController
    
    def search
        @offers = Offer.all
    end
    
    def show
    end
end
