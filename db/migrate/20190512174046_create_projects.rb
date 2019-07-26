class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string   :title
      t.string   :slug
      t.string   :cover
      t.string   :images, array: true, default: []
      t.string   :desktop
      t.string   :mobile, array: true, default: []
      t.string   :meta_title
      t.string   :meta_description
      t.text     :summary
      t.string   :site_link
      t.string   :repo_link
      t.text     :description, array: true, default: []
      t.string   :features, array: true, default: []
      t.string   :apis, array: true, default: []
      t.string   :tech_stack, array: true, default: []

      t.timestamps
    end
  end
end
