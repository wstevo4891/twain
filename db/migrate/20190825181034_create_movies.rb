class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string   :title
      t.string   :slug
      t.integer  :year
      t.string   :rated
      t.string   :release_date
      t.string   :run_time
      t.string   :directors, array: true, default: []
      t.string   :writers, array: true, default: []
      t.string   :actors, array: true, default: []
      t.string   :plot
      t.string   :photo
      t.string   :logo
      t.string   :poster
      t.json     :ratings

      t.timestamps
    end
  end
end
