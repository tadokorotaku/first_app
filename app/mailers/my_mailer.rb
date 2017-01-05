class MyMailer < ActionMailer::Base

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new 'a3ggKDgPBGO6cnmlDz3Z4w'
	end

	def new_user(user)
		template_name = "new-user"
		template_content = []
		message = {
			to: [{email: "#{user.email}"}],
			subject: "Welcome to Code4Pro",
			merge_vars: [
				{
					rcpt: user.email,
					vars: [{name: "USER_NAME", content: user.name}]
				}
			]
		}

	end

end
