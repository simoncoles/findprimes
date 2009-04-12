class AddTimes < ActiveRecord::Migration
  def self.up
    add_column :primes, :started_at, :datetime
    add_column :primes, :found_at, :datetime
  end

  def self.down
  end
end
