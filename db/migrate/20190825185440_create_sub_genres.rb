class CreateSubGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_genres do |t|
      t.string :title
      t.belongs_to :genre, index: true

      t.timestamps
    end
  end
end
