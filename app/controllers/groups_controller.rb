class GroupsController < ApplicationController
  def index
    if params[:name]
      @groups = Group.search(params[:name])
    else
      @groups = Group.all
    end
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
end
