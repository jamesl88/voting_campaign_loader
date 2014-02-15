require 'spec_helper'

describe "campaigns/index.html.erb" do
  before(:each) do
    
    # The vote connects the campaign and the candidate
    vote = FactoryGirl.create(:vote) 

    campaign = FactoryGirl.create(:campaign)
    candidate = FactoryGirl.create(:candidate)
  end

  it "displays the campaign names" do
    visit "/"
    expect(page).to have_text('All Campaigns')
    expect(page).to have_text('Campaign-example')

    click_link "Campaign-example"
    expect(page).to have_text('Campaign: Campaign-example')
  end

  it "displays the candidate for the campaign" do
    visit "/"
    click_link "Campaign-example"

    expect(page).to have_text "John"
  end

#   pending "add some examples to (or delete) #{__FILE__}"
end
