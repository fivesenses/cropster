# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Processing object
# Represents a roast instance
module Cropster
  module Response
    class Processing < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :duration,
        :end_date,
        :end_weight,
        :notes,
        :start_date,
        :start_weight,
        :worker

      # Relationships
      attr_accessor :lot_id,
        :machine_id,
        :processing_comments,
        :processing_curves,
        :processing_measures,
        :profile_id

      def load_from_data(data)
        super
        load_lot(data[:relationships][:lot])
        load_machine(data[:relationships][:machine])
        load_processing_comments(data[:relationships][:processingComments])
        load_processing_curves(data[:relationships][:processingCurves])
        load_processing_measures(data[:relationships][:processingMeasures])
        load_profile(data[:relationships][:profile])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @duration = attributes[:duration]
        @end_date = load_date(attributes[:endDate])
        @notes = attributes[:notes]
        @start_date = load_date(attributes[:startDate])
        @worker = attributes[:worker]
        
        # Weight attributes
        @end_weight = load_weight(attributes[:endWeight])
        @start_weight = load_weight(attributes[:startWeight])
      end

      # Helper method to calculate total green weight
      def total_green_weight_grams
        start_weight&.grams || 0
      end

      # Helper method to calculate total roasted weight
      def total_roasted_weight_grams
        end_weight&.grams || 0
      end

      # Helper method to calculate weight loss percentage
      def green_to_roasted_weight_loss_percentage
        return 0 if total_green_weight_grams.zero?
        ((1 - total_roasted_weight_grams.to_f / total_green_weight_grams) * 10000).round / 100.0
      end

      private

      def load_lot(lot)
        return if lot.nil? || lot[:data].nil?
        @lot_id = lot[:data][:id]
      end

      def load_machine(machine)
        return if machine.nil? || machine[:data].nil?
        @machine_id = machine[:data][:id]
      end

      def load_processing_comments(processing_comments)
        return if processing_comments.nil? || processing_comments[:data].nil?
        @processing_comments = []
        processing_comments[:data].each do |comment|
          @processing_comments << comment[:id]
        end
      end

      def load_processing_curves(processing_curves)
        return if processing_curves.nil? || processing_curves[:data].nil?
        @processing_curves = []
        processing_curves[:data].each do |curve|
          @processing_curves << curve[:id]
        end
      end

      def load_processing_measures(processing_measures)
        return if processing_measures.nil? || processing_measures[:data].nil?
        @processing_measures = []
        processing_measures[:data].each do |measure|
          @processing_measures << measure[:id]
        end
      end

      def load_profile(profile)
        return if profile.nil? || profile[:data].nil?
        @profile_id = profile[:data][:id]
      end
    end
  end
end
