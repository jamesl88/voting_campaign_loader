require 'spec_helper'

describe "campaigns/show.html.erb" do
  
  before(:each) do

    # The vote connects the campaign and the candidate

    @vote1 = FactoryGirl.create(:vote, :campaign_id => '1')
    @vote2 = FactoryGirl.create(:vote, :campaign_id => '1')
    
    @vote3 = FactoryGirl.create(:vote, 
      :campaign_id => '1', 
      :validity => 'pre') 

    @candidate = FactoryGirl.create(:candidate,:name => 'Jenny')
    @candidate = FactoryGirl.create(:candidate,:name => 'James')
    @candidate = FactoryGirl.create(:candidate,:name => 'Kelvin')
    @campaign = FactoryGirl.create(:campaign)

  end

  it "displays the campaign names" do

    visit campaign_path(@campaign)
    expect(page).to have_text('Campaign: Campaign-example')

  end

  it "displays the candidate names" do

    visit campaign_path(@campaign)
    expect(page).to have_text('Jenny')
  end
end
