class Api::V1::TypesController < ApplicationController
    before_action :find_type, only: [:show]

    def index
        begin
            @types = Type.all.map{|c| {
                name: c.name
            }}
            render json: @types, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    def show
        begin
            render json: @type, status: 200
        rescue StandardError => e
            render json: {"error": ("#{e.message}") }, status: 400
        end
    end

    private

    def type_params
        params.permit(:name)
    end

    def find_type
        @type = Type.find_by(name: params[:name])
    end
end
