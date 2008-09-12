# Those lines are plugin test settings
ENV['RAILS_ENV'] = 'test'

require File.dirname(__FILE__) + '/../../../../config/environment'
require File.dirname(__FILE__) + '/../lib/localized_templates.rb'
require 'test_help'