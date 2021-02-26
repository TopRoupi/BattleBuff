class AddProfileurlAndNicknameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profile_url, :string
    add_column :users, :nickname, :string
  end
end
