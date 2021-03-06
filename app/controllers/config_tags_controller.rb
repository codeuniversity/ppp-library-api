class ConfigTagsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_config_tag, only: [:show, :update, :destroy]

  # GET /config_tags
  def index
    @config_tags = ConfigTag.all

    render json: @config_tags
  end

  # GET /config_tags/1
  def show
    render json: @config_tag
  end

  # POST /config_tags
  def create
    @config_tag = ConfigTag.new(config_tag_params)

    return if unpermitted_create(@config_tag)

    if @config_tag.save
      render json: @config_tag, status: :created, location: @config_tag
    else
      render json: @config_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /config_tags/1
  def destroy
    return if unpermitted_delete(@config_tag)

    @config_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_tag
      @config_tag = ConfigTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def config_tag_params
      params.require(:config_tag).permit(:config_id, :category_id)
    end

    def create_allowed?
      @config_tag.config&.user == @current_user
    end
end
