#
# Provides an interface to teh SensorialSession API
#

module Cropster
  class SensorialSession < Cropster::Base
    # find a single sensorial session by id
    #
    # @param id [String] the id of the sensorial session
    # @return [Cropster::Response::SensorialSession]
    def sensorial_session(id)
      find_by_id("sensorialSessions", id).first
    end

    def sensorial_sessions(opts = {})
      find_collection("sensorialSessions", opts)
    end

    def process(response)
      Cropster::Response::ResponseHandler
        .new("SensorialSession", data_set(response))
        .compiled_data
    end
  end
end



[
    "adjust_weight_actions",
    "classifications",
    "blend_profile_components",
    "blend_profiles",
    "physical_result_defects",
    "physical_results",
    "physical_sheet_defects",
    "physical_sheets",
    "batch_mixes",
    "batches",
    "facilities",
    "processes",
    "reception_items",
    "receptions",
    "stage_measurement_requirements",
    "stage_record_measurement_requirements",
    "stage_record_measurements",
    "stage_records",
    "stages",
    "orderable_products",
    "production_order_items",
    "production_orders"
]