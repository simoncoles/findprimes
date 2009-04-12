class CreatePrimes < ActiveRecord::Migration
  def self.up
    create_table :primes do |t|
      t.timestamps
      t.decimal :the_number
    end
    add_index :primes, :the_number
    
  end

  def self.down
    drop_table :primes
  end
end
