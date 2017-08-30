class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create # allows the cration of a new post with a set of params that can be saved
		@post = Post.new(post_params)

		if @post.save # allows you to be redirected to a validated post, otherwise it will render the new form
			redirect_to @post
		else
			render 'new'
		end
	end

	def show # allows you to show a post based on its id, which is the /1, /2, etc... in a url
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end


	private # this is for Rail's built in security measures
		def post_params
			params.require(:post).permit(:title, :body)
		end 
end
