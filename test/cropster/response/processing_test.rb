require "test_helper"

class Cropster::Response::ProcessingTest < Test::Unit::TestCase
  def test_initialize
    processing = Cropster::Response::Processing.new(valid_response)
    assert_match(/John Doe/, processing.worker)
    assert_match(/My processing notes/, processing.notes)
    assert_equal(101.1, processing.start_weight.amount)
    assert_equal(98.24, processing.end_weight.amount)
    assert_equal(["AA"], processing.lots)
    assert_equal(["AA"], processing.machines)
    assert_equal(["AA"], processing.profiles)
    assert_equal(["AAAA", "BBBB"], processing.comments)
    assert_equal(["AAAA", "BBBB"], processing.measures)
  end

  def valid_response
    {
      "type": "processings",
      "id": "AA",
      "attributes": {
        "worker": "John Doe",
        "startDate": 1462904878082,
        "endDate": 1462904878082,
        "duration": 10000,
        "notes": "My processing notes",
        "startWeight": {
          "amount": 101.1,
          "unit": "KG"
        },
        "endWeight": {
          "amount": 98.24,
          "unit": "KG"
        },
        "measures": [
          {
            "name": "roastAreaIndex",
            "value": {
              "amount": 10000.1,
              "unit": "CELSIUS"
            }
          }
        ],
        "comments": [
          {
            "time": 90000,
            "text": nil,
            "event": "firstCrack"
          }
        ]
      },
      "relationships": {
        "lot": {
          "links": {
            "related": "https://c-sar.cropster.com/api/v2/lots/AA"
          },
          "data": {
            "type": "lots",
            "id": "AA"
          }
        },
        "machine": {
          "links": {
            "related": "https://c-sar.cropster.com/api/v2/processings/AA/machine"
          },
          "data": {
            "type": "machines",
            "id": "AA"
          }
        },
        "profile": {
          "links": {
            "related": "https://c-sar.cropster.com/api/v2/processings/AA/profile"
          },
          "data": {
            "type": "profiles",
            "id": "AA"
          }
        },
        "processingComments": {
          "data": [ {
            "type": "processingComments",
            "id": "AAAA"
          }, {
            "type": "processingComments",
            "id": "BBBB"
          } ],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/processings/id/relationships/processingComments",
            "related": "https://c-sar.cropster.com/api/v2/processings/id/processingComments"
          }
        },
        "processingMeasures": {
          "data": [ {
            "type": "processingMeasures",
            "id": "AAAA"
          }, {
            "type": "processingMeasures",
            "id": "BBBB"
          } ],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/processings/id/relationships/processingMeasures",
            "related": "https://c-sar.cropster.com/api/v2/processings/id/processingMeasures"
          }
        },
        "processingCurves": {
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/processings/AA/relationships/processingCurves",
            "related": "https://c-sar.cropster.com/api/v2/processings/AA/processingCurves"
          }
        }
      }
    }
  end
end
