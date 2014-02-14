#encoding: UTF-8

desc "Import votes"
task :import_votes => :environment do
  File.open(File.join(Rails.root, "lib", "tasks", 'votes.txt')).each do |line|

    #Error : 'invalid byte sequence in UTF-8’
    # begin
    #   fields = line.encode('UTF-8', invalid: :replace).split(' ')
    # rescue Exception => e
    #   puts "Could not parse line, error: " + e.inspect
    #   puts line.inspect
    #   next
    # end

    # campaign_name = fields[2].gsub(/Campaign:/, '')
    # validity = fields[3].gsub(/Validity:/, '')
    # candidate_name = fields[4].gsub(/Choice:/, '')


    begin
      match = line.match(/^VOTE\s(\d+)\sCampaign:([^ ]+)\sValidity:([^ ]+)\sChoice:([^ ]+)/)
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
      # puts v.inspect
      v.save!
    end    
  end
end