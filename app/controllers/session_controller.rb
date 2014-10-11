class SessionController < ApplicationController

  def new
    srand
    session[:state] ||= Digest::MD5.hexdigest(rand.to_s)
    VkontakteApi.authorization_url(scope: 
              [:friends, :groups, :offline, :notify], state: session[:state])
  end

  def callback_new
    if session[:state].present? && session[:state] != params[:state]
     redirect_to root_url, alert: 'Ошибка авторизации, попробуйте войти еще раз.' and return
    end
  
    @vk = VkontakteApi.authorize(code: params[:code])
    session[:token] = vk.token
    session[:vk_id] = vk.user_id

	  @user = User.new(vk_id: vk.user_id.to_s, token: vk.token.to_s)
    session[:id] = usr.id 
    user.save
    
	  fields = [:first_name, :last_name, :photo_max]
    staff = vk.friends.get_online(user_id: session[:vk_id])
    users =	vk.users.get(user_ids: staff, fields: fields)
    
    fields = [:first_name, :last_name, :photo_50]
    @cur_user = vk.users.get(user_id: session[:vk_id], fields: fields).first
  end

  def destroy
    session[:token] = nil
    session[:vk_id] = nil
    session[:id] = nil
    session[:state] = nil
  end
end