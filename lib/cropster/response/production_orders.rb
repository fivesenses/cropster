##
# Converts a Hash into a Cropster::Response::User object
#
module Cropster::Response
  class ProductionOrders < Cropster::Response::FormattedResponseItem
    attr_accessor  :id_tag, :created, :customer, :customer_type, :external_id, :externa_reference, :external_status, :is_archived, :is_status_manually_changed, :last_modified_date, :last_status_change_date, :order_date, :sales_person, :status

    def load_attributes(attributes)
      return if attributes.nil?
      @id_tag = attributes[:idTag]
      @created = attributes[:created]
      @customer = attributes[:customer]
      @customer_type = attributes[:customerType]
      @external_id = attributes[:externalId]
      @externa_reference = attributes[:externaReference]
      @external_status = attributes[:externalStatus]
      @is_archived = attributes[:isArchived]
      @is_status_manually_changed = attributes[:isStatusManuallyChanged]
      @last_modified_date = attributes[:lastModifiedDate]
      @last_status_change_date = attributes[:lastStatusChangeDate]
      @order_date = attributes[:orderDate]
      @sales_person = attributes[:salesPerson]
      @status = attributes[:status]      
    end
  end
end
  