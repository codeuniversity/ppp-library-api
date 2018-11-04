module Configs
  class VotesController < ApplicationController
    before_action :authenticate_user!

    def destroy
      @vote = @current_user.votes.where(config_id: params[:config_id]).first
      render json: { error: 'you have not voted for this config'}, status: :not_found and return if @vote.nil?
      @vote.destroy
    end
  end
end
