require 'test_helper'

class Cropster::Response::SourceContactTest < Test::Unit::TestCase
  def test_initialize
    item = Cropster::Response::SourceContact.new(valid_response)
    assert_equal "06zgEL", item.id
    assert_equal "E2m3k", item.contact_id
  end

  def valid_response
    {
      "id": "06zgEL",
      "type": "sourceContacts",
      "relationships": {
        "lot": {
          "data":{
            "id":"n6aeeK",
            "type":"lots"
          },
          "links":{
            "self":"https://c-sar.cropster.com/api/v2/sourceContacts/06zgEL/relationships/lot",
            "related":"https://c-sar.cropster.com/api/v2/sourceContacts/06zgEL/lot"
          }
        },
        "contact":{
          "data":{
            "id":"E2m3k",
            "type":"contacts"
          },
          "links":{
            "self":"https://c-sar.cropster.com/api/v2/sourceContacts/06zgEL/relationships/contact",
            "related":"https://c-sar.cropster.com/api/v2/sourceContacts/06zgEL/contact"
          }
        },
        "contactRole":{
          "data":{
            "id":"6Z",
            "type":"contactRoles"
          },
          "links":{
            "self":"https://c-sar.cropster.com/api/v2/sourceContacts/06zgEL/relationships/contactRole",
            "related":"https://c-sar.cropster.com/api/v2/sourceContacts/06zgEL/contactRole"}
        }
      },
      "links":{"self":"https://c-sar.cropster.com/api/v2/sourceContacts/06zgEL"}
    }
  end
end
