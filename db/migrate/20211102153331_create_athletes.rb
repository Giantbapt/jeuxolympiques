class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :nationality
      t.string :sport
      t.string :editions
      t.integer :number_of_medals
      t.integer :gold
      t.integer :silver
      t.integer :bronze
      t.integer :number
      t.string :number_of_participations
      t.date :date_of_birth
      t.string :first_participation

      t.timestamps
    end
  end
end
