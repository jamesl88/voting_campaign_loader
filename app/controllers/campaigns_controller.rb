class CampaignsController < ApplicationController

  helper CampaignsHelper
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @candidates = @campaign.candidates

    # Find all the candidates with valid votes ('during')
    @valid = @candidates.each do |candidate|
      candidate.votes.where(:validity => 'pre').name
    end

    # Finds all the duplicates of the names and puts it into a hash
    @duplicate_names = @valid.inject(Hash.new(0)) { |result, element| result[element] += 1 ; result }
  end
end