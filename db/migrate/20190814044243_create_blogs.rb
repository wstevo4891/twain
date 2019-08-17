class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string  :title
      t.string  :slug
      t.string  :cover
      t.string  :description

      t.timestamps
    end
  end
end
