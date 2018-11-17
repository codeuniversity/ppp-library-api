class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vote, only: :destroy

  # POST /votes
  def create
    @vote = Vote.new(vote_params)
    @vote.user = @current_user
    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  def destroy
    return if unpermitted_delete(@vote)

    @vote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.require(:vote).permit(:config_id)
    end
end
