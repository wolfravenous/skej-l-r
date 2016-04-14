class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy]

	def index
		@blocks = Block.all
	end

	def new
		@block = Block.new
	end

	def create
  	  @block = Block.new(block_params)

   	  if @block.save
     	  flash[:notice] = "Block has been created."
        redirect_to @block
  	  else
     	  flash.now[:alert] = "Block has not been created."
     	  render "new"
  	  end
	end

    def show
      
    end

    def edit
      
    end

    def update
      
      
      if @block.update(block_params)

        flash[:notice] = "Block has been updated."
        redirect_to @block

      else
        flash.now[:alert] = "Block has not been updated."
        render "edit"
      end
    end

    def destroy
      
      @block.destroy

      flash[:notice] = "Block has been deleted."
      redirect_to blocks_path
    end

	private

	def block_params
		params.require(:block).permit(:day, :time)
	end

  def set_block
    @block = Block.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The block you were looking for could not be found."
    redirect_to blocks_path
  end

end
