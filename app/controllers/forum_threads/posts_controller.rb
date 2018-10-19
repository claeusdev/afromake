class ForumThreads::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_thread

  def create
    @post = @thread.posts.new post_params
    @post.user = current_user

    if @post.save
      @post.send_notification
      redirect_to forum_thread_path(@thread, anchor: "post_#{@post.id}"), notice: "Successfully posted!"
    else
      redirect_to @thread, alert: "Unable to save your post"
    end
  end

  private

    def set_thread
      @thread = ForumThread.find(params[:forum_thread_id])
    end

    def post_params
      params.require(:post).permit(:body)
    end
end