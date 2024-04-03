class Api::ClientsController < ApplicationController
    # skip_before_action :verify_authenticity_token

    def index
        @clients = Client.all
        render json: @clients
    end

    def show 
        @clients = Client.find(params[:id])
        render json: @clients
    end

    def create
        @clients = Client.new(clients_params)
        if @clients.save
            render json: @clients, status: :created
        else
            render json: @clients.errors, status: :unprocessable_entity
        end
    end

    def update
        @clients = Client.find(params[:id])

        if @clients.update(clients_params)
            render json: @clients
        else
            render json: @clients.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @clients = Client.find(params[:id])
        @clients.destroy
        head :no_content
    end

    private
        def clients_params
            params.permit(:full_name, :phone, :email)
        end
    end
