class ForvkController < ApplicationController


	def index
		fields = [:first_name, :last_name, :photo_max]
		staff = [29606292, 29606293, 29606294, 29606295, 29606296, 
					29606297, 29606298, 29606299, 29606210, 29606287, 
					29606288, 29606289, 29606270, 39606210, 31606210,
					29106288, 29106289, 29106270, 39106210, 31101210,
		9106288, 291062, 2910627, 39106452, 31102120,
		9106288, 291062, 2910627, 39106361, 31106320,
		9106288, 291062, 2910627, 39106373, 31105420,
		9106288, 291062, 2910627, 39106184, 31106520]

  		vk = VkontakteApi::Client.new

  		#staff = vk.friends.get_online(user_id: 72207065)
  		@users=	vk.users.get(user_ids: staff, fields: fields)

  		fields = [:first_name, :last_name, :photo_50]
  		@cur_user = vk.users.get(user_id: 72207065, fields: fields).first
	end

end
