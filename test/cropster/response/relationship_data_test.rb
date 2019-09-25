require 'test_helper'

class Cropster::Response::RelationshipDataTest < Test::Unit::TestCase

  test "should initialize the object" do
    data = Cropster::Response::RelationshipData.new(valid_response)
    assert_not_nil data
    assert_equal [], data.processed_data
  end

  test "should return with no response" do
    data = Cropster::Response::RelationshipData.new(nil)
    data.process
    assert_equal [], data.processed_data
  end

  test "should return with missing :data key" do
    data = Cropster::Response::RelationshipData.new({foo: :bar})
    data.process
    assert_equal [], data.processed_data
  end

  test "should process a hash" do
    data = Cropster::Response::RelationshipData.new({ data: { id: "foo" } }) 
    data.process
    assert_equal ["foo"], data.processed_data
  end

  test "should process the valid response" do
    data = Cropster::Response::RelationshipData.new(valid_response)
    data.process
    assert_equal ["foo", "bar"], data.processed_data
  end

  def valid_response
    {
      "data": [
        {"id": "foo", "type": "sourceContacts"},
        {"id": "bar", "type": "sourceContacts"}
      ],
      "links": {
        "self":"https://c-sar.cropster.com/api/v2/lots/aa/relationships/sourceContacts",
        "related":"https://c-sar.cropster.com/api/v2/lots/aa/sourceContacts"
      }
    }
  end
end
