class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])

    @invalid_votes = @campaign.votes.where.not(validity: 'during').order('candidate_id DESC').map { |vote| Candidate.find_by_id(vote.candidate_id) }
    @valid_votes = @campaign.votes.where(validity: 'during').order('candidate_id DESC').map { |vote| Candidate.find_by_id(vote.candidate_id) }  
  end
end