class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]

  # GET /users
  # GET /users.json
  def index
    fields = [:first_name, :last_name, :photo_max]
    staff = User[:vk_id].first(50)
    @users = vk.users.get(user_ids: staff, fields: fields)

    fields = [:first_name, :last_name, :photo_50]
    @cur_user = vk.users.get(user_id: session[:vk_id], fields: fields).first
  end

  # POST /users
  # POST /users.json
  def create
    user=User.new(vk_id: session[:vk_id].to_s, token: session[:token].to_s)
    user.save
      if user.save
         redirect_to root_url, notice: 'User was successfully created.' 
      else
         redirect_to '/authorization', notice: 'PROBLEMS'
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
