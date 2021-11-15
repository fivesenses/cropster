require "test_helper"

class Cropster::Response::SensorialQcTest < Test::Unit::TestCase
  def test_initialize
    qc = Cropster::Response::SensorialQc.new(valid_response)
    assert_equal "vpvZ", qc.id
    assert_equal "SG-0001", qc.sample_code
  end

  def valid_response
    {
      "id": "vpvZ",
      "type": "sensorialQcs",
      "attributes": {
        "createdDate": 1348643088000,
        "lastModifiedDate": 1350368784000,
        "sampleCode": "SG-0001",
        "scheduleDate": 1348643040000,
        "description": nil,
        "idTag": "Pe-12-09-26-01",
        "weight": {
          "amount": 220.0,
          "unit": "G",
          "amountSI": 0.22
        },
        "resultSummary": {
          "averageScore": "82.5",
          "samplesCount": 2,
          "minSpread": "-0.5",
          "maxSpread": "+0.5"
        },
        "isActive": true,
        "category": nil,
        "lab": "Perth",
        "resultType": "cuppingType"
      },
      "relationships": {
        "lot": {
          "data": {
            "id": "oqpy","type":"lots"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/relationships/lot",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/lot"
          }
        },
        "sensorialResults": {
          "data": [
            {"id": "owQd","type":"sensorialResults"},
            {"id": "Onxj","type":"sensorialResults"}
          ],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/relationships/sensorialResults",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/sensorialResults"
          }
        },
        "sensorialSheet": {
          "data": {
            "id": "N0","type":"sensorialSheets"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/relationships/sensorialSheet",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/sensorialSheet"
          }
        },
        "group": {
          "data": {
            "id": "5SC",
            "type": "groups"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/relationships/group",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/group"
          }
        },
        "sensorialSession": {
          "data": nil,
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/relationships/sensorialSession",
            "related": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ/sensorialSession"
          }
        }
      },
      "links": {
        "self": "https://c-sar.cropster.com/api/v2/sensorialQcs/vpvZ"
      }
    }
  end
end
