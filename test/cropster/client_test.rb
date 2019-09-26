require 'test_helper'

class Cropster::ClientTest < Test::Unit::TestCase
  def setup
  end

  def test_initialize
    client = cropster_client

    assert_not_nil client
    assert_equal "foo", client.api_key
    assert_equal "bar", client.api_secret
    assert_equal "CROR", client.group_code
  end

  test "should build uri options" do
    client = cropster_client
    uri = client.uri_options("processings", { })
    result = "filter%5Bprocessings%5D%5Bgroup%5D=CROR"
    assert_equal result, uri
  end

  test "should merge filter uri options" do
    client = cropster_client
    uri = client.uri_options("processings", { filter: { profile: "id" } })
    result =  "filter%5Bprocessings%5D%5Bgroup%5D=CROR&filter%5Bprocessings%5D%5Bprofile%5D=id"

    assert_equal result, uri
  end

  test "should build page options" do
    client = cropster_client
    uri = client.uri_options("processings", { filter: { profile: "id" }, page: { number: 1 } })
    result = "filter%5Bprocessings%5D%5Bgroup%5D=CROR&filter%5Bprocessings%5D%5Bprofile%5D=id&page%5Bnumber%5D=1&page%5Bsize%5D=50"

    assert_equal result, uri
  end


  test "should build options" do
    client = cropster_client

    options = client.uri_options("processings", { filter: { profile: { id: 'FOO' } } })
    result = "filter%5Bprocessings%5D%5Bgroup%5D=CROR&filter%5Bprocessings%5D%5Bprofile%5D%5Bid%5D=FOO"

    assert_equal result, options
  end

  test "should build include options" do
    client = cropster_client

    options = client.uri_options("lots", { include: "sourceContacts.all"} )
    result = "filter%5Blots%5D%5Bgroup%5D=CROR&include%5Blots%5D=sourceContacts.all"

    assert_equal result, options
  end
end
