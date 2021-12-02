# Converts a Hash into a Cropster::SensorialSession object

module Cropster::Response
  class SensorialSession < Cropster::Response::FormattedResponseItem
    attr_accessor :id_tag, :name, :code_type, :codes, :evaluators, :is_active,
      :is_blind, :lab, :schedule_date, :sensorial_qc_count, :sensorial_qc_order, :state

    def load_attributes(attributes)
      return if attributes.nil?

      @id_tag = attributes["idTag"]
      @name = attributes["name"]
      @code_type = attributes["codeType"]
      @codes = attributes["codes"]
      @evaluators = attributes["evaluators"]
      @is_active = attributes["isActive"]
      @is_blind = attributes["isBlind"]
      @lab = attributes["lab"]
      @schedule_date = attributes["scheduleDate"]
      @sensorial_qc_count = attributes["sensorialQcCount"]
      @sensorial_qc_order = attributes["sensorialQcOrder"]
      @state = attributes["state"]
    end
  end
end
