class BlocksController < ApplicationController
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
      @block = Block.find(params[:id])
    end

    def edit
      @block = Block.find(params[:id])
    end

    def update
      @block = Block.find(params[:id])
      
      if @block.update(block_params)

        flash[:notice] = "Block has been updated."
        redirect_to @block

      else
        flash.now[:alert] = "Block has not been updated."
        render "edit"
      end
    end

    def destroy
      @block = Block.find(params[:id])
      @block.destroy

      flash[:notice] = "Block has been deleted."
      redirect_to blocks_path
    end

	private

	def block_params
		params.require(:block).permit(:day, :time)
	end
end
