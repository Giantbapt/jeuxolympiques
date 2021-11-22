class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :nationality
      t.string :sports, array: true
      t.integer :number_of_medals
      t.integer :gold
      t.integer :silver
      t.integer :bronze


      t.timestamps
    end
  end
end
