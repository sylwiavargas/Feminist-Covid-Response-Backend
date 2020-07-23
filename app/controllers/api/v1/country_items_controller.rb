class Api::V1::CountryItemsController < ApplicationController
    before_action :find_country_item, only: [:show]

    def index
        begin
            @country_items = CountryItem.all.map{|c| {
                name: c.name
            }}
            render json: @country_items, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    def show
        begin
            render json: @country_item, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    private

    def country_item_params
        params.permit(:name)
    end

    def find_country_item
        @country_item = CountryItem.find_by(name: params[:name])
    end
end
