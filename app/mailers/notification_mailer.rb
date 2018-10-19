class NotificationMailer < ApplicationMailer
	default from: 'notifications@afromakers.club'


	def post_notification(user, post)
		@post = post
		@user = user

		mail(
			to: user.email,
			subject: "[Afromakers] A new post has been added to #{post.forum_thread.subject}")
	end
end
