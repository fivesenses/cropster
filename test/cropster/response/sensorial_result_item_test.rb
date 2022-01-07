require "test_helper"

class Cropster::Response::SensorialResultItemTest < Test::Unit::TestCase
  test "should initialize the object" do
    result_item = Cropster::Response::SensorialResultItem.new(valid_response)
    assert_equal "AA", result_item.id
    assert_equal 1.0, result_item.calculated_quality
    assert_equal 3.0, result_item.intensity
    assert_equal 5.0, result_item.quality
    assert_equal "AAAA", result_item.sensorial_result_id
    assert_equal "AAAA", result_item.sensorial_sheet_item_id
  end

  def valid_response
    {
      "id": "AA",
      "type": "sensorialResultItems",
      "attributes": {
        "calculatedQuality": 1.0,
        "intensity": 3.0,
        "quality": 5.0
      },
      "relationships": {
        "sensorialDescriptors": {
          "data": [{
            "type": "sensorialDescriptors",
            "id": "AAAA"
          }, {
            "type": "sensorialDescriptors",
            "id": "BBBB"
          }],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialResultItems/id/relationships/sensorialDescriptors",
            "related": "https://c-sar.cropster.com/api/v2/sensorialResultItems/id/sensorialDescriptors"
          }
        },
        "sensorialResult": {
          "data": {
            "id": "AAAA",
            "type": "sensorialResults"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialResultItems/id/relationships/sensorialResult",
            "related": "https://c-sar.cropster.com/api/v2/sensorialResultItems/id/sensorialResult"
          }
        },
        "sensorialSheetItem": {
          "data": {
            "id": "AAAA",
            "type": "sensorialSheetItems"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialResultItems/id/relationships/sensorialSheetItem",
            "related": "https://c-sar.cropster.com/api/v2/sensorialResultItems/id/sensorialSheetItem"
          }
        }
      }
    }
  end
end
