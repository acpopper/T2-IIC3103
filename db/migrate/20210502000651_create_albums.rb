class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :id_custom
      t.references :artist, null: false, foreign_key: true
      t.string :name
      t.string :genre
      t.text :artist
      t.text :tracks
      t.text :self

      t.timestamps
    end
  end
end
