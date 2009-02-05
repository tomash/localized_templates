# Those lines are plugin test settings
require 'test/unit'
require 'rubygems'

ENV["RAILS_ENV"] = "test"

require 'active_support'
require 'action_controller'
require 'action_controller/test_case'
require 'action_controller/test_process'

require File.dirname(__FILE__) + '/../lib/localized_templates.rb'

FIXTURES_PATH = File.join(File.dirname(__FILE__), 'fixtures')
ActionController::Base.view_paths = FIXTURES_PATH

# Mock Rails! :)
#
class Rails
  def self.public_path
    "#{FIXTURES_PATH}/public"
  end
end

ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
end

I18n.locale = 'en-US'
