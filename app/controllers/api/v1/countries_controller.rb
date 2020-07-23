class Api::V1::CountriesController < ApplicationController
    before_action :find_country, only: [:show]

    def index
        begin
            @countries = Country.all.map{|c| {
                name: c.name
            }}
            render json: @countries, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    def show
        begin
            render json: @country, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    private

    def country_params
        params.permit(:name)
    end

    def find_country
        @country = Country.find_by(name: params[:name])
    end
end
