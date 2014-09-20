class SessionController < ApplicationController
  def new
   # генерируем случайный state
    srand
    session[:state] ||= Digest::MD5.hexdigest(rand.to_s)
    # и URL страницы авторизации
    @vk_url = VkontakteApi.authorization_url(scope: [:friends, :groups, :offline, :notify], state: session[:state])
  end

  def create

    if session[:state].present? && session[:state] != params[:state]
      redirect_to root_url, alert: 'Ошибка авторизации, попробуйте войти еще раз.' and return
    end
    
    @vk = VkontakteApi.authorize(code: params[:code])

    session[:token] = @vk.token
    session[:vk_id] = @vk.user_id

    User.new(id_vk: @vk.user_id.to_s, token: @vk.token.to_s)

    redirect_to root_url
  end

  def destroy
    session[:token] = nil
    session[:vk_id] = nil
    
    redirect_to root_url
  end
end
