class ArticlesController < ApplicationController
	include ArticlesHelper

	before_filter :login_to_control, only: [:new, :create, :destroy, :edit]
	def login_to_control
		unless current_user
			redirect_to articles_path
			return false
		end
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create 
		@article = Article.new(article_params)
		@article.save
		flash.notice = "'#{@article.title}' was created."
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article with title '#{@article.title}' was deleted."
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		flash.notice = "Article '#{@article.title}' was updated."
		redirect_to article_path(@article)
	end

end
