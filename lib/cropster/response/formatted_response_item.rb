##
# The parent class for the various Cropster::Response classes
#
module Cropster
  module Response
    class FormattedResponseItem
      attr_accessor :id, :name, :type, :link, :source_contacts, :contact, :contact_role, :projects, :varieties, :groups, :certificates, :alerts, :locations, :processings, :machines, :profiles, :lot, :lots, :processing, :profile_components, :sensorial_qc, :sensorial_qcs, :sensorial_results, :sensorial_result_items, :sensorial_sheets, :sensorial_sheet_items, :sensorial_sheet_items_path,  :sensorial_sessions, :path

      # Constructor
      # @param data [Hash] the data to convert into a Cropster::Response subclass
      def initialize(data)
        puts "#{data} init res"
        @sources = []
        @certifications = []
        load_from_data(data)
      end



      # Copies the data from the Hash into the object attributes
      # @param data [Hash]
      def load_from_data(data, nothing = {})
        puts "nothing "
        @id = data[:id]
        @type = data[:type]
        load_attributes(data[:attributes])
        load_relationships(data[:relationships])
        load_links(data[:links])
      end

      # Placeholder function to be overridden
      def load_attributes(attributes)
      end

      # Loads any referential link for the object in question
      # @param links [Hash]
      def load_links(links)
        return if links.nil?
        return if links[:self].nil?
        @link = links[:self]
      end

      # Parses the relationships Hash
      # @param relationships [Hash] the hash returned with the object attributes
      def load_relationships(relationships)
        relationships = Cropster::Response::Relationship.new(relationships).result
        @alerts = relationships[:alerts]
        @certificates = relationships[:certificates]
        @contact = relationships[:contact]
        @contact_role = relationships[:contactRole]
        @groups = relationships[:groups]
        @locations = relationships[:locations]
        @lots = relationships[:lots]
        @machines = relationships[:machines]
        @processings = relationships[:processings]
        @processing = relationships[:processing] # if relationships.has_key?(:processing)
        @profiles = relationships[:profiles]
        @profile_components = relationships[:profileComponents]
        @projects = relationships[:projects]
        @sensorial_qcs = relationships[:sensorialQCs]
        @sensorial_qc = relationships[:sensorialQc]
        @sensorial_results = relationships[:sensorialResults]
        @sensorial_result_items = relationships[:sensorialResultItems]
        @sensorial_sheets = relationships[:sensorialSheets]
        @sensorial_sheet_items = relationships[:sensorialSheetItems]
        @sensorial_sessions = relationships[:sensorialSessions]
        @source_contacts = relationships[:source_contacts]
        @varieties = relationships[:varieties]

        @lot = load_lot(relationships[:lot])
      end

      def load_lot(lot)
        return if lot.nil?

        @lot_id = lot[:data][:id]
      end

      def load_sensorial_qc(sensorial_qc)
        return if sensorial_qc.nil?
        return if sensorial_qc[:data].nil?

        @sensorial_qc_id = sensorial_qc[:data][:id]
      end

      def load_sensorial_session(sensorial_session)
        return if sensorial_session.nil?
        return if sensorial_session[:data].nil?

        @sensorial_session_id = sensorial_session[:data][:id]
      end

      def load_sensorial_sheet(sensorial_sheet)
        return if sensorial_sheet.nil?
        return if sensorial_sheet[:data].nil?

        @sensorial_sheet_id = sensorial_sheet[:data][:id]
      end


      def load_sensorial_result_path(url)
        puts url
        @sensorial_sheet_items_path = url
      
      end


      def load_path(url)
        @path = url
      end

      def load_sensorial_sheet_items(sensorial_sheet_items)
        return [] if sensorial_sheet_items.nil?
        return [] if sensorial_sheet_items[:data].nil?

        @sensorial_sheet_items = []
        sensorial_sheet_items[:data].each do |item|
        @sensorial_sheet_items << Cropster::Response::SensorialSheetItem.new(item)
        end
      end

      def load_sensorial_results(sensorial_results)
        return if sensorial_results.nil?
        return if sensorial_results[:data].nil?

        @sensorial_result_id = sensorial_results[:data][:id]
      end

      def load_sensorial_result_items(sensorial_result_items)
        return [] if sensorial_result_items.nil?
        return [] if sensorial_result_items[:data].nil?

        @sensorial_result_items = []
        sensorial_result_items[:data].each do |item|
          @sensorial_result_items << Cropster::Response::SensorialResultItem.new(item)
        end
      end

      def load_project(data)
        return if data[:data].nil?
        @project = Cropster::Response::Project.new(data[:data])
      end

      def load_certificates(data)
        return if data[:data].nil?
        # @certifications = data[:certifications]
      end

      def load_sources(data)
        return if data.empty?
        data.each do |source_data|
          @sources << Cropster::Response::Source.new(source_data)
        end
      end

      def load_date(date)
        return nil if date.nil?
        Time.at(date.to_i / 1000).utc
      end

      def load_time(time)
        time.to_i / 1000
      end

      def load_values(values)
        result = []
        values.each do |value|
          result << {
            time: load_time(value[:time]),
            value: value[:value]
          }
        end
        result
      end

      # Converts the price Hash to a Cropster::Response::Price object
      # @param data [Hash] the price data
      # @param base_data [Hash] information about the currency
      # @return Cropster::Response::Price
      def load_price(data, base_data)
        Cropster::Response::Price.new(data, base_data)
      end

      # Converts the weight Hash to a Cropster::Response::Weight object
      # @param attributes [Hash] the weight data
      # @return Cropster::Response::Weight
      def load_weight(attributes)
        Cropster::Response::Weight.new(attributes)
      end

      # Converts the parent relationship hash into to Cropster::Response::Parent object
      # @param relationship [Hash] the relationship data {id: string | null}
      # @return Cropster::Response::Parent
      def load_parent(data)
        Cropster::Response::Parent.new(data)
      end
    end
  end
end
