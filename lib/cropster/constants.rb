##
# A number of constants required throughout the Cropster module
#
module Cropster
  API_PATH = "/api/v2"
  SERVER_TEST = "https://private-anon-e2e6946d27-cropstercore.apiary-mock.com"
  SERVER_PRODUCTION = "https://c-sar.cropster.com"

  # Lot Acceptance Types
  LOT_ACCEPTANCE_TYPES = %w[accepted declined notRated].freeze

  # Sample Types
  SAMPLE_TYPES = %w[TYPE_SAMPLE OFFER SPOT_OFFER PRE_SHIPMENT ARRIVAL EVALUATION].freeze

  # Processing Steps
  PROCESSING_STEPS = %w[coffee.cherry coffee.dry_cherry coffee.wet_parchment coffee.parchment coffee.wet_green coffee.raw_green coffee.green coffee.roasting].freeze

  # Processing Methods
  PROCESSING_METHODS = %w[NATURAL FULLY_WASHED SEMI_WASHED PULPED_NATURAL HONEY WET_HULLED MISC OTHER].freeze

  # Analysis Code Types
  ANALYSIS_CODE_TYPES = %w[ALPHABETICAL NUMERICAL THREE_LETTER].freeze

  # Batch Parts
  BATCH_PARTS = %w[RIPE OVER_RIPE UNRIPE DRY_POD EXPORT LOCAL PRIMARY SECONDARY TERTIARY FLOATER INFERIOR SUPERIOR DISCARD CASCARA OTHER A B ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE].freeze

  # Coffee Forms
  COFFEE_FORMS = %w[CHERRY DRY_CHERRY WET_PARCHMENT PARCHMENT WET_GREEN RAW_GREEN GREEN].freeze

  # Condition Types
  CONDITION_TYPES = %w[ACTIVE PAST_DUE HOLD CANCELED PAUSE LOST].freeze

  # Customer Types
  CUSTOMER_TYPES = %w[WHOLESALE RETAIL].freeze

  # Group Status Types
  GROUP_STATUS_TYPES = %w[ACTIVE PAST_DUE HOLD LOST].freeze

  # Item Input Types
  ITEM_INPUT_TYPES = %w[DROPDOWN TEXT POPUP_SLIDER POPUP_SLIDER_SMALL SLIDER SLIDER_BLIND BUTTONS TOGGLE_BUTTONS DEFECTS].freeze

  # Lock States
  LOCK_STATES = %w[UNLOCKED LOCKED].freeze

  # Physical Colors
  PHYSICAL_COLORS = %w[blueGreen blueishGreen green greenish yellowGreen paleYellow yellowish brownish].freeze

  # Physical Color Uniformity
  PHYSICAL_COLOR_UNIFORMITY = %w[uniform inconsistent mottledBeans].freeze

  # Physical Smells
  PHYSICAL_SMELLS = %w[clean foreign cloth dirty dung fresh hay onion paraffin phenolic plastic smoke soil straw wood].freeze

  # Production Order Status
  PRODUCTION_ORDER_STATUS = %w[RECEIVED SCHEDULED IN_PROGRESS ROASTED PACKAGED SHIPPED].freeze

  # Role Types
  ROLE_TYPES = %w[ADMINISTRATOR COLLABORATOR REGISTERED].freeze

  # Sensorial QC Categories
  SENSORIAL_QC_CATEGORIES = %w[FERMENTATION DEFECT OTHER].freeze

  # Session States
  SESSION_STATES = %w[CREATED OPEN CLOSED].freeze

  # Stage Types
  STAGE_TYPES = %w[FERMENTATION DRYING HULLING ROASTING GRADING PACKAGING].freeze

  # Equipment Types
  EQUIPMENT_TYPES = %w[ESPRESSO_MACHINE GRINDER WATER_BOILER BATCH_BREWER WATER_FILTRATION SCALE OTHER].freeze

  # External Order Status
  EXTERNAL_ORDER_STATUS = %w[OPEN CANCELLED CLOSED].freeze

  # Format Types
  FORMAT_TYPES = %w[WHOLE_BEAN GROUND].freeze

  # Goal Types
  GOAL_TYPES = %w[RELATIVE ABSOLUTE].freeze

  # Invoice Status
  INVOICE_STATUS = %w[OPEN PAID DRAFT CANCELLED].freeze

  # Lockable Resource Types
  LOCKABLE_RESOURCE_TYPES = %w[SENSORIAL_SHEET PHYSICAL_SHEET].freeze

  # Measurement Types
  MEASUREMENT_TYPES = %w[WEIGHT COUNT UNKNOWN].freeze

  # Option Mapping Types
  OPTION_MAPPING_TYPES = %w[GRIND_STYLE PACKAGE_SIZE].freeze

  # Packaging Plan Status
  PACKAGING_PLAN_STATUS = %w[OPEN IN_PROGRESS COMPLETED].freeze

  # Packaging Plan Types
  PACKAGING_PLAN_TYPES = %w[FIFO MANUAL_ROASTED_LOTS MANUAL_BLEND_ROASTED_LOTS MANUAL_BLENDED_LOTS].freeze

  # Recipe Status
  RECIPE_STATUS = %w[DRAFT ACTIVE ARCHIVED].freeze

  # Ror Processing Curve Types
  ROR_PROCESSING_CURVE_TYPES = %w[RECOMMENDED SENSITIVE NOISE_SMOOTHING].freeze

  # Common Countries (major coffee producing countries)
  MAJOR_COFFEE_COUNTRIES = %w[
    BR CO ET KE RW UG TZ CD CG CM BI AO MZ MG MW SZ BW NA ZA ZW LS DJ SO ER
    VN LA KH TH MM PH ID MY BN TL PG SB VU FJ PF NC GU AS MP PR VI HT DO JM
    CU GT HN SV NI CR PA EC PE BO GY SR GF VE GY MX US
  ].freeze

  # Common Equipment Brands (first 20 from API list)
  COMMON_EQUIPMENT_BRANDS = %w[
    ACAIA ANFIM ASTORIA BARATZA BREVILLE BRITA BUNN CHEMEX CLEVER COMPAK
    CONTI DALLA_CORTE DECENT_ESPRESSO DITTING ELEKTRA EUREKA FAEMA FETCO HARIO
  ].freeze

  # Basic Permission Types (core permissions)
  BASIC_PERMISSION_TYPES = %w[
    CONTACT_EDIT CONTACT_SHOW LOT_EDIT LOT_SHOW ORDER_EDIT ORDER_SHOW
    ROAST_EDIT ROAST_SHOW PROFILE_GROUP_EDIT PROFILE_GROUP_SHOW
  ].freeze

  # Pagination Settings
  DEFAULT_PAGE_SIZE = 50
  DEFAULT_PAGE_NUMBER = 0
  MAX_RECOMMENDED_PAGE_SIZE = 100

  # API Headers and Media Types
  JSON_API_MEDIA_TYPE = "application/vnd.api+json;charset=UTF-8"
  DEFAULT_USER_AGENT = "CropsterRubyGem"

  # Response Keys
  RESPONSE_DATA_KEY = "data"
  RESPONSE_INCLUDED_KEY = "included"
  RESPONSE_LINKS_KEY = "links"
  RESPONSE_META_KEY = "meta"
  RESPONSE_ERRORS_KEY = "errors"

  # Rate Limiting (following API best practices)
  DEFAULT_REQUESTS_PER_MINUTE = 120  # Ideal rate for most use cases
  RECOMMENDED_REQUESTS_PER_MINUTE = 120  # API best practice recommendation
  MAX_REQUESTS_PER_MINUTE = 200  # Absolute maximum to avoid API bans

  # Retry Configuration
  DEFAULT_MAX_RETRIES = 3
  DEFAULT_RETRY_DELAY = 1.0  # seconds
  MAX_RETRY_DELAY = 10.0  # seconds
end
