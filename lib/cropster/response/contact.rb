# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Contact object
module Cropster
  module Response
    class Contact < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :id_tag,
        :name,
        :area,
        :association,
        :city,
        :company_name,
        :country,
        :created_date,
        :elevation,
        :email,
        :fax,
        :first_name,
        :gps_location,
        :is_archived,
        :last_modified_date,
        :last_name,
        :mobile,
        :notes,
        :phone,
        :region,
        :state,
        :street,
        :sub_region,
        :website,
        :zip

      # Relationships
      attr_accessor :contact_roles,
        :group_id

      def load_from_data(data)
        super
        load_contact_roles(data[:relationships][:contactRoles])
        load_group(data[:relationships][:group])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @id_tag = attributes[:idTag]
        @name = attributes[:name]
        @association = attributes[:association]
        @city = attributes[:city]
        @company_name = attributes[:companyName]
        @country = attributes[:country]
        @created_date = load_date(attributes[:createdDate])
        @elevation = attributes[:elevation]
        @email = attributes[:email]
        @fax = attributes[:fax]
        @first_name = attributes[:firstName]
        @gps_location = attributes[:gpsLocation]
        @is_archived = attributes[:isArchived]
        @last_modified_date = load_date(attributes[:lastModifiedDate])
        @last_name = attributes[:lastName]
        @mobile = attributes[:mobile]
        @notes = attributes[:notes]
        @phone = attributes[:phone]
        @region = attributes[:region]
        @state = attributes[:state]
        @street = attributes[:street]
        @sub_region = attributes[:subRegion]
        @website = attributes[:website]
        @zip = attributes[:zip]
        
        # Measure attributes
        @area = load_weight(attributes[:area])
      end

      private

      def load_contact_roles(contact_roles)
        return if contact_roles.nil? || contact_roles[:data].nil?
        @contact_roles = []
        contact_roles[:data].each do |role|
          @contact_roles << role[:id]
        end
      end

      def load_group(group)
        return if group.nil? || group[:data].nil?
        @group_id = group[:data][:id]
      end
    end
  end
end
