- dashboard: data_exploration__http
  title: Data Exploration - HTTP
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: NAHkdrL9tcGQzWJ6mUwMcd
  elements:
  - title: Top Host Headers by Count
    name: Top Host Headers by Count
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.host_header_http, events.host_header_top]
    filters:
      events.metadata__product_event_type: http
      events.target__hostname: "-NULL"
    sorts: [events.host_header_http desc]
    limit: 10
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
      events.host_header_http: Count By Unique Connections
      events.host_header_top: Host Header
    series_cell_visualizations:
      events.host_header_http:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 6
    col: 0
    width: 8
    height: 6
  - title: HTTP Status Code Breakdown
    name: HTTP Status Code Breakdown
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events__about__labels__status__msg.value, events.status_msg_count]
    filters:
      events.metadata__product_event_type: http
    sorts: [events.status_msg_count desc 0]
    limit: 10
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    value_labels: labels
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 6
    col: 8
    width: 8
    height: 6
  - title: Top Originators
    name: Top Originators
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events.principal_count_http]
    filters:
      events.metadata__product_event_type: conn
      events.network__application_protocol: '2000'
    sorts: [events.principal_count_http desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
      events__principal__ip.events__principal__ip: Source IP
      events.principal_count_http: Count
    series_cell_visualizations:
      events.principal_count_http:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 6
    col: 16
    width: 8
    height: 6
  - title: Rare User Agents
    name: Rare User Agents
    model: corelight-chronicle
    explore: events
    type: table
    fields: [events.agent_count_http, events.agent_count_percent_http, events.http_user_agent_rare]
    filters:
      events.metadata__product_event_type: http
      events.http_user_agent_rare: "-NULL"
    sorts: [events.agent_count_http]
    limit: 5000
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      events.agent_count_http: Count By Unique Connections
      events.agent_count_percent_http: Percent
      events.http_user_agent_rare: HTTP User Agent
    truncate_text: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 12
    col: 0
    width: 14
    height: 6
  - title: Rare Host Headers
    name: Rare Host Headers
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.rare_host_header_http, events.rare_host_header_http_percent, events.host_header_rare]
    filters:
      events.metadata__product_event_type: http
      events.host_header_rare: "-NULL"
    sorts: [events.rare_host_header_http]
    limit: 5000
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
      events.rare_host_header_http: Count By Unique Connections
      events.rare_host_header_http_percent: Percent
      events.host_header_rare: Host Header
    series_cell_visualizations:
      events.rare_host_header_http:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 12
    col: 14
    width: 10
    height: 6
  - title: Host Breakdown By HTTP Status
    name: Host Breakdown By HTTP Status
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.host_header_status, events.network__http__response_code__string,
      events__about__labels__status__msg.value, events.http_status_code_host_count]
    filters:
      events.metadata__product_event_type: http
      events.network__http__response_code__string: "-NULL"
      events.host_header_status: "-NULL"
    sorts: [events.http_status_code_host_count desc]
    limit: 5000
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
      events__about__labels__status__msg.value: Status Message
      events.http_status_code_host_count: Count By Unique Connections
      events.network__http__response_code__string: Status Code
      events.host_header_status: Host Header
    series_cell_visualizations:
      events.http_status_code_host_count:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      HTTP Status  (For Host Breakdown By HTTP Status): events.network__http__response_code__filter
      Event Type: events.product_event_type_filter
    row: 20
    col: 13
    width: 11
    height: 6
  - title: Host Breakdown By HTTP Method
    name: Host Breakdown By HTTP Method
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.http_method_host_count, events.host_header_method]
    filters:
      events.metadata__product_event_type: http
      events.host_header_method: "-NULL"
    sorts: [events.http_method_host_count desc]
    limit: 5000
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
      events.host_header_method: Host Header
      events.http_method_host_count: Count By Unique Connections
    series_cell_visualizations:
      events.http_method_host_count:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      HTTP Method (Host Breakdown By HTTP Method): events.network__http__method
      Event Type: events.product_event_type_filter
    row: 20
    col: 0
    width: 13
    height: 6
  - title: Distinct Referrers
    name: Distinct Referrers
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.http_referrer]
    filters:
      events.metadata__product_event_type: http
    limit: 500
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 2
    col: 0
    width: 8
    height: 2
  - title: Distinct User Agents
    name: Distinct User Agents
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.http_user_agent]
    filters:
      events.metadata__product_event_type: http
    limit: 500
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 2
    col: 16
    width: 8
    height: 2
  - title: Distinct Hosts
    name: Distinct Hosts
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.host_header]
    filters:
      events.metadata__product_event_type: http
    limit: 500
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 2
    col: 8
    width: 8
    height: 2
  - title: Distinct Connections
    name: Distinct Connections
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.distinct_connections]
    filters:
      events.metadata__product_event_type: http
    limit: 500
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 4
    col: 0
    width: 8
    height: 2
  - title: Average Body Length
    name: Average Body Length
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.average_body_length]
    filters:
      events.metadata__product_event_type: http
    limit: 500
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 4
    col: 8
    width: 8
    height: 2
  - title: Average User Agent Length
    name: Average User Agent Length
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.average_user_agent_length]
    filters:
      events.metadata__product_event_type: http
    limit: 500
    column_limit: 50
    filter_expression: "${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids}"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
    row: 4
    col: 16
    width: 8
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Top Values"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (Copy)"
    type: text
    title_text: " (Copy)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Details"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 18
    col: 0
    width: 24
    height: 2
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: http,conn
    allow_multiple_values: true
    required: true
    ui_config:
      type: tag_list
      display: popover
      options:
      - http
      - conn
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.product_event_type_filter
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
    explore: events
    listens_to_filters: []
    field: events.event_timestamp_time
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
    explore: events
    listens_to_filters: [Event Type]
    field: events.observer__hostname
  - name: HTTP Method (For Host Breakdown By HTTP Method)
    title: HTTP Method (For Host Breakdown By HTTP Method)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.network__http__method
  - name: HTTP Status  (For Host Breakdown By HTTP Status)
    title: HTTP Status  (For Host Breakdown By HTTP Status)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.network__http__response_code__filter
