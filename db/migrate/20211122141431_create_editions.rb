class CreateEditions < ActiveRecord::Migration[6.0]
  def change
    create_table :editions do |t|
      t.string :name
      t.string :year
      t.string :place
      t.string :slug
      t.string :logo
      t.string :season
      t.integer :number_of_medals
      t.integer :number_of_athletes

      t.timestamps
    end
  end
end
