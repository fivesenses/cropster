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

  # test "should merge sort uri options" do
  #   client = cropster_client
  #   uri = client.uri_options("processings", { sort: { startDate: "desc" } })
  #   assert_equal "sort[processings][startDate]=desc&filter[processings][group]=CROR", uri
  # end

  test "should build options" do
    client = cropster_client

    options = client.build_options("filter", "processings", { profile: { id: 'FOO' } })
    result = "filter%5Bprocessings%5D%5Bprofile%5D%5Bid%5D=FOO"
    assert_equal result, options
  end
end
