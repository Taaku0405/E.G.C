class Admin::SearchesController < ApplicationController

 	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == "user"
			@records = User.search_for(@content, @method)
		elsif @model == "Post"
			@records = Post.search_for(@content, @method)
		elsif @model == "Genre"
		  @records = Genre.search_for(@content, @method)
		end
	end

end