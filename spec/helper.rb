# Configure Rails Envinronment
ENV["RAILS_ENV"] ||= "test"

require 'rspec'
require 'pry'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)

Rails.backtrace_cleaner.remove_silencers!
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)


RSpec.configure do |config|

  config.include(ApplicationHelper)

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

end