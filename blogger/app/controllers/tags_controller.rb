class TagsController < ApplicationController
	
	before_filter :login_to_destroy, only: [:destroy]
	def login_to_destroy
		unless current_user
			redirect_to articles_path
			return false
		end
	end
	

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		flash.notice = "Tag named #{@tag.name} was deleted."
		redirect_to tags_path
	end
end
