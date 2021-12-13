require "test_helper"

class Cropster::Response::SensorialDescriptorTest < Test::Unit::TestCase
  def test_initialize
    descriptor = Cropster::Response::SensorialDescriptor.new(valid_response)
    assert_equal "high", descriptor.intensity
    assert_equal "true", descriptor.is_positive
  end

  def valid_response
    {
      "type": "sensorialDescriptors",
      "id": "AA",
      "attributes": {
        "intensity": "high",
        "isPositive": "true"
      }
    }
  end
end
