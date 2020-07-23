class Api::V1::CategoriesController < ApplicationController
    before_action :find_category, only: [:show]

    def index
        begin
            @category = Category.all.map{|c| {
                name: c.name
            }}
            render json: @category, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    def show
        begin
            render json: @category, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    private

    def category_params
        params.permit(:name)
    end

    def find_category
        @category = Category.find_by(name: params[:name])
    end
end
