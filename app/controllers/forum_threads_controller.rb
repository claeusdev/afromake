class ForumThreadsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_thread, except: [:index, :new, :create]

	def show
		@thread = ForumThread.find(params[:id])
		@posts = @thread.posts
	end

	def index
		@thread = ForumThread.all
	end

	def new
		@thread = ForumThread.new
		@thread.posts.new
	end

	def create
		@thread = current_user.forum_threads.create(thread_params)
		@thread.posts.first.user_id = current_user.id

		if @thread.save
			redirect_to @thread
		else
			render :new
		end
	end

	private
	def set_thread
		@model = ForumThread.find(params[:id]) if params[:id]
	end

	def thread_params
		params.require(:forum_thread).permit(:subject, posts_attributes: [:body])		
	end
end