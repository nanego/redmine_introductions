class ChangeStepColumnType < ActiveRecord::Migration[5.2]
  def self.up
    change_column :introduction_steps, :step, :integer, using: 'step::integer'
  end

  def self.down
    change_column :introduction_steps, :step, :string
  end
end
