class AddDetailsToProfile < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :integer
    add_column :users, :description, :string
    
  end
end
