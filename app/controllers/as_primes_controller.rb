class AsPrimesController < ApplicationController
  active_scaffold :primes do |config|
    config.list.columns = [:started_at, :found_at, :the_number]
    config.list.sorting = {:created_at => :desc }
    config.actions.exclude :create, :update, :delete, :show
  end
end
