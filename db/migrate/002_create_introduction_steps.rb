class CreateIntroductionSteps < ActiveRecord::Migration
  def change
    create_table :introduction_steps do |t|
      t.integer :introduction_id
      t.string :step
      t.string :text
      t.string :position
      t.string :selector
      t.string :url
    end
  end
end
