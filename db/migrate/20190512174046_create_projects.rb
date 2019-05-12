class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string   :slug
      t.string   :meta_title
      t.string   :meta_description
      t.string   :title
      t.text     :summary
      t.string   :cover
      t.string   :site_link
      t.string   :repo_link
      t.string   :highlights, array: true, default: []
      t.string   :tech_stack, array: true, default: []

      t.timestamps
    end
  end
end
