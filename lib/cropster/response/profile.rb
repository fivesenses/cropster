##
# Converts a Hash into a Cropster::Response::Profile object
#
module Cropster::Response
  class Profile < Cropster::Response::FormattedResponseItem
    attr_accessor :batch_size, :calculated_weight_change,
      :created_at, :erp_id, :is_active, :is_archived, :last_modified_at,
      :name, :new_lot_name, :notes, :profile_lot_references_last_modified_at,
      :weight_change, :profile_components

    def load_from_data(data)
      super
      load_profile_components(data[:relationships][:profileComponents])
    end

    def load_attributes(attributes)
      return if attributes.nil?
      @batch_size = load_weight(attributes[:batchSize])
      @calculated_weight_change = attributes[:calculatedWeightChange]
      @created_at = load_date(attributes[:createdDate])
      @erp_id = attributes[:erpId]
      @is_active = attributes[:isActive]
      @is_archived = attributes[:isArchived]
      @last_modified_at = load_date(attributes[:lastModifiedDate])
      @name = attributes[:name]
      @new_lot_name = attributes[:newLotName]
      @notes = attributes[:notes]
      @profile_lot_references_last_modified_at =
        load_date(attributes[:profileLotReferencesLastModifiedDate])
      @weight_change = attributes[:weightChange]
    end

    def load_profile_components(profile_components)
      return if profile_components.nil?
      return if profile_components[:links].nil?

      @profile_components = profile_components[:links][:related]
    end
  end
end
