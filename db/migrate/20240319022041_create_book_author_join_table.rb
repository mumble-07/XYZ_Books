class CreateBookAuthorJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :book_author, id: false do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :author, null: false, foreign_key: true
    end

    add_index :book_author, [:book_id, :author_id], unique: true
  end
end
