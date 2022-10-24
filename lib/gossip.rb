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


end #class end
