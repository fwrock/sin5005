class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Mensagem enviada com sucesso!"
      redirect_to @message
    else
      render 'new'
    end
  end

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end

  def show
    @message = Message.new
    render 'new'
  end
end
