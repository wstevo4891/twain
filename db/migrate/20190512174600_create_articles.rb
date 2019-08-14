class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string   :blog
      t.string   :slug
      t.string   :meta_title
      t.string   :meta_description
      t.string   :title
      t.text     :summary
      t.date     :date
      t.string   :cover

      t.timestamps
    end
  end
end
