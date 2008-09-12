# Those lines are plugin test settings
ENV['RAILS_ENV'] = 'test'

require File.dirname(__FILE__) + '/../../../../config/environment'
require File.dirname(__FILE__) + '/../lib/localized_rescue.rb'
require 'test_help'

FIXTURES_PATH = File.join(File.dirname(__FILE__), 'fixtures')
ActionController::Base.view_paths = FIXTURES_PATH
Rails.public_path = "#{FIXTURES_PATH}/public"

ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
end

I18n.load_translations "#{FIXTURES_PATH}/en-US.yml"
I18n.load_translations "#{FIXTURES_PATH}/pt-BR.yml"

I18n.locale = 'en-US'

class LocalizedRescueController < ActionController::Base
  def index
    render_optional_error_file params[:id]
  end
end

class LocalizedRescueTest < Test::Unit::TestCase

  def setup
    @controller = LocalizedRescueController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_render_optional_error_file_without_localization
    get :index, :id => 500

    assert_response 500
    body = File.read("#{FIXTURES_PATH}/public/500.html")
    assert_equal body, @response.body
  end

  def test_render_optional_error_file_with_localization
    I18n.locale = 'en-US' 
    get :index, :id => 404

    assert_response 404
    body = File.read("#{FIXTURES_PATH}/public/404-en-US.html")
    assert_equal body, @response.body

    I18n.locale = 'pt-BR' 
    get :index, :id => 404

    assert_response 404
    body = File.read("#{FIXTURES_PATH}/public/404-pt-BR.html")
    assert_equal body, @response.body
  end

end