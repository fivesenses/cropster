##
# Converts a Hash into a Cropster::Response::ProcessingComment
#
module Cropster::Response
  class ProcessingComment < Cropster::Response::FormattedResponseItem
    attr_accessor :note, :created_at, :time, :event, :processing_id

    def load_from_data(data)
      super(data)
      load_processing(data[:relationships][:processing])
    end

    def load_attributes(attributes)
      return if attributes.nil?

      @note = attributes[:note]
      @created_at = load_date(attributes[:createdDate])
      @event = attributes[:event]
      @time = load_time(attributes[:time])
    end

    def load_processing(processing)
      return if processing.nil?
      return if processing[:data].nil?

      @processing_id = processing[:data][:id]
    end
  end
end
