class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :article
      t.string :author
      t.string :body
      t.integer :upvotes
      t.integer :downvotes
    end
  end
end
