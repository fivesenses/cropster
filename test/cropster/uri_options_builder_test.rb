require "test_helper"

class Cropster::UriOptionsBuilderTest < Test::Unit::TestCase
  test "should build uri options" do
    uri = Cropster::UriOptionsBuilder.new("processings", {}, "CROR").uri
    result = "filter%5Bprocessings%5D%5Bgroup%5D=CROR"
    assert_equal result, uri
  end

  test "should merge filter uri options" do
    uri = Cropster::UriOptionsBuilder
      .new("processings", {filter: {profile: "id"}}, "CROR")
      .uri

    result =
      "filter%5Bprocessings%5D%5Bgroup%5D=CROR&filter%5Bprocessings%5D%5Bprofile%5D=id"

    assert_equal result, uri
  end

  test "should build page options" do
    uri = Cropster::UriOptionsBuilder
      .new("processings", {filter: {profile: "id"}, page: {number: 0}}, "CROR")
      .uri

    result =
      "filter%5Bprocessings%5D%5Bgroup%5D=CROR&filter%5Bprocessings%5D%5Bprofile%5D=id&page%5Bnumber%5D=0&page%5Bsize%5D=50"

    assert_equal result, uri
  end

  test "should build page options with a page size set" do
    uri = Cropster::UriOptionsBuilder
      .new("processings", {filter: {profile: "id"}, page: {number: 0, size: 9999}}, "CROR")
      .uri

    result =
      "filter%5Bprocessings%5D%5Bgroup%5D=CROR&filter%5Bprocessings%5D%5Bprofile%5D=id&page%5Bnumber%5D=0&page%5Bsize%5D=9999"

    assert_equal result, uri
  end

  test "should build options" do
    uri = Cropster::UriOptionsBuilder
      .new("processings", {filter: {profile: {id: "FOO"}}}, "CROR")
      .uri
    result = "filter%5Bprocessings%5D%5Bgroup%5D=CROR&filter%5Bprocessings%5D%5Bprofile%5D%5Bid%5D=FOO"

    assert_equal result, uri
  end

  test "should build include options" do
    uri = Cropster::UriOptionsBuilder
      .new("lots", {include: "sourceContacts.all"}, "CROR")
      .uri
    result = "filter%5Blots%5D%5Bgroup%5D=CROR&include%5Blots%5D=sourceContacts.all"

    assert_equal result, uri
  end
end
