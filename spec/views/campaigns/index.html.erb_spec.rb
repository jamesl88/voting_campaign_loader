require 'spec_helper'

describe "campaigns/index.html.erb" do
  before(:each) do

    # The vote connects the campaign and the candidate

    @vote1 = FactoryGirl.create(:vote, :campaign_id => '1')
    @vote2 = FactoryGirl.create(:vote, :campaign_id => '1')
    
    @vote3 = FactoryGirl.create(:vote, 
      :campaign_id => '1', 
      :validity => 'pre') 

    @candidate1 = FactoryGirl.create(:candidate)
    @candidate2 = FactoryGirl.create(:candidate)
    @candidate3 = FactoryGirl.create(:candidate)
    
    @campaign = FactoryGirl.create(:campaign)
  end

  it "displays the campaign names" do
    visit "/"
    expect(page).to have_text('All Campaigns')
    expect(page).to have_text('Campaign-example')

  end

end
