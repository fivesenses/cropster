require "test_helper"

class Cropster::LotTest < Test::Unit::TestCase
  def test_lot_success
    register_fixtures
    load_fixture(:get_lot_success)
    lot = Cropster::Lot.new(cropster_client).lot("AA")
    assert_equal "Risaralda-Decaf-T10-2019/20-4-CO", lot.name
    assert_equal [], lot.source_contacts
    assert lot.weight.is_a?(Cropster::Response::Weight)
    assert lot.created_at.is_a?(Time)
    # assert lot.consumed_at.is_a?(Time)
    # assert lot.arrived_at.is_a?(Time)
    assert lot.low_stock_threshold.is_a?(Cropster::Response::Weight)
    assert_equal 2.22, lot.price.amount
    assert_equal "USD", lot.price.currency
    assert_equal 28.0, lot.initial_weight.amount
    assert_equal "BAG35KG", lot.initial_weight.unit
    assert_equal 1.857, lot.weight.amount
    assert_equal 0, lot.low_stock_threshold.amount
    assert_equal "PG-1082", lot.id_tag
    assert_equal ["FULLY_WASHED"], lot.processing_methods
    assert_equal nil, lot.crop_year
    assert_equal "4", lot.shipping_container_number
    assert_equal ["CO"], lot.countries_of_origin
    assert lot.has_running_out_estimation
    assert_equal "MYDN", lot.project
    assert_equal "EMZ0", lot.location
  end

  def test_lots_success
    register_fixtures
    load_fixture(:get_lots_success)
    lots = Cropster::Lot.new(cropster_client).lots
    assert_equal 2, lots.length
  end

  def test_lots_failure
    register_fixtures
    load_fixture(:get_lots_failure)
    assert_raise CropsterUnavailableError do
      Cropster::Lot.new(cropster_client).lots
    end
  end

  # def test_lots_by_ids_success
  #   register_fixtures
  #   load_fixture(:get_lots_by_ids_success)
  #   lots = Cropster::Lot.new(cropster_client).lots_by_ids("AA,BB")
  #   assert_equal 2, lots.length
  # end

  def test_create_lot_success
    register_fixtures
    load_fixture(:post_lot_success)
    lot = Cropster::Lot.new(cropster_client).create_lot(valid_post_data)
    assert_not_nil lot
    assert_match(/Yirgacheffe/, lot.name)
  end

  def test_update_lot_success
    register_fixtures
    load_fixture(:patch_lot_success)
    lot = Cropster::Lot.new(cropster_client).update_lot("0GQ", valid_patch_data)
    assert_not_nil lot
    assert_match(/Getting renamed/, lot.name)
  end

  def register_fixtures
    url = fixture_url("lots/AA")
    register_fixture(:get_lot_success, :get, url)
    url = fixture_url("lots?filter[lots][group]=CROR")
    register_fixture(:get_lots_success, :get, url)
    register_fixture(:get_lots_failure, :get, url)
    url = fixture_url("lots/AA,BB")
    register_fixture(:get_lots_by_ids_success, :get, url)
    url = fixture_url("lots/")
    register_fixture(:post_lot_success, :post, url)
    url = fixture_url("lots/0GQ")
    register_fixture(:patch_lot_success, :patch, url)
  end

  def valid_patch_data
    {
      "data": {
        "type": "lots",
        "id": "0GQ",
        "attributes": {
          "name": "Getting renamed",
          "accepted": "accepted"
        },
        "relationships": {
          "variety": {
            "data": {
              "type": "varieties",
              "id": "AA"
            }
          }
        }
      }
    }
  end

  def valid_post_data
    {
      "data": {
        "type": "lots",
        "attributes": {
          "actualWeight": {
            "amount": 100,
            "unit": "KG"
          },
          "processingStep": "coffee.green",
          "name": "Yirgacheffe Test Sample",
          "isSample": true,
          "lowStockThreshold": {
            "weight": 10,
            "unit": "KG"
          }
        },
        "relationships": {
          "group": {
            "data": {
              "type": "groups",
              "id": "CROP"
            }
          }
        }
      }
    }
  end
end
