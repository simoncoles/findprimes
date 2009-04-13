class WelcomeController < ApplicationController
  def index
    
    last_prime = Prime.find(:last)
    first_prime = Prime.find(:first)
    
    @number_of_primes = Prime.how_many
    @total_runtime = last_prime.found_at - first_prime.started_at
    @highest_prime = last_prime.the_number
    @highest_runtime = last_prime.found_at - last_prime.started_at
  end
end

