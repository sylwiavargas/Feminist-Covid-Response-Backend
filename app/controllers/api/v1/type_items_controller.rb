class Api::V1::TypeItemsController < ApplicationController
    before_action :find_type_item, only: [:show]

    def index
        begin
            @type_items = TypeItem.all.map{|c| {
                name: c.name
            }}
            render json: @type_items, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    def show
        begin
            render json: @type_item, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    private

    def type_item_params
        params.permit(:name)
    end

    def find_type_item
        @type_item = TypeItem.find_by(name: params[:name])
    end
end
