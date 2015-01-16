#encoding: UTF-8

desc "Import votes"
task :import_votes => :environment do
  File.open(File.join(Rails.root, "lib", "tasks", 'votes.txt')).each do |line|

    begin
      match = line.match(/^VOTE\s(\d+)\sCampaign:([^ ]+)\sValidity:([^ ]+)\sChoice:([^ ]+)/)
      puts line
    rescue Exception => e
      puts "Could not parse line, error: " + e.inspect
      puts line.inspect
      next
    end

    unless match.nil?
      campaign_name = match[2]
      validity = match[3]
      candidate_name = match[4]

      campaign_id = Campaign.find_or_create_by!(name: campaign_name).id
      candidate_id = Candidate.find_or_create_by!(name: candidate_name).id

      v = Vote.new(:time => match[1], :campaign_id => campaign_id, :validity => validity, :candidate_id => candidate_id)
      v.save!
    end    
  end
end