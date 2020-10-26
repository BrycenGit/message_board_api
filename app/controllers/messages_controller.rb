class MessagesController < ApplicationController
  def index
    author = params[:author]

    @messages = Message.search(author)
    json_response(@messages)
  end

  def show
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
    @message = Message.create!(message_params)
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
    @message = Message.find(params[:id])
    if @message.destroy
      render staus: 200, json: {
        message: "successfully deleted"
      }
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
