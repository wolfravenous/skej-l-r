class BlocksController < ApplicationController
	def index
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
      @block = Block.find(params[:id])
    end

	private

	def block_params
		params.require(:block).permit(:day, :time)
	end
end
