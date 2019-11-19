class UsersController < ApplicationController
    def home
        @offers=Offer.all
    end
    
    def search
    end
    
    def show
    end
end
