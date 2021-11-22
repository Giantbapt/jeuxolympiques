  task scrape: :environment do

    jo = Athlete.new(name: "jo")
    jo.save
  end

