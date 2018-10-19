# == Schema Information
#
# Table name: forum_threads
#
#  id         :bigint(8)        not null, primary key
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class ForumThread < ApplicationRecord
	has_many :posts, dependent: :destroy
	belongs_to :user
	has_many :users, through: :posts

	accepts_nested_attributes_for :posts

	validates_presence_of :subject, presence: true
	validates_associated :posts
end
