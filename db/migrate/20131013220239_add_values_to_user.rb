class AddValuesToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :surname, :string
    add_column :users, :phone, :string
    add_column :users, :aimsno, :integer
  end
end
