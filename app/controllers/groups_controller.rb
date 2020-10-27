class GroupsController < ApplicationController

  before_action :restrict_access
  # before_action :authenticate_user_from_token!
  def index
    @groups = Group.all
    json_response(@groups)
  end

  def show
    @group = Group.find(params[:id])
    json_response(@group)
  end

  def create
    @group = Group.create!(group_params)
    json_response(@group, :created)
  end

  def update
    @group = Group.find(params[:id])
    if @group.update!(group_params)
      render status: 200, json: {
        group: "this group has been succesfully updated."
      }
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      render staus: 200, json: {
        group: "successfully deleted"
      }
    end
  end

  private
    # def json_response(object, status = :ok)
    #   render json: object, status: status
    # end


    def group_params
      params.permit(:name)
    end

    # def requires_login
    #   unless current_user
    #     render json: { errors: "This requires login" }
    #   end
    # end
end
