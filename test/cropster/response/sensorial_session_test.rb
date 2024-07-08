require "test_helper"

class Cropster::Response::SensorialSessionTest < Test::Unit::TestCase
  test "should initialize the object" do
    session = Cropster::Response::SensorialSession.new(valid_response)
    assert_equal "id", session.id
    assert_equal "idTag", session.id_tag
    assert_equal ["codes"], session.codes
    assert_equal ["evaluators"], session.evaluators
    assert_equal true, session.is_active
    assert_equal nil, session.is_blind
    assert_equal nil, session.lab
    assert_equal nil, session.schedule_date
    assert_equal 1.0, session.sensorial_qc_count
    assert_equal [], session.sensorial_qc_order
    assert_equal nil, session.state
    assert_equal ["AAAA", "BBBB"], session.sensorial_qcs
    assert_equal "AAAA", session.sensorial_sheet_id
  end

  def valid_response
    {
      "id": "id",
      "type": "sensorialSessions",
      "attributes": {
        "idTag": "idTag",
        "name": nil,
        "codeType": nil,
        "codes": ["codes"],
        "evaluators": ["evaluators"],
        "isActive": true,
        "isBlind": nil,
        "lab": nil,
        "scheduleDate": nil,
        "sensorialQcCount": 1.0,
        "sensorialQcOrder": [],
        "state": nil
      },
      "relationships": {
        "group": {
          "data": {
            "id": "AAAA",
            "type": "groups"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialSessions/id/relationships/group",
            "related": "https://c-sar.cropster.com/api/v2/sensorialSessions/id/group"
          }
        },
        "sensorialQcs": {
          "data": [ {
            "type": "sensorialQcs",
            "id": "AAAA"
          }, {
            "type": "sensorialQcs",
            "id": "BBBB"
          } ],
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialSessions/id/relationships/sensorialQcs",
            "related": "https://c-sar.cropster.com/api/v2/sensorialSessions/id/sensorialQcs"
          }
        },
        "sensorialSheet": {
          "data": {
            "id": "AAAA",
            "type": "sensorialSheets"
          },
          "links": {
            "self": "https://c-sar.cropster.com/api/v2/sensorialSessions/id/relationships/sensorialSheet",
            "related": "https://c-sar.cropster.com/api/v2/sensorialSessions/id/sensorialSheet"
          }
        }
      }
    }
  end
end
