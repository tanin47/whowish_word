require 'rubygems'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require File.expand_path('../../../lib/whowish_word', __FILE__)
