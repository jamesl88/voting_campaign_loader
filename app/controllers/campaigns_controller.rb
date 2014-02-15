class CampaignsController < ApplicationController
  
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    candidates = @campaign.candidates

    names_array = candidates.each do |candidate|
      candidate.name
    end

    @duplicate_names = names_array.inject(Hash.new(0)) { |result, element| result[element] += 1 ; result }
    # h = Hash.new(0)
    # @count = candidates.each { |value| h.store(value, h[value] + 1)}

    # @hash = @candidates.group_by { |i| @candidate.name }
  end

end
