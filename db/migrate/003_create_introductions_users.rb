class CreateIntroductionsUsers < ActiveRecord::Migration
  def change
    create_table :introductions_users, :id => false do |t|
      t.belongs_to :introduction
      t.belongs_to :user
    end
  end
end
