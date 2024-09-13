- dashboard: suricata_ids_alert_overview
  title: Security Workflows - Suricata IDS Alert Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: JrOeqmrP1UM23RSNP5unrh
  elements:
  - title: Signature Analysis
    name: Signature Analysis
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__security_result.severity_details, events__security_result.summary,
      events__security_result.rule_id, events.signature_count, events__principal__ip.source_count]
    filters:
      events__principal__ip.events__principal__ip: "-NULL"
      events__security_result.severity_details: "-NULL"
      events__security_result__category_details.events__security_result__category_details: "-NULL"
    sorts: [events__principal__ip.source_count desc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
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
    column_order: ["$$$_row_numbers_$$$", events__security_result.severity_details,
      events__security_result.summary, events__security_result.rule_id, events__principal__ip.source_count,
      events.signature_count]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width:
    series_labels:
      events__security_result.severity_details: Sev
      events__security_result.summary: Signature
      events__security_result.rule_id: SID
      events.signature_count: Count of Signature
      events__principal__ip.source_count: "#Sources"
    series_cell_visualizations:
      events.signature_count:
        is_active: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Source IP: events.principal__ip__filter
      Severity: events.security_result_severity_details__filter
      Category: events.security_result_category_details__filter
      Event Type: events.metadata__product_event_type
      Namespace: events.observer__namespace
    row: 18
    col: 0
    width: 24
    height: 8
  - title: Log Details
    name: Log Details
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.event_timestamp_time, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.target__port, events__security_result.severity_details,
      events__security_result.summary, events__security_result.rule_id, events.external_link,
      events__about__labels.value, events__about__labels__service.value]
    filters:
      events__about__labels.key: uid
      events__principal__ip.events__principal__ip: "-NULL"
      events__security_result.severity_details: "-NULL"
      events__security_result__category_details.events__security_result__category_details: "-NULL"
    sorts: [events.event_timestamp_time desc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
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
    column_order: [events.event_timestamp_time, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.target__port, events__about__labels__service.value,
      events__security_result.severity_details, events__security_result.summary, events__security_result.rule_id,
      events__about__labels.value, events.external_link]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.event_timestamp_time: Timestamp
      events__principal__ip.events__principal__ip: id.origin_h
      events__target__ip.events__target__ip: id.resp_h
      events.target__port: id.resp_p
      events__security_result.severity_details: alert.severity
      events__security_result.summary: alert.signature
      events__security_result.rule_id: alert.signature_id
      events.external_link: Raw Logs
      events__about__labels.value: uid
      events__about__labels__service.value: service
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Source IP: events.principal__ip__filter
      Severity: events.security_result_severity_details__filter
      Category: events.security_result_category_details__filter
      SID (for Log Details): events.security_result_rule_id__filter
      Event Type: events.metadata__product_event_type
      Namespace: events.observer__namespace
    row: 26
    col: 0
    width: 24
    height: 8
  - title: Total IDS Hits
    name: Total IDS Hits
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.event_count]
    filters:
      events__principal__ip.events__principal__ip: "-NULL"
      events__security_result.severity_details: "-NULL"
      events__security_result__category_details.events__security_result__category_details: "-NULL"
    limit: 500
    column_limit: 50
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
      Source IP: events.principal__ip__filter
      Severity: events.security_result_severity_details__filter
      Category: events.security_result_category_details__filter
      Event Type: events.metadata__product_event_type
      Namespace: events.observer__namespace
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Unique Rules Alerting
    name: Unique Rules Alerting
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events__security_result.rule_count]
    filters:
      events__principal__ip.events__principal__ip: "-NULL"
      events__security_result__category_details.events__security_result__category_details: "-NULL"
      events__security_result.severity_details: "-NULL"
    limit: 500
    column_limit: 50
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Source IP: events.principal__ip__filter
      Severity: events.security_result_severity_details__filter
      Category: events.security_result_category_details__filter
      Event Type: events.metadata__product_event_type
      Namespace: events.observer__namespace
    row: 6
    col: 8
    width: 8
    height: 6
  - title: Origin Summary
    name: Origin Summary
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.hits, events__security_result.ruls, events__principal__ip.events__principal__ip]
    filters:
      events__security_result.severity_details: "-NULL"
      events__security_result__category_details.events__security_result__category_details: "-NULL"
      events__principal__ip.events__principal__ip: "-NULL"
    sorts: [events__security_result.ruls desc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
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
    hidden_pivots: {}
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
    minimum_column_width: 75
    show_sql_query_menu_options: false
    column_order: [events__principal__ip.events__principal__ip, events__security_result.ruls,
      events.hits]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      events__principal__ip.events__principal__ip: id.orig_h
      events.hits: "#Hits"
      events__security_result.ruls: "#Rules"
    series_cell_visualizations:
      events.hits:
        is_active: false
    listen:
      Time Range: events.event_timestamp_time
      Source IP: events.principal__ip__filter
      Severity: events.security_result_severity_details__filter
      Category: events.security_result_category_details__filter
      Event Type: events.metadata__product_event_type
      Namespace: events.observer__namespace
    row: 12
    col: 11
    width: 13
    height: 6
  - title: Category Analysis
    name: Category Analysis
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__security_result__category_details.events__security_result__category_details,
      events.category_count]
    filters:
      events__security_result__category_details.events__security_result__category_details: "-NULL"
      events__principal__ip.events__principal__ip: "-NULL"
      events__security_result.severity_details: "-NULL"
    sorts: [events.category_count desc 0]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
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
      events__security_result__category_details.events__security_result__category_details: alert.category
      events.category_count: count
    series_cell_visualizations:
      events.category_count:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Source IP: events.principal__ip__filter
      Severity: events.security_result_severity_details__filter
      Category: events.security_result_category_details__filter
      Event Type: events.metadata__product_event_type
      Namespace: events.observer__namespace
    row: 12
    col: 0
    width: 11
    height: 6
  - title: IDS Hits Over Time
    name: IDS Hits Over Time
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.log_count, events.event_timestamp_date]
    fill_fields: [events.event_timestamp_date]
    filters:
      events__principal__ip.events__principal__ip: "-NULL"
      events__security_result.severity_details: "-NULL"
      events__security_result__category_details.events__security_result__category_details: "-NULL"
    sorts: [events.event_timestamp_date desc]
    limit: 5000
    column_limit: 50
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
    show_null_points: true
    interpolation: linear
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    x_axis_datetime_label: ''
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Source IP: events.principal__ip__filter
      Severity: events.security_result_severity_details__filter
      Category: events.security_result_category_details__filter
      Event Type: events.metadata__product_event_type
      Namespace: events.observer__namespace
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Alerts with CVEs
    name: Alerts with CVEs
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.cve_count]
    filters:
      events__principal__ip.events__principal__ip: "-NULL"
      events__security_result.severity_details: "-NULL"
      events__security_result__category_details.events__security_result__category_details: "-NULL"
    limit: 500
    column_limit: 50
    filter_expression: contains(${events__security_result.summary}, "CVE") OR contains(${events__security_result__detection_fields_alert_metadata.value},"CVE")
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
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Source IP: events.principal__ip__filter
      Severity: events.security_result_severity_details__filter
      Category: events.security_result_category_details__filter
      Event Type: events.metadata__product_event_type
      Namespace: events.observer__namespace
    row: 6
    col: 16
    width: 8
    height: 6
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: '"suricata_corelight"'
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - suricata_corelight
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.metadata__product_event_type
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 24 hour
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
  - name: Source IP
    title: Source IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.principal__ip__filter
  - name: Severity
    title: Severity
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
    field: events.security_result_severity_details__filter
  - name: Category
    title: Category
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
    field: events.security_result_category_details__filter
  - name: SID (for Log Details)
    title: SID (for Log Details)
    type: field_filter
    default_value: None
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.security_result_rule_id__filter
  - name: Namespace
    title: Namespace
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.observer__namespace
