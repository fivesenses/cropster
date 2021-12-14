require "test_helper"

class Cropster::SensorialQcTest < Test::Unit::TestCase
  test "should load SensorialQC Array" do
    register_fixtures
    load_fixture(:get_sensorial_qcs_200)
    sensorial_qcs = Cropster::SensorialQc.new(cropster_client).sensorial_qcs({})
    assert_equal 4, sensorial_qcs.length
    assert_equal "vpvZ", sensorial_qcs.first.id
  end

  test "should load a sensorialQC" do
    register_fixtures
    load_fixture(:get_sensorial_qc_200)
    sensorial_qc = Cropster::SensorialQc.new(cropster_client).sensorial_qc("AAAA")
    assert_equal "id", sensorial_qc.id
  end

  def register_fixtures
    url = fixture_url("sensorialQcs?filter%5BsensorialQcs%5D%5Bgroup%5D=CROR")
    register_fixture(:get_sensorial_qcs_200, :get, url)

    url = fixture_url("sensorialQcs/AAAA")
    register_fixture(:get_sensorial_qc_200, :get, url)
  end
end
