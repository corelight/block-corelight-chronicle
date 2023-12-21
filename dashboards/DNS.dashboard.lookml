- dashboard: dns
  title: Data Exploration - DNS
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: I6qllPl34BwtZHiV9tFYHb
  elements:
  - title: Top Query Types
    name: Top Query Types
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.dns_query_type_count, events__about__labels__qtype_name.value]
    filters:
      events__about__labels__qtype_name.value: "-NULL"
      events__principal__ip.events__principal__ip: "-0.0.0.0,-255.255.255.255"
      events__target__ip.events__target__ip: "-0.0.0.0,-255.255.255.255"
      events.observer__hostname: "-NULL"
    sorts: [events.dns_query_type_count desc 0]
    limit: 10
    column_limit: 50
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname_for_filter
      Responder Port (id_resp_p): events.target__port__intel
      Record Type: events__about__labels__qtype_name.value_for_filter
      Time Range: events.event_timestamp_time
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Top Originators by Count
    name: Top Originators by Count
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events.dns_originators_count]
    filters:
      events__principal__ip.events__principal__ip: "-0.0.0.0,-255.255.255.255"
      events__target__ip.events__target__ip: "-0.0.0.0,-255.255.255.255"
      events.observer__hostname: "-NULL"
    sorts: [events.dns_originators_count desc 0]
    limit: 10
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
      events__principal__ip.events__principal__ip: Source IP
      events.dns_originators_count: Count
    series_cell_visualizations:
      events.dns_originators_count:
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname_for_filter
      Responder Port (id_resp_p): events.target__port__intel
      Record Type: events__about__labels__qtype_name.value_for_filter
      Time Range: events.event_timestamp_time
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Top Successful Reverse Queries by Count
    name: Top Successful Reverse Queries by Count
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__network__dns__questions.name, events.dns_reverse_queries_count]
    filters:
      events__principal__ip.events__principal__ip: "-0.0.0.0,-255.255.255.255"
      events__target__ip.events__target__ip: "-0.0.0.0,-255.255.255.255"
      events.observer__hostname: "-NULL"
      events__about__labels__qtype_name.value: PTR
      events__about__labels__rcode_name.value: NOERROR
    sorts: [events.dns_reverse_queries_count desc 0]
    limit: 10
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
      events__network__dns__questions.name: Query
      events.dns_reverse_queries_count: Count
    series_cell_visualizations:
      events.dns_reverse_queries_count:
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname_for_filter
      Responder Port (id_resp_p): events.target__port__intel
      Record Type: events__about__labels__qtype_name.value_for_filter
      Time Range: events.event_timestamp_time
    row: 6
    col: 8
    width: 8
    height: 6
  - title: Top Reverse Queries by Count to Non-Existent Domains
    name: Top Reverse Queries by Count to Non-Existent Domains
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__network__dns__questions.name, events.dns_reverse_queries_ned_count]
    filters:
      events.observer__hostname: "-NULL"
      events__about__labels__qtype_name.value: PTR
      events__about__labels__rcode_name.value: NXDOMAIN
    sorts: [events.dns_reverse_queries_ned_count desc 0]
    limit: 10
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
      events__network__dns__questions.name: Query
      events.dns_reverse_queries_ned_count: Count
    series_cell_visualizations:
      events.dns_reverse_queries_ned_count:
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname_for_filter
      Responder Port (id_resp_p): events.target__port__intel
      Record Type: events__about__labels__qtype_name.value_for_filter
      Time Range: events.event_timestamp_time
    row: 6
    col: 16
    width: 8
    height: 6
  - title: Top 10 Queries by Count
    name: Top 10 Queries by Count
    model: corelight-chronicle
    explore: dns
    type: looker_grid
    fields: [dns.query_derived, dns.queries_count_derived]
    filters: {}
    sorts: [dns.queries_count_derived desc 0]
    limit: 10
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
      dns.query_derived: Query
      dns.queries_count_derived: Count By Unique Originators
    series_cell_visualizations:
      dns.queries_count_derived:
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
      Corelight Sensor: dns.hostname_derived
      Responder Port (id_resp_p): dns.port_derived
      Record Type: dns.qtype_derived
      Time Range: dns.time_derived
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Top 10 Queries by Count to Non-Existent Domains
    name: Top 10 Queries by Count to Non-Existent Domains
    model: corelight-chronicle
    explore: dns
    type: looker_grid
    fields: [dns.queries_ned_count_derived, dns.query_ned_derived]
    filters:
      dns.rcode_derived: NXDOMAIN
    sorts: [dns.queries_ned_count_derived desc 0]
    limit: 10
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
      dns.queries_ned_count_derived: Count By Unique Originators
      dns.query_ned_derived: Query
    series_cell_visualizations:
      dns.queries_ned_count_derived:
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
      Corelight Sensor: dns.hostname_derived
      Responder Port (id_resp_p): dns.port_derived
      Record Type: dns.qtype_derived
      Time Range: dns.time_derived
    row: 0
    col: 16
    width: 8
    height: 6
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: dns
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - dns
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.metadata__product_event_type
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
    field: events.observer__hostname_for_filter
  - name: Responder Port (id_resp_p)
    title: Responder Port (id_resp_p)
    type: field_filter
    default_value: '53'
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.target__port__intel
  - name: Record Type
    title: Record Type
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
    field: events__about__labels__qtype_name.value_for_filter
