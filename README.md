# Cropster

Ruby gem for the Cropster API. Supports all documented API entities with full CRUD operations, pagination, and rate limiting.

## Installation

Add this line to your application's Gemfile:

    gem 'cropster'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cropster

## Configuration

Setup client:

    client = Cropster::Client.new({
      api_key:    ENV['CROPSTER_API_KEY'],
      api_secret: ENV['CROPSTER_API_SECRET'],
      group_code: ENV['CROPSTER_GROUP_CODE']
    })

Optional initialization parameters:

    test_mode: (true | false)
    api_path: "api/v2"
    user_agent: "YourApp-Cropster-Integration"
    rate_limit: (true | false) # default: true
    requests_per_minute: 120 # default: 120

## Usage

### Basic Operations

All entities support standard CRUD operations where documented by the API:

    # Get single entity
    Cropster::Lot.new(client).lot("ID")
    
    # Get collection
    Cropster::Lot.new(client).lots
    
    # Get multiple by IDs
    Cropster::Lot.new(client).lots_by_ids("ID1,ID2,ID3")
    
    # Create (where supported)
    Cropster::Lot.new(client).create_lot(data)
    
    # Update (where supported)
    Cropster::Lot.new(client).update_lot("ID", data)
    
    # Delete (where supported)
    Cropster::Lot.new(client).delete_lot("ID")

### Pagination

    # Get specific page
    Cropster::Lot.new(client).lots_paginated(0, 50)
    
    # Get next page
    Cropster::Lot.new(client).lots_next_page(current_page)
    
    # Get all (use carefully)
    Cropster::Lot.new(client).all_lots({}, max_pages: 10)

### Filtering and Options

    # Filter results
    Cropster::Lot.new(client).lots(filter: {lots: {processingStep: "GREEN"}})
    
    # Include relationships
    Cropster::Lot.new(client).lots(include: {lots: "project,location"})
    
    # Sort results
    Cropster::Lot.new(client).lots(sort: {lots: {name: "asc"}})

## Supported Entities

### Accounts
- ContactRoles, Contacts, GroupMemberships, Groups, Locations, Users

### Order
- OrderableProducts, ProductionOrderItems, ProductionOrders

### Origin
- BatchMixes, Batches, Facilities, Processes, ReceptionItems, Receptions
- StageMeasurementRequirements, StageRecordMeasurementRequirements, StageRecordMeasurements, StageRecords, Stages

### Physical
- PhysicalResultDefects, PhysicalResults, PhysicalSheetDefects, PhysicalSheets

### Processing
- BlendProfileComponents, BlendProfiles, Machines, ProcessingComments, ProcessingCurves, ProcessingMeasures, Processing

### Production
- AdjustWeightActions, Certificates, Lots, ProductTypes, ProfileComponents, ProfileGroups, ProfileLotReferences, Profiles, Projects, SourceContacts, Varieties

### Quality
- Classifications, Flavors, SensorialDescriptors, SensorialQcs, SensorialResultItems, SensorialResults, SensorialSessions, SensorialSheetItems, SensorialSheets

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cropster/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
