class PagesController < ApplicationController
    def home
        @q = Offer.ransack(params[:q])
        @offers = @q.result(distinct: true)
        @categories = Category.all
        @walfares = Walfare.all
    end
end
