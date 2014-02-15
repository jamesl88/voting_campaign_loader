FactoryGirl.define do 
  factory :campaign do |campaign|
    name "Campaign-example"
    campaign.sequence(:candidate_id) { |id| id }
  end
end
