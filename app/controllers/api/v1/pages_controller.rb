class Api::V1::PagesController < ApplicationController
    before_action :find_page, only: [:show]

    def index
        begin
            @pages = Page.all.map{|p| {
                name: p.name,
                items: p.items.map{|i| ItemSerializer.new(i).as_json}
            }}
            render json: @pages, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    def show
        begin
            render json: @page, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    private

    def page_params
        params.permit(:name)
    end

    def find_page
        @page = Page.find_by(name: params[:name])
        # @page = Page.find_by(id: params[:id])
    end
end
