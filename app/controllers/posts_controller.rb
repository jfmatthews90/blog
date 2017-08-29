class PostsController < ApplicationController
	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
	end

	def create # allows the cration of a new post with a set of params that can be saved
		@post = Post.new(post_params)
		@post.save

		redirect_to @post
	end

	def show # allows you to show a post based on its id, which is the /1, /2, etc... in a url
		@post = Post.find(params[:id]) #
	end

	private # this is for Rail's built in security measures
		def post_params
			params.require(:post).permit(:title, :body)
		end 
end
