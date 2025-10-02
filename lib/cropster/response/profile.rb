# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Profile object
module Cropster
  module Response
    class Profile < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :batch_size,
        :calculated_weight_change,
        :created_date,
        :erp_id,
        :is_active,
        :is_archived,
        :last_modified_date,
        :new_lot_name,
        :notes,
        :profile_lot_references_last_modified_date,
        :weight_change

      # Relationships
      attr_accessor :group_id,
        :last_processed_lot_id,
        :profile_components,
        :profile_group_id,
        :profile_lot_reference_id,
        :profile_lot_references,
        :project_id,
        :reference_lot_id,
        :reference_lots,
        :restricted_machines

      def load_from_data(data)
        super
        load_group(data[:relationships][:group])
        load_last_processed_lot(data[:relationships][:lastProcessedLot])
        load_profile_components(data[:relationships][:profileComponents])
        load_profile_group(data[:relationships][:profileGroup])
        load_profile_lot_reference(data[:relationships][:profileLotReference])
        load_profile_lot_references(data[:relationships][:profileLotReferences])
        load_project(data[:relationships][:project])
        load_reference_lot(data[:relationships][:referenceLot])
        load_reference_lots(data[:relationships][:referenceLots])
        load_restricted_machines(data[:relationships][:restrictedMachines])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @calculated_weight_change = attributes[:calculatedWeightChange]
        @created_date = load_date(attributes[:createdDate])
        @erp_id = attributes[:erpId]
        @is_active = attributes[:isActive]
        @is_archived = attributes[:isArchived]
        @last_modified_date = load_date(attributes[:lastModifiedDate])
        @new_lot_name = attributes[:newLotName]
        @notes = attributes[:notes]
        @profile_lot_references_last_modified_date = load_date(attributes[:profileLotReferencesLastModifiedDate])
        @weight_change = attributes[:weightChange]
        
        # Measure attributes
        @batch_size = load_weight(attributes[:batchSize])
      end

      private

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_last_processed_lot(last_processed_lot)
        return if last_processed_lot.nil? || last_processed_lot[:data].nil?
        @last_processed_lot_id = last_processed_lot[:data][:id]
      end

      def load_profile_components(profile_components)
        return if profile_components.nil? || profile_components[:data].nil?
        @profile_components = []
        profile_components[:data].each do |component|
          @profile_components << component[:id]
        end
      end

      def load_profile_group(profile_group)
        return if profile_group.nil? || profile_group[:data].nil?
        @profile_group_id = profile_group[:data][:id]
      end

      def load_profile_lot_reference(profile_lot_reference)
        return if profile_lot_reference.nil? || profile_lot_reference[:data].nil?
        @profile_lot_reference_id = profile_lot_reference[:data][:id]
      end

      def load_profile_lot_references(profile_lot_references)
        return if profile_lot_references.nil? || profile_lot_references[:data].nil?
        @profile_lot_references = []
        profile_lot_references[:data].each do |reference|
          @profile_lot_references << reference[:id]
        end
      end

      def load_project(project)
        return if project.nil? || project[:data].nil?
        @project_id = project[:data][:id]
      end

      def load_reference_lot(reference_lot)
        return if reference_lot.nil? || reference_lot[:data].nil?
        @reference_lot_id = reference_lot[:data][:id]
      end

      def load_reference_lots(reference_lots)
        return if reference_lots.nil? || reference_lots[:data].nil?
        @reference_lots = []
        reference_lots[:data].each do |lot|
          @reference_lots << lot[:id]
        end
      end

      def load_restricted_machines(restricted_machines)
        return if restricted_machines.nil? || restricted_machines[:data].nil?
        @restricted_machines = []
        restricted_machines[:data].each do |machine|
          @restricted_machines << machine[:id]
        end
      end
    end
  end
end
