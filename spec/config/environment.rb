# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
WatirRails::Application.initialize!

WatirRails::Application.config.secret_token = '81d5a4d251df513e47294d8ca73770dd43039b821f06e0a6161f93f1cbdfecd1d7e57f20ceeb6c2ce7e12e5b595c55808a403859cc4b0c324c4760bac9645bb9'

Rails.logger = Logger.new(STDOUT)

