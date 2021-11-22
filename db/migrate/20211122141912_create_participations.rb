class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.references :edition, foreign_key: true
      t.references :athlete, foreign_key: true
      t.string :sport
      t.integer :number_of_medals
      t.integer :gold
      t.integer :silver
      t.integer :bronze


      t.timestamps
    end
  end
end
