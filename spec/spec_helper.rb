require 'bundler/setup'
require 'virtus'
require 'rspec/given'

ENV["RACK_ENV"] ||= "test"

RSpec.configure do |c|
  c.color = true
  c.order = :rand  
end
