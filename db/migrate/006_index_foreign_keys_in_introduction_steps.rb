class IndexForeignKeysInIntroductionSteps < ActiveRecord::Migration[4.2]
  def change
    add_index :introduction_steps, :introduction_id
  end
end
