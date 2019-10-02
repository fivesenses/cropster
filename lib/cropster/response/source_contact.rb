##
# Converts the response from the Cropster API into a Cropster::Response
#
module Cropster::Response
  class SourceContact < Cropster::Response::FormattedResponseItem
    attr_accessor :contact_id, :contact_type, :contact_role_id,
      :contact_role_type, :lot_id, :lot_type, :contact, :lot, :contact_role

    def load_from_data(data)
      return if data.nil?
      @id = data[:id]
      @type = data[:type]
      load_relationships(data[:relationships])
      load_links(data[:links])
    end

    # Parses the relationships Hash
    # @param relationships [Hash] the hash returned with the object attributes
    def load_relationships(relationships)
      @contact = relationships[:contact]
      @lot = relationships[:lot]
      @contact_role = relationships[:contactRole]
      load_contact(@contact)
      load_lot(@lot)
      load_contact_role(@contact_role)
    end

    def load_attributes(attributes)
      return if attributes.nil?
    end

    def load_contact(contact)
      @contact_id = contact[:data][:id]
      @contact_type = contact[:data][:type]
    end

    def load_lot(lot)
      @lot_id = lot[:data][:id]
      @lot_type = lot[:data][:type]
    end

    def load_contact_role(contact_role)
      @contact_role_id = contact_role[:data][:id]
      @contact_role_type = contact_role[:data][:type]
    end
  end
end
