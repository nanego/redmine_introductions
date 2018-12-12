class CreateIntroductionsUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :introductions_users, :id => false do |t|
      t.belongs_to :introduction
      t.belongs_to :user
    end
  end
end
