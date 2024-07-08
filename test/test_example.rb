require 'minitest/autorun'
require_relative '../lib/cropster'

class CropsterTest < Minitest::Test
  def test_successful_api_call
    client = Cropster::Client.new(api_key: 'valid_key')
    response = client.get('endpoint')
    assert_equal 200, response.status
  end

  def test_failed_api_call
    client = Cropster::Client.new(api_key: 'invalid_key')
    assert_raises Cropster::Error do
      client.get('endpoint')
    end
  end
end
