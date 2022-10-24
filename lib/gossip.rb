class Gossip
    def save
        CSV.open("./db/gossip.csv", "ab") do |csv| #ab = mode écriture
            csv << ["Mon super auteur", "Ma super description"] #insertion d'une ligne avec 2 colonnes
        end
    end #end of save
end # end of class
