class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :id_custom
      t.references :album, null: false, foreign_key: true
      t.string :name
      t.float :duration
      t.integer :times_played
      t.text :artist
      t.text :album
      t.text :self

      t.timestamps
    end
  end
end
