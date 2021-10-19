json.extract! athlete, :id, :name, :nationality, :sport, :edition, :number_of_medals, :gold, :silver, :bronze, :number_of_paticipations, :first_participation, :year_of_birth, :created_at, :updated_at
json.url athlete_url(athlete, format: :json)
