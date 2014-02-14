class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @candidates = @campaign.candidates
  end

  def candidates
    @campaign = Campaign.find(params[:id])
    @candidates = @campaign.candidates
    
  end

end
