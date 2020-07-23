class Api::V1::ItemsController < ApplicationController
    before_action :find_item, only: [:show]

    def index
        begin
            @items = Item.all.map{|i| ItemSerializer.new(i).as_json}
            render json: @items, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    def show
        begin
            # byebug
            render json: @item, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    private

    def item_params
        params.permit(:name)
    end

    def find_item
        # @item = Item.find_by(name: params[:name])
        @item = Item.find_by(id: params[:id])
    end
end
