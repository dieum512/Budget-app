class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    return unless current_user

    @user = current_user
    @groups = @user.groups.includes(:entities)
  end

  def show
    @group = Group.find(params[:id])
    @entities = @group.entities.order('created_at DESC')
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.author_id = current_user.id

    if @group.save
      redirect_to groups_path
    else
      flash[:alert] = 'Group was not created. Please check the form and try again.'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
