- dashboard: notices
  title: Security Workflows - Notices
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: kIshcCxlxhjf7dL6Q59LhB
  elements:
  - title: Notices Over Time
    name: Notices Over Time
    model: corelight-chronicle
    explore: events
    type: looker_area
    fields: [events.notices_over_time_count, events.event_timestamp_date]
    fill_fields: [events.event_timestamp_date]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Events, orientation: left, series: [{axisId: events.count, id: events.count,
            name: Events}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: above
    note_text: "(Severity filter does not apply)"
    listen:
      Event Type: events.metadata__product_event_type
      Protocol/Port: events.proto_port_for_filter_notice
      Time Range: events.event_timestamp_time
      Source IP: events__principal__ip.events__principal__ip
      Notes: events__security_result.description_for_filter_notice
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Notices
    name: Notices
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events__security_result.description, events.description_count]
    filters:
      events__security_result.description: "-NULL"
    sorts: [events__security_result.description]
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
      Protocol/Port: events.proto_port_for_filter_notice
      Time Range: events.event_timestamp_time
      Severity: events.severity_notice_for_filter
      Source IP: events__principal__ip.events__principal__ip
      Notes: events__security_result.description_for_filter_notice
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Log Data
    name: Log Data
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.event_timestamp_time, events__principal__ip.events__principal__ip,
      events.severity_notice, events.metadata__id, events.external_link]
    sorts: [events.event_timestamp_time desc]
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
      events.event_timestamp_time: Time
      events.external_link: Raw Logs
      events.severity_notice: Severity
      events__principal__ip.events__principal__ip: Source IP
    hidden_fields: [events.metadata__id]
    defaults_version: 1
    listen:
      Event Type: events.metadata__product_event_type
      Protocol/Port: events.proto_port_for_filter_notice
      Time Range: events.event_timestamp_time
      Severity: events.severity_notice_for_filter
      Source IP: events__principal__ip.events__principal__ip
      Notes: events__security_result.description_for_filter_notice
    row: 13
    col: 0
    width: 24
    height: 11
  - title: Notice Details
    name: Notice Details
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__security_result.description, events.severity_notice, events.proto_port,
      events.notices_over_time_count]
    filters:
      events__security_result.description: "-NULL"
      events.proto_port: "-NULL"
      events.severity_notice: "-NULL"
    sorts: [events__security_result.description, events.severity_notice, events.notices_over_time_count,
      events.proto_port]
    subtotals: [events__security_result.description, events.proto_port, events.severity_notice]
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
      events__security_result.description: Notes
      events.proto_port: Protocol/Port
      events.severity_notice: Severity
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
    hidden_fields: [events.count, events.notices_over_time_count]
    hidden_pivots: {}
    listen:
      Event Type: events.metadata__product_event_type
      Protocol/Port: events.proto_port_for_filter_notice
      Time Range: events.event_timestamp_time
      Severity: events.severity_notice_for_filter
      Source IP: events__principal__ip.events__principal__ip
      Notes: events__security_result.description_for_filter_notice
    row: 6
    col: 0
    width: 24
    height: 7
  - title: Severities
    name: Severities
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.severity_count, events.severity_notice]
    filters:
      events__security_result.severity_details: "-NULL"
    sorts: [events.severity_count desc 0]
    limit: 10
    column_limit: 50
    value_labels: labels
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    show_view_names: false
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
      Protocol/Port: events.proto_port_for_filter_notice
      Time Range: events.event_timestamp_time
      Severity: events.severity_notice_for_filter
      Source IP: events__principal__ip.events__principal__ip
      Notes: events__security_result.description_for_filter_notice
    row: 0
    col: 16
    width: 8
    height: 6
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: notice
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - notice
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.metadata__product_event_type
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 4 hour
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.event_timestamp_time
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
    field: events.severity_notice_for_filter
  - name: Source IP
    title: Source IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events__principal__ip.events__principal__ip
  - name: Notes
    title: Notes
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
    field: events__security_result.description_for_filter_notice
  - name: Protocol/Port
    title: Protocol/Port
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
    field: events.proto_port_for_filter_notice
