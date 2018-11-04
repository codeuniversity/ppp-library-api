class ConfigsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :update, :destroy]
  before_action :set_config, only: [:show, :update, :destroy]

  # GET /configs
  def index
    @configs = Config
      .left_joins(:votes)
      .group(:id)
      .select('configs.*, count(*) as vote_count')
      .order('vote_count desc')

      render json: @configs
  end

  # GET /configs/1
  def show
    render json: @config
  end

  # POST /configs
  def create
    @config = Config.new(config_params)
    @config.user = @current_user

    if @config.save
      render json: @config, status: :created, location: @config
    else
      render json: @config.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /configs/1
  def update
    return if unpermitted_update(@config)

    if @config.update(config_params)
      render json: @config
    else
      render json: @config.errors, status: :unprocessable_entity
    end
  end

  # DELETE /configs/1
  def destroy
    return if unpermitted_delete(@config)

    @config.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @config = Config.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def config_params
      params.require(:config).permit(:title, :description, :script, :user_id)
    end
end
