module Configs
  class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def destroy
      @config_tag = ConfigTag.where(config_id: params[:config_id], category_id: params[:id]).first
      render json: { error: 'no config tag found' }, status: :not_found and return if @config_tag.nil?

      @config_tag.destroy
    end
  end
end
