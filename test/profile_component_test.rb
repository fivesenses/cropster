require "test_helper"

class Cropster::ProfileComponentTest < Test::Unit::TestCase
  def test_profile_component_success
    register_fixtures
    load_fixture(:get_profile_component_200)

    profile_component = Cropster::ProfileComponent
      .new(cropster_client)
      .profile_component("6XdV8")

    assert_equal "6XdV8", profile_component.id
    assert_equal 1, profile_component.percentage
    assert_nil profile_component.name
  end

  test "should get a collection of ProfileComponents" do
    register_fixtures
    load_fixture(:get_profile_components_200)
    profile_components = Cropster::ProfileComponent
      .new(cropster_client)
      .profile_components()

    assert_equal 4, profile_components.size
    assert_equal "PaV", profile_components.first.id
  end

  def register_fixtures
    url = fixture_url("profileComponents/6XdV8")
    register_fixture(:get_profile_component_200, :get, url)
    url = fixture_url("profileComponents?filter[profileComponents][profile][group]=CROR")
    register_fixture(:get_profile_components_200, :get, url)
  end
end
