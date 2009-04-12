# == Schema Information
# Schema version: 20090412212918
#
# Table name: primes
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  the_number :decimal(, )
#  started_at :datetime
#  found_at   :datetime
#

class Prime < ActiveRecord::Base
  
  def self.find_next_prime
    last_prime = self.find(:last)
    if last_prime
      started_at = DateTime.now
      the_number = self.find_prime_after(last_prime.the_number)
      found_at = DateTime.now
      it = self.new({
        :started_at => started_at,
        :found_at => found_at, 
        :the_number => the_number
        })
      it.save
    else
      # First time we've run - create prime of 1
      it = self.new({
        :started_at => DateTime.now,
        :found_at => DateTime.now, 
        :the_number => 1
        })
      it.save
    end
    return it.the_number
  end
  
  def self.find_prime_after(num)
    current_candidate = num + 1
    until is_prime(current_candidate) do
      current_candidate += 1
    end
    return current_candidate
  end
  
  # Is this a prime number
  def self.is_prime(num)
    # puts "Seeing if #{num} is prime"
    is_prime = true
    # Check all the numbers
    for i in (2..num - 1)
      # puts " Checking #{i}"
      # See if it's divisble
      if num % i == 0
        # puts "  Found divisor #{i}"
        is_prime = false
        break
      end
    end
    return is_prime
  end
  
  def self.find_primes
    while true do
      self.find_next_prime
    end
  end
  
end
