class Api::V1::PingController < ApplicationController
    def index
        if status == 200
            render json: {"success": true}, status: status
        else 
            render json: {"success": false}, status: status
        end
    end
end
