class IndexForeignKeysInIntroductionsUsers < ActiveRecord::Migration
  def change
    add_index :introductions_users, :introduction_id
    add_index :introductions_users, :user_id
  end
end
