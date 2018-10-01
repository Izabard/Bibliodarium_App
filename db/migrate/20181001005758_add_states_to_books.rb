class AddStatesToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :started_at, :datetime
    add_column :books, :finished_at, :datetime
    add_column :books, :cancelled_at, :datetime
  end
end 
