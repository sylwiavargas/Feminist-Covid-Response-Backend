class Api::V1::ProgressivesController < ApplicationController
    before_action :find_progressive, only: [:show]

    def index
        begin
            @progressives = Progressive.all.map{|c| {
                name: c.name
            }}
            render json: @progressives, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    def show
        begin
            render json: @progressive, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    private

    def progressive_params
        params.permit(:name)
    end

    def find_progressive
        @progressive = Progressive.find_by(name: params[:name])
    end
end
