class ForvkController < ApplicationController


	def index
		fields = [:first_name, :last_name, :photo_50]
  		vk = VkontakteApi::Client.new
  		@users=	vk.users.get(user_id: 155572362, fields: fields) 
	end

end
