# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Lot object
module Cropster
  module Response
    class Lot < Cropster::Response::FormattedResponseItem
      attr_accessor :id_tag, :name, :created_at, :consumed_at,
        :location, :weight, :price, :project,
        :initial_weight, :tracking_number, :grade, :sales_number,
        :notes, :processing_step, :purchase_order_number,
        :source_contacts, :processing_methods, :arrived_at,
        :countries_of_origin, :crop_year, :shipping_container_number,
        :low_stock_threshold, :estimated_number_of_weeks_until_running_out,
        :has_running_out_estimation, :processing_id, :sensorial_qc_id

      def load_from_data(data)
        super
        load_processing(data[:relationships][:processing])
        load_sensorial_qc(data[:relationships][:latestSensorialQc])
        load_project(data[:relationships][:project])
        load_location(data[:relationships][:location])
      end

      def load_attributes(attributes)
        return if attributes.nil?
        @is_sample = attributes[:isSample]
        @id_tag = attributes[:idTag]
        @tracking_number = attributes[:trackingNumber]
        @name = attributes[:name]
        @notes = attributes[:notes]
        @sales_number = attributes[:salesNumber]
        @grade = attributes[:grade]
        @processing_step = attributes[:processingStep]
        @purchase_order_number = attributes[:purchaseOrderNumber]
        @created_at = load_date(attributes[:creationDate])
        @consumed_at = load_date(attributes[:consumedDate])
        @weight = load_weight(attributes[:actualWeight])
        @initial_weight = load_weight(attributes[:initialWeight])
        @price = load_price(attributes[:price], attributes[:priceBaseUnit])
        @arrived_at = load_date(attributes[:arrivalDate])
        @source_contacts = attributes[:sourceContacts]
        @processing_methods = attributes[:processingMethods]
        @countries_of_origin = attributes[:countriesOfOrigin]
        @crop_year = attributes[:cropYear]
        @shipping_container_number = attributes[:shippingContainerNumber]
        @low_stock_threshold = load_weight(attributes[:lowStockThreshold])
        @estimated_number_of_weeks_until_running_out = attributes[:estimatedNumberOfWeeksUntilRunningOut]
        @has_running_out_estimation = attributes[:hasRunningOutEstimation]
      end

      def load_sensorial_qc(sensorial_qcs)
        return if sensorial_qcs[:data].nil?

        @sensorial_qc_id = sensorial_qcs[:data][:id]
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
    end
  end
end
