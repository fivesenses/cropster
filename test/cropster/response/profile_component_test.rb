require "test_helper"

class Cropster::Response::ProfileComponentTest < Test::Unit::TestCase
  def test_initialize
    profile_component = Cropster::Response::ProfileComponent.new(valid_response)
    assert_equal("PaV", profile_component.id)
    assert_equal("profileComponents", profile_component.type)
    assert_equal(1, profile_component.percentage)
    assert_equal("Comp 1", profile_component.name)
    assert_equal("YBrm", profile_component.profile_id)
    assert_equal("profiles", profile_component.profile_type)
  end

  def valid_response
    {
      "id": "PaV",
      "type": "profileComponents",
      "attributes": {
        "percentage": 1,
        "name": "Comp 1"
      },
      "relationships": {
        "lots": {
          "data": [{
            "id": "joJNK",
            "type": "lots"
          }],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profileComponents/PaV/relationships/lots",
            "related": "https://c-sar.cropster.com/api/v2/profileComponents/PaV/lots"
          }
        },
        "profile": {
          "data": {
            "id": "YBrm",
            "type": "profiles"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/profileComponents/PaV/relationships/profile",
            "related": "https://c-sar.cropster.com/api/v2/profileComponents/PaV/profile"
          }
        }
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/profileComponents/PaV"
      }
    }
  end
end
