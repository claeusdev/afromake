class PagesController < ApplicationController
  def index
    @threads = ForumThread.all.order(created_at: :desc)
  end
end
