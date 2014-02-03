class AddTestUrlToIntroductions < ActiveRecord::Migration
  def self.up
    add_column :introductions, :test_url, :string
  end

  def self.down
    remove_column :introductions, :test_url
  end
end
