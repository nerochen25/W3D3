class AddUserToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :shortened_urls, :user_id, :integer
    add_index :shortened_urls, :user_id
  end
end
