class ArticlesController < ApplicationController

include ArticlesHelper

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

    flash.notice = "article named '#{@article.title}' created"

    redirect_to article_path(@article)
end

def destroy
	@article = Article.find(params[:id])
	@article.destroy
	@articles = Article.all

	flash.notice = "article named '#{@article.title}' destroyed"

	redirect_to articles_path(@articles)

end

def edit
	
	@article = Article.find(params[:id])
	flash.notice = " edit the article '#{@article.title}'"

end

def update
	@article = Article.find(params[:id])
    @article.update(article_params)

  	flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
end

end