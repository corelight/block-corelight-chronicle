- dashboard: data_exploration__http_directions
  title: Data Exploration - HTTP Directions
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 7FB7oph1PzPLKEUYyT7kMa
  elements:
  - title: Distinct Host Headers Outbound
    name: Distinct Host Headers Outbound
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.distinct_hosts_outbound]
    filters:
      events.metadata__product_event_type: http
    limit: 5000
    column_limit: 50
    filter_expression: "(${events__about__labels__uid__only.value} = ${conn_events_search_derived_outbound.conn_uids})\
      \ AND (${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids})"
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
      Event Type: events.product_event_type
    row: 0
    col: 13
    width: 11
    height: 2
  - title: Local Hosts - Outbound
    name: Local Hosts - Outbound
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.host_header_http_direction, events.local_host_outbound]
    filters:
      events.metadata__product_event_type: http
      events.local_host_outbound: "-NULL"
    sorts: [events.host_header_http_direction desc 0]
    limit: 5000
    column_limit: 50
    filter_expression: "(${events__about__labels__uid__only.value}=${conn_events_search_derived_outbound.conn_uids})\
      \ AND (${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids})"
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
      events.host_header_http_direction: Count By Unique Connections
      events.local_host_outbound: Host Header
    series_cell_visualizations:
      events.host_header_http_direction:
        is_active: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type
    row: 2
    col: 0
    width: 13
    height: 6
  - title: Distinct Host Headers Inbound
    name: Distinct Host Headers Inbound
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.distinct_hosts_inbound]
    filters:
      events.target__hostname: "-NULL"
    sorts: [events.distinct_hosts_inbound desc 0]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(${events.distinct_hosts_inbound})
      label: District inbound Host header
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: district_inbound_host_header
      _type_hint: number
      is_disabled: true
    filter_expression: "(${events__about__labels__uid__only.value} = ${conn_events_search_derived.conn_uids})\
      \ AND (${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids})"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      events.distinct_hosts_inbound:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    hidden_fields: []
    hide_totals: false
    hide_row_totals: false
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type
    row: 0
    col: 0
    width: 13
    height: 2
  - title: Local Hosts - Inbound
    name: Local Hosts - Inbound
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.host_header_http_direction, events.local_host_inbound]
    filters:
      events.metadata__product_event_type: http
      events.local_host_inbound: "-NULL"
    sorts: [events.host_header_http_direction desc 0]
    limit: 5000
    column_limit: 50
    filter_expression: "(${events__about__labels__uid__only.value}=${conn_events_search_derived.conn_uids})\
      \ AND (${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids})"
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
      events.host_header_http_direction: Count By Unique Connections
      events.local_host_inbound: Host Header
    series_cell_visualizations:
      events.host_header_http_direction:
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
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type
    row: 8
    col: 0
    width: 13
    height: 6
  - title: Local User Agents - Outbound
    name: Local User Agents - Outbound
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.agent_count_http_direction, events.http_user_agent_outbound]
    filters:
      events.metadata__product_event_type: http
      events.http_user_agent_outbound: "-NULL"
    sorts: [events.agent_count_http_direction desc 0]
    limit: 5000
    column_limit: 50
    filter_expression: "(${events__about__labels__uid__only.value}=${conn_events_search_derived_outbound.conn_uids})\
      \ AND (${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids})"
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
      events.http_user_agent_outbound: User Agent
      events.agent_count_http_direction: Count By Unique Connections
    series_cell_visualizations:
      events.agent_count_http_direction:
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
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type
    row: 2
    col: 13
    width: 11
    height: 6
  - title: Local User Agents - Inbound
    name: Local User Agents - Inbound
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.agent_count_http_direction, events.http_user_agent_inbound]
    filters:
      events.metadata__product_event_type: http
      events.http_user_agent_inbound: "-NULL"
    sorts: [events.agent_count_http_direction desc 0]
    limit: 5000
    column_limit: 50
    filter_expression: "(${events__about__labels__uid__only.value} = ${conn_events_search_derived.conn_uids})\
      \ AND (${events__about__labels__uid.value}=${http_group_by_uid_src_dest.conn_uids})"
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
      events.agent_count_http_direction: Count By Unique Connections
      events.http_user_agent_inbound: User Agent
    series_cell_visualizations:
      events.agent_count_http_direction:
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
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type
    row: 8
    col: 13
    width: 11
    height: 6
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: http
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: popover
      options:
      - http
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.product_event_type
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
      display: popover
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.observer__hostname
