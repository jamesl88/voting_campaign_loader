#encoding: UTF-8

desc "Import votes"
task :import_votes => :environment do
  File.open(File.join(Rails.root, "lib", "tasks", 'votes.txt')).each do |line|

    #Error : 'invalid byte sequence in UTF-8’
    begin
      fields = line.encode('UTF-8', invalid: :replace).split(' ')
    rescue Exception => e
      puts "Could not parse line, error: " + e.inspect
      puts line.inspect
      next
    end

    campaign_name = fields[2].gsub(/Campaign:/, '')
    validity = fields[3].gsub(/Validity:/, '')
    choice = fields[4].gsub(/Choice:/, '')

    campaign_id = Campaign.find_or_create_by!(name: campaign_name).id

    match = line.match(/^VOTE\s\d+\sCampaign:([^ ]+)\sValidity:([^ ]+)\sChoice:([^ ]+)/)


    if match.nil?
      
    else
      v = Vote.new(:time => fields[1], :campaign_id => campaign_id, :validity => validity, :choice => choice)
      # puts v.inspect
      v.save!
    end
    
  end
end