class SessionController < ApplicationController
  def new
   # генерируем случайный state
    srand
    session[:state] ||= Digest::MD5.hexdigest(rand.to_s)
    # и URL страницы авторизации
    @vk_url = VkontakteApi.authorization_url(scope: [:friends, :groups, :offline, :notify], state: session[:state])
  end

  def callback

    if session[:state].present? && session[:state] != params[:state]
      redirect_to root_url, alert: 'Ошибка авторизации, попробуйте войти еще раз.' and return
    end
    
    vk = VkontakteApi.authorize(code: params[:code])

    session[:token] = vk.token
    session[:vk_id] = vk.user_id

	User.new(vk_id: vk.user_id.to_s, token: vk.token.to_s)

	fields = [:first_name, :last_name, :photo_max]

	staff = vk.friends.get_online(user_id: 29606292)
  @users=	vk.users.get(user_ids: staff, fields: fields)

  fields = [:first_name, :last_name, :photo_50]
  @cur_user = vk.users.get(user_id: session[:vk_id], fields: fields).first
	#@users = vk.users.get(user_id: session[:vk_id], fields: fields).first 
    #redirect_to root_url
  end

  def destroy
    session[:token] = nil
    session[:vk_id] = nil
    
    redirect_to root_url
  end
end