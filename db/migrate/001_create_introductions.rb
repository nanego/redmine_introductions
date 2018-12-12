class CreateIntroductions < ActiveRecord::Migration[4.2]
  def change
    create_table :introductions do |t|
      t.string :name
      t.string :url
      t.date :start_at
      t.date :stop_at
    end
  end
end
