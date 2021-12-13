require "test_helper"

class Cropster::Response::SensorialResultTest < Test::Unit::TestCase
  test "should initialize the object" do
    result = Cropster::Response::SensorialResult.new(valid_response)
    assert_equal "AA", result.id
    assert_equal "evaluator", result.evaluator
    assert_equal 12.23, result.calculated_score
    assert_equal 12.25, result.evaluator_score
    assert_equal 1.0, result.final_score
    assert_equal "notes", result.notes
    assert_equal "roastLevel", result.roast_level
    assert_equal "AAAA", result.lot_id
    assert_equal "AAAA", result.sensorial_qc_id
    assert_equal "AAAA", result.sensorial_session_id
    assert_equal "AAAA", result.sensorial_sheet_id
    assert_equal [], result.sensorial_result_items
  end

  def valid_response
    {
      "id": "AA",
      "type": "sensorialResults",
      "attributes": {
        "calculatedScore": 12.23,
        "evaluationDate": nil,
        "evaluator": "evaluator",
        "evaluatorScore": 12.25,
        "finalScore": 1.0,
        "isTakenIntoAccount": nil,
        "notes": "notes",
        "roastLevel": "roastLevel"
      },
      "relationships": {
        "lot": {
          "data": {
            "id": "AAAA",
            "type": "lots"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialResults/id/relationships/lot",
            "related": "https://c-sar.cropster.com/api/v2/sensorialResults/id/lot"
          }
        },
        "sensorialQc": {
          "data": {
            "id": "AAAA",
            "type": "sensorialQcs"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialResults/id/relationships/sensorialQc",
            "related": "https://c-sar.cropster.com/api/v2/sensorialResults/id/sensorialQc"
          }
        },
        "sensorialResultItems": {
          "data": [],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialResults/id/relationships/sensorialResultItems",
            "related": "https://c-sar.cropster.com/api/v2/sensorialResults/id/sensorialResultItems"
          }
        },
        "sensorialSession": {
          "data": {
            "id": "AAAA",
            "type": "sensorialSessions"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialResults/id/relationships/sensorialSession",
            "related": "https://c-sar.cropster.com/api/v2/sensorialResults/id/sensorialSession"
          }
        },
        "sensorialSheet": {
          "data": {
            "id": "AAAA",
            "type": "sensorialSheets"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialResults/id/relationships/sensorialSheet",
            "related": "https://c-sar.cropster.com/api/v2/sensorialResults/id/sensorialSheet"
          }
        }
      }
    }
  end
end
