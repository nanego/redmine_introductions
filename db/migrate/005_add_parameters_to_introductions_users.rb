class AddParametersToIntroductionsUsers < ActiveRecord::Migration[4.2]
  def self.up
    drop_table :introductions_users
    create_table :introductions_users do |t|
      t.belongs_to :introduction
      t.belongs_to :user
      t.datetime :last_view
      t.boolean :blocked
    end
  end

  def self.down
    drop_table :introductions_users
    create_table :introductions_users, :id => false do |t|
      t.belongs_to :introduction
      t.belongs_to :user
    end
  end
end
