# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Batches object
module Cropster
  module Response
    class Batches < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :id_tag,
        :active,
        :crop_year,
        :final_weight,
        :final_weight_override,
        :harvest_date,
        :intermediate_weight,
        :intermediate_weight_source_override,
        :intermediate_weight_target_override,
        :is_piled,
        :milling_date,
        :notes,
        :part,
        :received_weight,
        :received_weight_override,
        :reception_date,
        :storage_date

      # Relationships
      attr_accessor :batch_mix_id,
        :community_id,
        :facility_id,
        :farm_id,
        :field_id,
        :group_id,
        :process_id,
        :project_id,
        :reception_id,
        :sample_id,
        :stage_records,
        :varieties

      def load_from_data(data)
        super
        load_batch_mix(data[:relationships][:batchMix])
        load_community(data[:relationships][:community])
        load_facility(data[:relationships][:facility])
        load_farm(data[:relationships][:farm])
        load_field(data[:relationships][:field])
        load_group(data[:relationships][:group])
        load_process(data[:relationships][:process])
        load_project(data[:relationships][:project])
        load_reception(data[:relationships][:reception])
        load_sample(data[:relationships][:sample])
        load_stage_records(data[:relationships][:stageRecords])
        load_varieties(data[:relationships][:varieties])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @id_tag = attributes[:idTag]
        @active = attributes[:active]
        @crop_year = attributes[:cropYear]
        @harvest_date = load_date(attributes[:harvestDate])
        @is_piled = attributes[:isPiled]
        @milling_date = load_date(attributes[:millingDate])
        @notes = attributes[:notes]
        @part = attributes[:part]
        @reception_date = load_date(attributes[:receptionDate])
        @storage_date = load_date(attributes[:storageDate])
        
        # Weight attributes
        @final_weight = load_weight(attributes[:finalWeight])
        @final_weight_override = load_weight(attributes[:finalWeightOverride])
        @intermediate_weight = load_weight(attributes[:intermediateWeight])
        @intermediate_weight_source_override = load_weight(attributes[:intermediateWeightSourceOverride])
        @intermediate_weight_target_override = load_weight(attributes[:intermediateWeightTargetOverride])
        @received_weight = load_weight(attributes[:receivedWeight])
        @received_weight_override = load_weight(attributes[:receivedWeightOverride])
      end

      private

      def load_batch_mix(batch_mix)
        return if batch_mix.nil? || batch_mix[:data].nil?
        @batch_mix_id = batch_mix[:data][:id]
      end

      def load_community(community)
        return if community.nil? || community[:data].nil?
        @community_id = community[:data][:id]
      end

      def load_facility(facility)
        return if facility.nil? || facility[:data].nil?
        @facility_id = facility[:data][:id]
      end

      def load_farm(farm)
        return if farm.nil? || farm[:data].nil?
        @farm_id = farm[:data][:id]
      end

      def load_field(field)
        return if field.nil? || field[:data].nil?
        @field_id = field[:data][:id]
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end

      def load_process(process)
        return if process.nil? || process[:data].nil?
        @process_id = process[:data][:id]
      end

      def load_project(project)
        return if project.nil? || project[:data].nil?
        @project_id = project[:data][:id]
      end

      def load_reception(reception)
        return if reception.nil? || reception[:data].nil?
        @reception_id = reception[:data][:id]
      end

      def load_sample(sample)
        return if sample.nil? || sample[:data].nil?
        @sample_id = sample[:data][:id]
      end

      def load_stage_records(stage_records)
        return if stage_records.nil? || stage_records[:data].nil?
        @stage_records = []
        stage_records[:data].each do |stage_record|
          @stage_records << stage_record[:id]
        end
      end

      def load_varieties(varieties)
        return if varieties.nil? || varieties[:data].nil?
        @varieties = []
        varieties[:data].each do |variety|
          @varieties << variety[:id]
        end
      end
    end
  end
end
