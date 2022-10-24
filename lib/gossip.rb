class Gossip
  attr_accessor :author, :content

def initialize(author, content)
  @author = author
  @content = content
end

def save
  CSV.open('/home/jbe29/dossierlinux/20221024ruby_sinatra/db/gossip.csv','ab') do |csv|
    csv << [@author,@content]
  end
end

def self.all
  @@all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    @@all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return @@all_gossips
end

def self.find(id)
  return Gossip.all[id.to_i - 1]
end

def self.update(id, updated_author, updated_content)
  gossip_updated = CSV.read("../the_gossip_project_sinatra/db/gossip.csv")
  gossip_updated[id.to_i][0] = updated_author
  gossip_updated[id.to_i][1] = updated_content
  CSV.open("../the_gossip_project_sinatra/db/gossip.csv", "w+") do |csv|
    gossip_updated.each do |row_updated|
      csv << row_updated
    end
  end
end

end #class end
