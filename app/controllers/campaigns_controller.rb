class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])

    @invalid_votes = @campaign.votes.where.not(:validity => 'during').map { |vote| Candidate.find_by_id(vote.candidate_id) }

    @valid_votes = @campaign.votes.where(:validity => 'during').map { |vote| Candidate.find_by_id(vote.candidate_id) }
  end

  def duplicate_names(arr)
    @duplicate_names = arr.inject(Hash.new(0)) { |result, element| result[element] += 1 ; result }   
  end
end