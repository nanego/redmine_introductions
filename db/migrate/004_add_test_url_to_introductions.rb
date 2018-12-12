class AddTestUrlToIntroductions < ActiveRecord::Migration[4.2]
  def self.up
    add_column :introductions, :test_url, :string
  end

  def self.down
    remove_column :introductions, :test_url
  end
end
