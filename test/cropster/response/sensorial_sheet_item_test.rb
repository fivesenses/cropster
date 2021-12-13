require "test_helper"

class Cropster::Response::SensorialSheetItemTest < Test::Unit::TestCase
  test "should initialize the object" do
    sheet_item = Cropster::Response::SensorialSheetItem.new(valid_response)
    assert_equal "id", sheet_item.id
    assert_equal "name", sheet_item.name
    assert_equal ["allowedFlavors"], sheet_item.allowed_flavors
    assert_equal "formula", sheet_item.formula
    assert_equal "grouping", sheet_item.grouping
    assert_equal true, sheet_item.has_descriptors
    assert_equal true, sheet_item.has_intensity
    assert_equal true, sheet_item.has_quality
    assert_equal "DROPDOWN", sheet_item.input_type
    assert_equal 1, sheet_item.intensity_max
    assert_equal 1, sheet_item.intensity_min
    assert_equal 1.0, sheet_item.intensity_step
    assert_equal true, sheet_item.is_general_descriptors_item
    assert_equal "note", sheet_item.note
    assert_equal 1, sheet_item.position
    assert_equal 1, sheet_item.quality_max
    assert_equal 1, sheet_item.quality_min
    assert_equal 1.0, sheet_item.quality_step
    assert_equal "AAAA", sheet_item.sensorial_sheet_id
  end

  def valid_response
    {
      "id": "id",
      "type": "sensorialSheetItems",
      "attributes": {
        "name": "name",
        "allowedFlavors": ["allowedFlavors"],
        "formula": "formula",
        "grouping": "grouping",
        "hasDescriptors": true,
        "hasIntensity": true,
        "hasQuality": true,
        "inputType": "DROPDOWN",
        "intensityMax": 1,
        "intensityMin": 1,
        "intensityStep": 1.0,
        "isGeneralDescriptorsItem": true,
        "note": "note",
        "position": 1,
        "qualityMax": 1,
        "qualityMin": 1,
        "qualityStep": 1.0
      },
      "relationships": {
        "sensorialSheet": {
          "data": {
            "id": "AAAA",
            "type": "sensorialSheets"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialSheetItems/id/relationships/sensorialSheet",
            "related": "https://c-sar.cropster.com/api/v2/sensorialSheetItems/id/sensorialSheet"
          }
        }
      }
    }
  end
end
