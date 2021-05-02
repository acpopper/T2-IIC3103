class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :id_custom
      t.string :name
      t.integer :age
      t.text :albums
      t.text :tracks
      t.text :self

      t.timestamps
    end
  end
end
