require_relative '../app'

require 'rspec/given'
require 'pry'

ENV["RACK_ENV"] ||= "test"

ActiveRecord::Base.logger = nil

RSpec.configure do |c|
  c.color = true
  c.order = :rand

  c.around(:each) do |example|
    CourseRecord.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end
