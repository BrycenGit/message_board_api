class MessagesController < ApplicationController
  def index
    if params[:date1] && params[:date2]
      @messages = Message.date_search(params[:date1], params[:date2])
    elsif params[:group_id]
    # author = params[:author]
    # @messages = Message.search(author)
      @group = Group.find(params[:group_id])
      @messages = @group.messages
    else
      @messages = Message.all
    end
    json_response(@messages)
  end

  def show
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.create!(message_params)
    json_response(@message, :created)
  end

  def update
    @message = Message.find(params[:id])
    if @message.update!(message_params)
      render status: 200, json: {
        message: "this message has been succesfully updated."
      }
    end
  end

  def destroy
    if params[:user]
      @message = Message.find(params[:id])
      if params[:user] == @message.author
        if @message.destroy
          render status: 200, json: {
            message: "successfully deleted"
          }
        end
      else
        render status: 200, json: {
          message: "you can only delete your messages"
        }
      end
    else
      # @message = Message.find(params[:id])
      # if @message.destroy
        render staus: 200, json: {
          message: "sign in as user"
        }
      # end
    end
  end

  private
    # def json_response(object, status = :ok)
    #   render json: object, status: status
    # end

    def message_params
      params.permit(:author, :content)
    end
end
