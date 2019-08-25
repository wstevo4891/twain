class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :title
      t.string :plural
      t.string :category

      t.timestamps
    end
  end
end
