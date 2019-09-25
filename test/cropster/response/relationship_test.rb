require 'test_helper'

class Cropster::Response::RelationshipTest < Test::Unit::TestCase
  test "should initialize an object" do
    relationship = Cropster::Response::Relationship.new(valid_response)
    assert_not_nil relationship
    assert relationship.result.has_key?(:source_contacts)
    assert relationship.result[:source_contacts].is_a?(Array)
  end

  test "should load sourceContacts data from the valid response" do
    relationship = Cropster::Response::Relationship.new(valid_response)
    assert_equal ["foo", "bar"], relationship.result[:source_contacts]
  end

  def valid_response
    {
      "sourceContacts": {
        "data": [
          {"id": "foo", "type": "sourceContacts"},
          {"id": "bar", "type": "sourceContacts"}
        ],
        "links": {
          "self":"https://c-sar.cropster.com/api/v2/lots/aa/relationships/sourceContacts",
          "related":"https://c-sar.cropster.com/api/v2/lots/aa/sourceContacts"
        }
      }
    }
  end
end
