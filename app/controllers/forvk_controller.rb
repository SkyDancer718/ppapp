class ForvkController < ApplicationController


	def index
		#fields = [:first_name, :last_name, :photo_50]
  		#vk = VkontakteApi::Client.new
  		#@users=	vk.users.get(uid: 155572362, fields: fields) 
	end

	def auth
	session[:state] = Digest::MD5.hexdigest(rand.to_s)
	redirect_to VkontakteApi.authorization_url(scope: 
							[:notify, :friends, :photos], state: session[:state])
	#@vk = VkontakteApi.authorize(code: params[:code])
	end

end
