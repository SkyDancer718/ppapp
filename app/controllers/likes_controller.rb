class LikesController < ApplicationController
  before_action :set_like, only: [:create]

  # GET /likes
  # GET /likes.json
  def index
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
  end

  # GET /likes/1/edit
  def edit
  end


  # POST /likes
  # POST /likes.json
  def create
    unless Like.where(hero_id: session[:id]).present?
      Like.new(hero_id: session[:id], victim_id: 555).save
    else
      @like.destroy
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params

    end
end
