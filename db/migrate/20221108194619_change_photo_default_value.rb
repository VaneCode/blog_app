class ChangePhotoDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :photo, from: nil, to: 'https://cdn2.iconfinder.com/data/icons/membership-account-outline/200/coder-512.png') 
  end
end
