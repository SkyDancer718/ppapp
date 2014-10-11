class SessionController < ApplicationController

  def vk_authorization
    session[:state] = Digest::MD5.hexdigest(rand.to_s)
    @vk_authorization_url=VkontakteApi.authorization_url(scope: 
              [:friends, :groups, :offline, :notify], state: session[:state])
  end

  def callback_vk_auth
    if session[:state].present? && session[:state] != params[:state]
     redirect_to root_url, alert: 'Ошибка авторизации, попробуйте войти еще раз.' and return
    end

    session[:state] = nil
    
    vk = VkontakteApi.authorize(code: params[:code])
    session[:token] = vk.token
    session[:vk_id] = vk.user_id

    redirect_to user_index_path
  end

  def destroy
    session[:token] = nil
    session[:vk_id] = nil
  end
end