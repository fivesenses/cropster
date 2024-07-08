require "test_helper"

class Cropster::Response::FlavorTest < Test::Unit::TestCase
  test "should initialize the object" do
    flavor = Cropster::Response::Flavor.new(valid_response)
    assert_equal "chocolate", flavor.name
  end

  def valid_response
    {
      "id": "id",
      "type": "flavors",
      "attributes": {
        "name": "chocolate",
        "isDirty": nil,
        "isPositive": nil
      },
      "relationships": {
        "group": {
          "data": {
            "id": "AAAA",
            "type": "groups"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/flavors/id/relationships/group",
            "related": "https://c-sar.cropster.com/api/v2/flavors/id/group"
          }
        },
        "productType": {
          "data": {
            "id": "AAAA",
            "type": "productTypes"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/flavors/id/relationships/productType",
            "related": "https://c-sar.cropster.com/api/v2/flavors/id/productType"
          }
        }
      }
    }
  end
end
