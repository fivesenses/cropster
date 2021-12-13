require "test_helper"

class Cropster::Response::SensorialResultTest < Test::Unit::TestCase
  test "should initialize the object" do
    result = Cropster::Response::SensorialResult.new(valid_response)
    assert_equal "id", result.id
    assert_equal 1.3, result.calculated_score
    assert_equal 1.3, result.evaluator_score
    assert_equal 1.0, result.final_score
    assert_equal true, result.is_taken_into_account
    assert_equal "notes", result.notes
    assert_equal "roastLevel", result.roast_level
    assert_equal "AAAA", result.sensorial_qc_id
    assert_equal "AAAA", result.sensorial_session_id
    assert_equal "AAAA", result.sensorial_sheet_id
  end

  def valid_response
    {
      "id": "id",
      "type": "sensorialResults",
      "attributes": {
        "calculatedScore": 1.3,
        "evaluationDate": nil,
        "evaluator": "evaluator",
        "evaluatorScore": 1.3,
        "finalScore": 1.0,
        "isTakenIntoAccount": true,
        "notes": "notes",
        "roastLevel": "roastLevel",
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
