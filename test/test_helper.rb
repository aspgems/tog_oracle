ENV["RAILS_ENV"] = "test"
require 'rubygems'
require 'active_support'
require 'active_support/test_case'

require 'shoulda'
require "shoulda/action_controller"
require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")
