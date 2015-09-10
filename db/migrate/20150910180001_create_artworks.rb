class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|

      t.string :name
      t.string :artist
      t.string :location
      t.integer :likes
      t.text :description

      t.timestamps null: false
    end
  end
end
