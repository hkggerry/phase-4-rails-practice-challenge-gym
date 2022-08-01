class MembershipsController < ApplicationController
    wrap_parameters format: []

    def index
        memberships = Membership.all
        render json: memberships
    end 
    
    def show
        membership = Membership.find_by(id: params[:id])
        if membership
            render json: membership
        else 
          render json: { error: "Membership not found" }, status: :not_found
        end
      end

    def create
        membership = Membership.create(membership_params)
        render json: membership, status: :created
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end
end
