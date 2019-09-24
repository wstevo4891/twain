class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string      :name
      t.decimal     :salary
      t.belongs_to  :location
      t.belongs_to  :role
      t.references  :manager, null: true
      t.timestamps
    end
  end
end
