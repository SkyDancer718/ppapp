class ForvkController < ApplicationController


	def index
		fields = [:first_name, :last_name, :photo_max]
		staff = [29606292, 29606293, 29606294, 29606295, 29606296, 
					29606297, 29606298, 29606299, 29606210, 29606287, 
					29606288, 29606289, 29606270, 39606210, 31606210,
					29106288, 29106289, 29106270, 39106210, 31101210]

  		vk = VkontakteApi::Client.new

  		#staff = vk.friends.get_online(user_id: 72207065)
  		@users=	vk.users.get(user_ids: staff, fields: fields)

	end

end
