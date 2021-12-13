require "test_helper"

class Cropster::Response::SensorialQcTest < Test::Unit::TestCase
  def test_initialize
    qc = Cropster::Response::SensorialQc.new(valid_response)
    assert_equal "id", qc.id
    assert_equal "sampleCode", qc.sample_code
    assert_equal 76.0, qc.result_average_score
    assert_equal 1, qc.result_samples_count
    assert_equal "-0.0", qc.result_spread_min
    assert_equal "+0.0", qc.result_spread_max
    assert_equal "resultType", qc.result_type
    assert_equal "labName", qc.lab
    assert_match(/This is the/, qc.description)
    assert_equal "AAAA", qc.lot_id
  end

  def valid_response
    {
      "id": "id",
      "type": "sensorialQcs",
      "attributes": {
        "idTag": "idTag",
        "category": nil,
        "createdDate": 1575281700412,
        "description": "This is the description",
        "isActive": nil,
        "lab": "labName",
        "lastModifiedDate": 1575281700412,
        "resultSummary": {
          "averageScore": "76.0",
          "samplesCount": 1,
          "minSpread": "-0.0",
          "maxSpread": "+0.0"
        },
        "resultType": "resultType",
        "sampleCode": "sampleCode",
        "scheduleDate": nil,
        "weight": nil
      },
      "relationships": {
        "group": {
          "data": {
            "id": "AAAA",
            "type": "groups"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/relationships/group",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/group"
          }
        },
        "lot": {
          "data": {
            "id": "AAAA",
            "type": "lots"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/relationships/lot",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/lot"
          }
        },
        "sensorialResults": {
          "data": [],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/relationships/sensorialResults",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/sensorialResults"
          }
        },
        "sensorialSession": {
          "data": {
            "id": "AAAA",
            "type": "sensorialSessions"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/relationships/sensorialSession",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/sensorialSession"
          }
        },
        "sensorialSheet": {
          "data": nil,
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/relationships/sensorialSheet",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/id/sensorialSheet"
          }
        }
      }
    }
  end
end
