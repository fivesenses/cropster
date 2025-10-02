# frozen_string_literal: true

# Provides an interface to the Cropster API Project system
#
# https://cropstercore.docs.apiary.io/#reference/production/projects
#
module Cropster
  class Project < Cropster::Base
    # Find a single Project
    #
    # @param id [String] the id of the required Project
    # @return [Cropster::Response::Project]
    def project(id)
      find_by_id("projects", id).first
    end

    # Find a collection of Project objects
    #
    # @param opts [Hash] options to filter the request
    # @return [Array] of Cropster::Response::Project objects
    def projects(opts = {})
      find_collection("projects", opts)
    end

    # Find multiple Project objects by ID's
    #
    # @param ids [String] a comma separated string of ID's (eg "AA,BB")
    # @return [Array] of Cropster::Response::Project objects
    def projects_by_ids(ids)
      find_by_ids("projects", ids)
    end

    # POSTs a new Project to Cropster
    #
    # @param data [Hash] the new Project (name must be unique)
    # @return [Cropster::Response::Project]
    def create_project(data)
      create("projects", data).first
    end

    # Updates an existing Project
    # Supports updating: name (must remain unique), description, isArchived
    # Note: Deletion is not supported; set isArchived to true to remove from active list
    #
    # @param id [String] the ID of the Project to be updated
    # @param data [Hash] containing the fields to be updated
    # @return [Cropster::Response::Project]
    def update_project(id, data)
      update("projects", id, data).first
    end

    # Finds a paginated collection of Project objects
    #
    # @param page_number [Integer] the page number to retrieve (default: 0)
    # @param page_size [Integer] the number of items per page (default: 50)
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Project objects
    def projects_paginated(page_number = 0, page_size = 50, opts = {})
      find_paginated_collection("projects", page_number, page_size, opts)
    end

    # Finds the next page of Project results
    #
    # @param current_page [Integer] the current page number
    # @param opts [Hash] additional options for filtering, sorting, or including relationships
    # @return [Array] An array of Cropster::Response::Project objects
    def projects_next_page(current_page, opts = {})
      find_next_page("projects", current_page, opts)
    end

    # Finds all Projects by iterating through all pages
    # WARNING: This can make many API requests and should be used carefully
    #
    # @param opts [Hash] options for filtering, sorting, or including relationships
    # @param max_pages [Integer] maximum number of pages to fetch (default: nil for all pages)
    # @return [Array] An array of all Cropster::Response::Project objects
    def all_projects(opts = {}, max_pages = nil)
      find_all_pages("projects", opts, max_pages)
    end

    # Process the response from Cropster into appropriate objects
    #
    # @param response [Typhoeus::Response]
    def process(response)
      Cropster::Response::ResponseHandler
        .new("Project", data_set(response))
        .compiled_data
    end
  end
end
