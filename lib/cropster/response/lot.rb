# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Lot object
module Cropster
  module Response
    class Lot < Cropster::Response::FormattedResponseItem
      attr_accessor :id_tag,
        :name,
        :accepted,
        :created_at,
        :consumed_at,
        :location,
        :weight,
        :price,
        :project,
        :initial_weight,
        :tracking_number,
        :grade,
        :sales_number,
        :notes,
        :processing_step,
        :purchase_order_number,
        :source_contacts,
        :processing_methods,
        :arrived_at,
        :countries_of_origin,
        :crop_year,
        :shipping_container_number,
        :low_stock_threshold,
        :estimated_number_of_weeks_until_running_out,
        :has_running_out_estimation,
        :processing_id,
        :latest_sensorial_qc_id,
        :sensorial_qcs,
        :erp_id,
        :expected_weight,
        :ico_number,
        :is_active,
        :is_sample,
        :last_modified_at,
        :price_base_unit,
        :rating_notes,
        :sample_type,
        :unbalanced_weight

      attr_accessor :destination_lots,
        :latest_sample_group_sensorial_qc_id,
        :latest_sensorial_qc_of_root_lots_id,
        :source_batch_id,
        :source_batch_mix_id,
        :source_lots,
        :used_in_profiles,
        :blend_profile_id,
        :certificates,
        :classification_id,
        :group_id,
        :physical_results,
        :varieties

      def load_from_data(data)
        super
        load_processing(data[:relationships][:processing])
        load_project(data[:relationships][:project])
        load_location(data[:relationships][:location])
        load_latest_sensorial_qc(data[:relationships][:latestSensorialQc])
        load_latest_sample_group_sensorial_qc(data[:relationships][:latestSampleGroupSensorialQc])
        load_latest_sensorial_qc_of_root_lots(data[:relationships][:latestSensorialQcOfRootLots])
        load_sensorial_qcs(data[:relationships][:sensorialQcs])
        load_source_batch(data[:relationships][:sourceBatch])
        load_source_batch_mix(data[:relationships][:sourceBatchMix])
        load_source_contacts(data[:relationships][:sourceContacts])
        load_source_lots(data[:relationships][:sourceLots])
        load_destination_lots(data[:relationships][:destinationLots])
        load_used_in_profiles(data[:relationships][:usedInProfiles])
        load_blend_profile(data[:relationships][:blendProfile])
        load_certificates(data[:relationships][:certificates])
        load_classification(data[:relationships][:classification])
        load_group(data[:relationships][:group])
        load_physical_results(data[:relationships][:physicalResults])
        load_varieties(data[:relationships][:varieties])
      end

      def load_attributes(attributes)
        return if attributes.nil?
        @is_sample = attributes[:isSample]
        @is_active = attributes[:isActive]
        @id_tag = attributes[:idTag]
        @tracking_number = attributes[:trackingNumber]
        @name = attributes[:name]
        @accepted = attributes[:accepted]
        @notes = attributes[:notes]
        @sales_number = attributes[:salesNumber]
        @grade = attributes[:grade]
        @processing_step = attributes[:processingStep]
        @purchase_order_number = attributes[:purchaseOrderNumber]
        @created_at = load_date(attributes[:creationDate])
        @last_modified_at = load_date(attributes[:lastModifiedDate])
        @consumed_at = load_date(attributes[:consumedDate])
        @weight = load_weight(attributes[:actualWeight])
        @initial_weight = load_weight(attributes[:initialWeight])
        @expected_weight = load_weight(attributes[:expectedWeight])
        @unbalanced_weight = load_weight(attributes[:unbalancedWeight])
        @price = load_price(attributes[:price], attributes[:priceBaseUnit])
        @price_base_unit = load_weight(attributes[:priceBaseUnit])
        @arrived_at = load_date(attributes[:arrivalDate])
        @source_contacts = attributes[:sourceContacts]
        @processing_methods = attributes[:processingMethods]
        @countries_of_origin = attributes[:countriesOfOrigin]
        @crop_year = attributes[:cropYear]
        @erp_id = attributes[:erpId]
        @ico_number = attributes[:icoNumber]
        @rating_notes = attributes[:ratingNotes]
        @sample_type = attributes[:sampleType]
        @shipping_container_number = attributes[:shippingContainerNumber]
        @low_stock_threshold = load_weight(attributes[:lowStockThreshold])
        @estimated_number_of_weeks_until_running_out = attributes[:estimatedNumberOfWeeksUntilRunningOut]
        @has_running_out_estimation = attributes[:hasRunningOutEstimation]
      end

      def load_latest_sensorial_qc(sensorial_qcs)
        return if sensorial_qcs[:data].nil?

        @latest_sensorial_qc_id = sensorial_qcs[:data][:id]
      end

      def load_processing(processings)
        return if processings.nil?
        return if processings[:data].nil?

        @processing_id = processings[:data][:id]
      end

      def load_project(project)
        return if project.nil?
        return if project[:data].nil?

        @project = project[:data][:id]
      end

      def load_location(location)
        return if location.nil?
        return if location[:data].nil?

        @location = location[:data][:id]
      end

      def load_sensorial_qcs(sensorial_qcs)
        return if sensorial_qcs.nil?
        return if sensorial_qcs[:data].nil?

        @sensorial_qcs = []
        sensorial_qcs[:data].each do |sensorial_qc|
          @sensorial_qcs << sensorial_qc[:id]
        end
      end

      def fairtrade?
        @certifications.join(" ").downcase.include?("fairtrade")
      end

      def sourced_weight_grams
        sources.sum { |s| s.weight.grams } + initial_weight.grams
      end

      def name_ico_separators
        @name.gsub(/[?a-zA-Z0-9 ]/, "")
      end

      def name_raw_ico_component
        @name.gsub(/[?a-z,A-Z]/, "").split(" ").last.presence || ""
      end

      def name_sans_ico
        n = ico.present? ? name.gsub("[#{name_raw_ico_component}]", "").gsub(name_raw_ico_component, "") : name
        n.gsub("Organic", "").gsub("ORGANIC", "")
      end

      def organic?
        @certifications.join(" ").downcase.include?("organic")
      end

      def ico
        if @name.include?("[") && @name.include?("]")
          @name.gsub(/^(.+?)\[/, "").gsub(/[.+?\]]*/, "")
        elsif name_ico_separators.size >= 2
          name_raw_ico_component.tr("/", "-").gsub("--", "-")
        else
          ""
        end
      end

      def load_latest_sample_group_sensorial_qc(sensorial_qcs)
        return if sensorial_qcs.nil?
        return if sensorial_qcs[:data].nil?

        @latest_sample_group_sensorial_qc_id = sensorial_qcs[:data][:id]
      end

      def load_latest_sensorial_qc_of_root_lots(sensorial_qcs)
        return if sensorial_qcs.nil?
        return if sensorial_qcs[:data].nil?

        @latest_sensorial_qc_of_root_lots_id = sensorial_qcs[:data][:id]
      end

      def load_source_batch(source_batch)
        return if source_batch.nil?
        return if source_batch[:data].nil?

        @source_batch_id = source_batch[:data][:id]
      end

      def load_source_batch_mix(source_batch_mix)
        return if source_batch_mix.nil?
        return if source_batch_mix[:data].nil?

        @source_batch_mix_id = source_batch_mix[:data][:id]
      end

      def load_source_contacts(source_contacts)
        return if source_contacts.nil?
        return if source_contacts[:data].nil?

        @source_contacts = []
        source_contacts[:data].each do |source_contact|
          @source_contacts << source_contact[:id]
        end
      end

      def load_source_lots(source_lots)
        return if source_lots.nil?
        return if source_lots[:data].nil?

        @source_lots = []
        source_lots[:data].each do |source_lot|
          @source_lots << source_lot[:id]
        end
      end

      def load_destination_lots(destination_lots)
        return if destination_lots.nil?
        return if destination_lots[:data].nil?

        @destination_lots = []
        destination_lots[:data].each do |destination_lot|
          @destination_lots << destination_lot[:id]
        end
      end

      def load_used_in_profiles(used_in_profiles)
        return if used_in_profiles.nil?
        return if used_in_profiles[:data].nil?

        @used_in_profiles = []
        used_in_profiles[:data].each do |profile|
          @used_in_profiles << profile[:id]
        end
      end

      def load_blend_profile(blend_profile)
        return if blend_profile.nil?
        return if blend_profile[:data].nil?

        @blend_profile_id = blend_profile[:data][:id]
      end

      def load_certificates(certificates)
        return if certificates.nil?
        return if certificates[:data].nil?

        @certificates = []
        certificates[:data].each do |certificate|
          @certificates << certificate[:id]
        end
      end

      def load_classification(classification)
        return if classification.nil?
        return if classification[:data].nil?

        @classification_id = classification[:data][:id]
      end

      def load_group(group)
        return if group.nil?
        return if group[:data].nil?

        @group_id = group[:data][:id]
      end

      def load_physical_results(physical_results)
        return if physical_results.nil?
        return if physical_results[:data].nil?

        @physical_results = []
        physical_results[:data].each do |result|
          @physical_results << result[:id]
        end
      end

      def load_varieties(varieties)
        return if varieties.nil?
        return if varieties[:data].nil?

        @varieties = []
        varieties[:data].each do |variety|
          @varieties << variety[:id]
        end
      end
    end
  end
end
