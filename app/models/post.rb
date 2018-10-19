# == Schema Information
#
# Table name: posts
#
#  id              :bigint(8)        not null, primary key
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  forum_thread_id :bigint(8)
#  user_id         :bigint(8)
#
# Indexes
#
#  index_posts_on_forum_thread_id  (forum_thread_id)
#  index_posts_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (forum_thread_id => forum_threads.id)
#  fk_rails_...  (user_id => users.id)
#

class Post < ApplicationRecord
  belongs_to :forum_thread
  belongs_to :user

  validates :body, presence: true


  def send_notification
  	users = forum_thread.users.uniq - [user]

  	users.each do |user|
  		raise "its in here"
  		NotificationMailer.post_notification(user, self).deliver_later
  	end
  end
end
