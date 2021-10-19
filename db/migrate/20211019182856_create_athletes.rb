class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :nationality
      t.string :sport
      t.string :edition
      t.string :number_of_medals
      t.string :gold
      t.string :silver
      t.string :bronze
      t.string :number_of_paticipations
      t.string :first_participation
      t.string :year_of_birth

      t.timestamps
    end
  end
end
