class IndexForeignKeysInIntroductionSteps < ActiveRecord::Migration
  def change
    add_index :introduction_steps, :introduction_id
  end
end
