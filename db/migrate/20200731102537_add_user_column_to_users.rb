class AddUserColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    # add_column :users, :nickname, :string
    # add_column :users, :first_name, :string
    # add_column :users, :last_name, :string
    # add_column :users, :first_furigana, :string
    # add_column :users, :last_furigana, :string
    # add_column :users, :email, :string
    # add_column :users, :password, :string
    add_column :users, :birthday, :date
  end
end
