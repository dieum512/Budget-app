class EntitiesController < ApplicationController
    def new
        @entity = Entity.new
    end
    
    def create
        @groups = params[:entity][:entity_id].drop(1)
        @groups.each do |category|
          @entity = Entity.new(name: params[:entity][:name], amount: params[:entity][:amount],
                                 entity_id: category.to_i, user_id: current_user.id)
          @entity.save
        end
        redirect_to groups_path
    end
    
    private
    
    def entity_params
        params.require(:entity).permit(:entity_id, :amount, :name)
    end
end
