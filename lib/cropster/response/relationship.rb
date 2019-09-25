##
# Converts a Hash into a Cropster::Response::Relationship object
#
module Cropster::Response
  class Relationship
    attr_accessor :result

    def initialize(data)
      @result = {
        source_contacts: [],
        sensorial_qcs: [],
        projects: [],
        varieties: [],
        groups: [],
        certificates: [],
        alerts: [],
        locations: [],
        processings: [],
        machines: [],
        profiles: [],
        lots: []
      }
      return if data.nil?
      load_relationships(data)
    end

    def load_relationships(data)
      load_data(data[:variety], :varieties) unless data[:variety].blank?
      load_data(data[:sourceContacts], :source_contacts) unless data[:sourceContacts].blank?
      load_data(data[:latestSensorialQc], :sensorial_qcs)
      load_data(data[:project], :projects)
      load_data(data[:group], :groups)
      load_data(data[:certificates], :certificates)
      load_data(data[:alerts], :alerts)
      load_data(data[:location], :locations)
      load_data(data[:processing], :processings)
      load_data(data[:machine], :machines)
      load_data(data[:profile], :profiles)
      load_data(data[:lot], :lots)
    end

    def load_data(data, key)
      relationship_data = Cropster::Response::RelationshipData.new(data)
      relationship_data.process
      @result[key] = relationship_data.processed_data
    end
  end
end
