class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.text :title
      t.text :author
      t.references :user

      t.timestamps
    end
    add_index :books, [:user_id, :created_at]
  end
end
