# frozen_string_literal: true

# Converts a Hash into a Cropster::Response::Group object
module Cropster
  module Response
    class Group < Cropster::Response::FormattedResponseItem
      # Attributes
      attr_accessor :name,
        :created_date,
        :is_active,
        :last_modified_date,
        :last_status_change_date,
        :locale,
        :reports,
        :timezone

      # Relationships
      attr_accessor :account_manager_id,
        :contact_id,
        :group_memberships,
        :physical_sheets,
        :product_type_id,
        :projects,
        :sensorial_sheets

      def load_from_data(data)
        super
        load_account_manager(data[:relationships][:accountManager])
        load_contact(data[:relationships][:contact])
        load_group_memberships(data[:relationships][:groupMemberships])
        load_physical_sheets(data[:relationships][:physicalSheets])
        load_product_type(data[:relationships][:productType])
        load_projects(data[:relationships][:projects])
        load_sensorial_sheets(data[:relationships][:sensorialSheets])
      end

      def load_attributes(attributes)
        return if attributes.nil?

        @name = attributes[:name]
        @created_date = load_date(attributes[:createdDate])
        @is_active = attributes[:isActive]
        @last_modified_date = load_date(attributes[:lastModifiedDate])
        @last_status_change_date = load_date(attributes[:lastStatusChangeDate])
        @locale = attributes[:locale]
        @reports = attributes[:reports]
        @timezone = attributes[:timezone]
      end

      private

      def load_account_manager(account_manager)
        return if account_manager.nil? || account_manager[:data].nil?
        @account_manager_id = account_manager[:data][:id]
      end

      def load_contact(contact)
        return if contact.nil? || contact[:data].nil?
        @contact_id = contact[:data][:id]
      end

      def load_group_memberships(group_memberships)
        return if group_memberships.nil? || group_memberships[:data].nil?
        @group_memberships = []
        group_memberships[:data].each do |membership|
          @group_memberships << membership[:id]
        end
      end

      def load_physical_sheets(physical_sheets)
        return if physical_sheets.nil? || physical_sheets[:data].nil?
        @physical_sheets = []
        physical_sheets[:data].each do |sheet|
          @physical_sheets << sheet[:id]
        end
      end

      def load_product_type(product_type)
        return if product_type.nil? || product_type[:data].nil?
        @product_type_id = product_type[:data][:id]
      end

      def load_projects(projects)
        return if projects.nil? || projects[:data].nil?
        @projects = []
        projects[:data].each do |project|
          @projects << project[:id]
        end
      end

      def load_sensorial_sheets(sensorial_sheets)
        return if sensorial_sheets.nil? || sensorial_sheets[:data].nil?
        @sensorial_sheets = []
        sensorial_sheets[:data].each do |sheet|
          @sensorial_sheets << sheet[:id]
        end
      end
    end
  end
end
