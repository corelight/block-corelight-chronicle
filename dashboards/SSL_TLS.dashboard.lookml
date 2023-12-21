- dashboard: ssltls
  title: Data Exploration - SSL/TLS
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: b2qHDOoRowzMax7xh9qL6F
  elements:
  - name: Top Local Responders - Validation Status
    title: Top Local Responders - Validation Status
    model: corelight-chronicle
    explore: directions
    type: looker_grid
    fields: [directions.security_result_detection_fields_value_directions, directions.vali_status_count,
      directions.vali_status_count_percent]
    filters:
      directions.security_result_detection_fields_key_directions: '"validation_status"'
      directions.security_result_detection_fields_value_directions: "-NULL"
      directions.observer_host_name_directions: "-NULL"
      directions.directions_directions: Inbound,Internal
    sorts: [directions.vali_status_count desc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      directions.security_result_detection_fields_value_directions: Validation Status
      directions.vali_status_count: Count
      directions.vali_status_count_percent: Percent
    series_cell_visualizations:
      directions.vali_status_count:
        is_active: false
    defaults_version: 1
    listen:
      Time Range: directions.event_timestamp_directions_time
      Corelight Sensor: directions.observer_host_name_filter_directions
      Direction: directions.directions_filter
      Event Type: directions.product_event_type
    row: 7
    col: 0
    width: 24
    height: 7
  - name: Top Ciphers
    title: Top Ciphers
    model: corelight-chronicle
    explore: directions
    type: looker_pie
    fields: [directions.cipher_count, directions.network_tls_cipher_directions]
    filters:
      directions.network_tls_cipher_directions: "-NULL"
      directions.observer_host_name_directions: "-NULL"
      directions.directions_directions: "-NULL"
    sorts: [directions.cipher_count desc 0]
    limit: 10
    column_limit: 50
    value_labels: labels
    label_type: labPer
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Time Range: directions.event_timestamp_directions_time
      Corelight Sensor: directions.observer_host_name_filter_directions
      Direction: directions.directions_filter
      Event Type: directions.product_event_type
    row: 14
    col: 0
    width: 24
    height: 6
  - name: Top Certificate Subjects
    title: Top Certificate Subjects
    model: corelight-chronicle
    explore: directions
    type: looker_grid
    fields: [directions.network_tls_client_server_directions, directions.cid_count,
      directions.cid_count_percent]
    filters:
      directions.network_tls_client_server_directions: "-NULL"
      directions.observer_host_name_directions: "-NULL"
      directions.directions_directions: "-NULL"
    sorts: [directions.cid_count desc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      directions.network_tls_client_server_directions: Certificate ID
      directions.cid_count: Count
      directions.cid_count_percent: Percent
    series_cell_visualizations:
      directions.cid_count:
        is_active: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Time Range: directions.event_timestamp_directions_time
      Corelight Sensor: directions.observer_host_name_filter_directions
      Direction: directions.directions_filter
      Event Type: directions.product_event_type
    row: 0
    col: 0
    width: 24
    height: 7
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: ssl
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - ssl
    model: corelight-chronicle
    explore: directions
    listens_to_filters: []
    field: directions.product_event_type
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 4 hour
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: corelight-chronicle
    explore: directions
    listens_to_filters: []
    field: directions.event_timestamp_directions_time
  - name: Corelight Sensor
    title: Corelight Sensor
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: corelight-chronicle
    explore: directions
    listens_to_filters: [Event Type]
    field: directions.observer_host_name_filter_directions
  - name: Direction
    title: Direction
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: corelight-chronicle
    explore: directions
    listens_to_filters: [Event Type]
    field: directions.directions_filter
