require "test_helper"

class Cropster::Response::SensorialSheetTest < Test::Unit::TestCase
  test "should initialize the object" do
    sheet = Cropster::Response::SensorialSheet.new(valid_response)
    assert_equal "id", sheet.id
    assert_equal "name", sheet.name
    assert_equal "acronym", sheet.acronym
    assert_equal 1.0, sheet.delta_score
    assert_equal true, sheet.has_roast_levels
    assert_equal true, sheet.is_active
    assert_equal true, sheet.is_evaluator_score_allowed
    assert_equal true, sheet.is_global
    assert_equal 1, sheet.roast_levels_max
    assert_equal 1, sheet.roast_levels_min
    assert_equal 1.0, sheet.roast_levels_step
    assert_equal 1.0, sheet.score_maximum
    assert_equal 1.0, sheet.score_minimum
    assert_equal ["AAAA", "BBBB"], sheet.sensorial_sheet_items
  end

  def valid_response
    {
      "id": "id",
      "type": "sensorialSheets",
      "attributes": {
        "name": "name",
        "acronym": "acronym",
        "deltaScore": 1.0,
        "hasRoastLevels": true,
        "isActive": true,
        "isEvaluatorScoreAllowed": true,
        "isGlobal": true,
        "roastLevelsMax": 1,
        "roastLevelsMin": 1,
        "roastLevelsStep": 1.0,
        "scoreMaximum": 1.0,
        "scoreMinimum": 1.0
      },
      "relationships": {
        "productType": {
          "data": {
            "id": "AAAA",
            "type": "productTypes"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialSheets/id/relationships/productType",
            "related": "https://c-sar.cropster.com/api/v2/sensorialSheets/id/productType"
          }
        },
        "sensorialSheetItems": {
          "data": [{
            "type": "sensorialSheetItems",
            "id": "AAAA"
          }, {
            "type": "sensorialSheetItems",
            "id": "BBBB"
          }],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialSheets/id/relationships/sensorialSheetItems",
            "related": "https://c-sar.cropster.com/api/v2/sensorialSheets/id/sensorialSheetItems"
          }
        }
      }
    }
  end
end
