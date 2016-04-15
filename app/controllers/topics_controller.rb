class TopicsController < ApplicationController
  before_action :set_block
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def new
    @topic = @block.topics.build
  end

  def create
    @topic = @block.topics.build(topic_params)

    if @topic.save
      flash[:notice] = "Topic has been created."
      redirect_to [@block, @topic]
    else
      flash.now[:alert] = "Topic has not been created."
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = "Topic has been updated."
      redirect_to [@block, @topic]
    else
      flash.now[:alert] = "Topic has not been updated."
      render "edit"
    end
  end

  def destroy
    @topic.destroy
    flash[:notice] = "Topic has been deleted."

    redirect_to @block
  end





  private

  def set_block
    @block = Block.find(params[:block_id])
  end

  def topic_params
    params.require(:topic).permit(:name, :description)
  end

  def set_topic
    @topic = @block.topics.find(params[:id])
  end

end
