- dashboard: ssh_inferences_overview
  title: Security Workflows - SSH Inferences Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: rl9Djxz3v00R2B2Ryzs2vq
  elements:
  - title: SSH Inferences Over Time
    name: SSH Inferences Over Time
    model: corelight-chronicle
    explore: events
    type: looker_area
    fields: [events__security_result.summary, events.ssh_inferences_over_time_count,
      events.event_time_date]
    pivots: [events__security_result.summary]
    fill_fields: [events.event_time_date]
    filters:
      events__security_result.summary: "-NULL"
    sorts: [events__security_result.summary]
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
    legend_position: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.ssh_inferences_over_time_count,
            id: Authentication Scanning - events.ssh_inferences_over_time_count, name: Authentication
              Scanning}, {axisId: events.ssh_inferences_over_time_count, id: Capabilities
              Scanning - events.ssh_inferences_over_time_count, name: Capabilities
              Scanning}, {axisId: events.ssh_inferences_over_time_count, id: Client
              Trusted Server - events.ssh_inferences_over_time_count, name: Client
              Trusted Server}, {axisId: events.ssh_inferences_over_time_count, id: SSH
              authentication success - events.ssh_inferences_over_time_count, name: SSH
              authentication success}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Drill-down on this widget to see full descriptions of SSH inferences
    listen:
      Event Type: events.metadata__product_event_type
      SSH Inferences: events__security_result.summary_for_filter
      Time Range: events.event_time_time
      Namespace: events.observer__namespace
    row: 0
    col: 12
    width: 12
    height: 6
  - title: SSH Inferences
    name: SSH Inferences
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events__security_result.summary, events.ssh_inferences_count]
    filters:
      events__security_result.summary: "-NULL"
    sorts: [events__security_result.summary]
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
      SSH Inferences: events__security_result.summary_for_filter
      Time Range: events.event_time_time
      Namespace: events.observer__namespace
    row: 0
    col: 0
    width: 12
    height: 6
  - title: SSH Host Details
    name: SSH Host Details
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.ssh_host_count, security_result_summary_derived.summary_derived]
    sorts: [events.ssh_host_count desc]
    limit: 5
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
      events.ssh_host_count: Count
      events__target__ip.events__target__ip: Destination IP
      events__principal__ip.events__principal__ip: Source IP
      security_result_summary_derived.summary_derived: Inferences
    series_cell_visualizations:
      events.ssh_host_count:
        is_active: false
    defaults_version: 1
    listen:
      Event Type: events.metadata__product_event_type
      SSH Inferences: security_result_summary_derived.summary_derived
      Time Range: events.event_time_time
      Namespace: events.observer__namespace
    row: 6
    col: 12
    width: 12
    height: 6
  - title: HASSH Fingerprint Details
    name: HASSH Fingerprint Details
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__principal__labels__hassh.value,
      events__target__ip.events__target__ip, events__target__labels__hassh_server.value,
      events.ssh_hassh_fingerprint_count]
    sorts: [events.ssh_hassh_fingerprint_count desc 0]
    limit: 5
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
      events__principal__labels__hassh.value: HASSH Client
      events__target__ip.events__target__ip: Destination IP
      events__target__labels__hassh_server.value: HASSH Server
      events.ssh_hassh_fingerprint_count: Total Events
    series_cell_visualizations:
      events.ssh_hassh_fingerprint_count:
        is_active: false
    defaults_version: 1
    listen:
      Event Type: events.metadata__product_event_type
      SSH Inferences: events__security_result.summary_for_filter
      Time Range: events.event_time_time
      Namespace: events.observer__namespace
    row: 6
    col: 0
    width: 12
    height: 6
  - title: Inferences for Hosts with Host Key
    name: Inferences for Hosts with Host Key
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events__security_result__detection_fields_host_key.value, events.ssh_host_key_count,
      security_result_summary_derived.summary_derived]
    filters:
      events__security_result__detection_fields_host_key.value: "-NULL"
    sorts: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events__security_result__detection_fields_host_key.value]
    limit: 5000
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
      events.ssh_host_key_count: Count
      events__security_result__detection_fields_host_key.value: Host Key
      events__target__ip.events__target__ip: Destination IP
      events__principal__ip.events__principal__ip: Source IP
      security_result_summary_derived.summary_derived: Inferences
    series_cell_visualizations:
      events.ssh_host_key_count:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Event Type: events.metadata__product_event_type
      SSH Inferences: security_result_summary_derived.summary_derived
      Time Range: events.event_time_time
      Namespace: events.observer__namespace
    row: 12
    col: 0
    width: 24
    height: 6
  - title: Log Data
    name: Log Data
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.event_time_time, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events__security_result.summary, events.external_link,
      events.metadata__id]
    filters:
      events__security_result.summary: "-NULL"
    sorts: [events.event_time_time desc]
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
      events.external_link: Raw Logs
      events__security_result.summary: Inferences
      events__target__ip.events__target__ip: Destination IP
      events__principal__ip.events__principal__ip: Source IP
      events.event_time_time: Time
    defaults_version: 1
    hidden_fields: [events.metadata__id]
    note_state: collapsed
    note_display: above
    note_text: SSH Inference Log Data
    listen:
      Event Type: events.metadata__product_event_type
      SSH Inferences: events__security_result.summary_for_filter
      Time Range: events.event_time_time
      Namespace: events.observer__namespace
    row: 18
    col: 0
    width: 24
    height: 10
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: ssh
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - ssh
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
    field: events.event_time_time
  - name: SSH Inferences
    title: SSH Inferences
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events__security_result.summary_for_filter
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
