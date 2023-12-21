- dashboard: ip_interrogation
  title: Security Workflows - IP Interrogation
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 4ps2OfhcCx56dhh00bvNNX
  elements:
  - title: Connections
    name: Connections
    model: corelight-chronicle
    explore: events
    type: looker_bar
    fields: [events.Service, events.web_protocol_count]
    filters:
      events.metadata__product_event_type: conn
    sorts: [events.web_protocol_count desc]
    limit: 10
    column_limit: 50
    filter_expression: "${events.target__port}!=80 AND ${events.target__port}!=8080\
      \ AND ${events.target__port}!=443"
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: events.count, id: events.count,
            name: Count}], showLabels: true, showValues: true, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      events.web_protocol_count: Count
    column_spacing_ratio: 0
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: 'Top Non-Web Protocol Usage

      '
    listen:
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Time Range: events.event_time_time
    row: 0
    col: 0
    width: 15
    height: 6
  - title: Connections
    name: Connections (2)
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.Service, events__about__labels__uid.value, events__target__ip_geo_artifact.location__country_or_region,
      events__target__ip_geo_artifact.network__dns_domain, events.total_ip_bytes,
      events.external_link]
    filters:
      events.metadata__product_event_type: conn
    sorts: [events.total_ip_bytes desc]
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
      events__target__ip.events__target__ip: Destination IP
      events.external_link: Raw Logs
      events__target__ip_geo_artifact.location__country_or_region: Country
      events__target__ip_geo_artifact.network__dns_domain: Destination Hostname
      events__about__labels__uid.value: UID
      events.total_ip_bytes: Bytes
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
    note_state: collapsed
    note_display: above
    note_text: Top Connections/Services by Bytes Transferred
    listen:
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Time Range: events.event_time_time
    row: 6
    col: 0
    width: 24
    height: 6
  - title: Corelight Data Sets
    name: Corelight Data Sets
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.metadata__product_event_type, events.event_type_count]
    filters:
      events.metadata__product_event_type: "-conn%,-http,-asoc:nba:event"
    sorts: [events.metadata__product_event_type]
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
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Corelight supporting data sources for source
    listen:
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Time Range: events.event_time_time
    row: 17
    col: 0
    width: 8
    height: 6
  - title: HTTP
    name: HTTP
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.network__http__user_agent, events.agent_count]
    filters:
      events.metadata__product_event_type: http
      events.network__http__user_agent: "-NULL"
    sorts: [events.network__http__user_agent]
    limit: 10
    column_limit: 50
    value_labels: legend
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
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Rare User Agents
    listen:
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Time Range: events.event_time_time
    row: 17
    col: 8
    width: 8
    height: 6
  - title: HTTP
    name: HTTP (2)
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.target__port, events.target_count]
    filters:
      events.target__port: '80,8080,443'
      events.metadata__product_event_type: http
    sorts: [events.target_count desc 0]
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
    show_null_points: true
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Web Ports Breakdown
    listen:
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Time Range: events.event_time_time
    row: 17
    col: 16
    width: 8
    height: 6
  - title: HTTP
    name: HTTP (3)
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.network__http__method, events.target__url, events.target_ips_count]
    filters:
      events.metadata__product_event_type: http
    sorts: [events.target_ips_count desc]
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
      events__target__ip.events__target__ip: Destination IP
      events.network__http__method: Method
      events.target__url: URI
      events.target_ips_count: Count
    series_cell_visualizations:
      events.target_ips_count:
        is_active: false
    defaults_version: 1
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
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Top Destination IP, Method, & URI
    listen:
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Time Range: events.event_time_time
    row: 12
    col: 0
    width: 24
    height: 5
  - title: Connections
    name: Connections (3)
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.internal_external, events.internal_external_count]
    filters:
      events.metadata__product_event_type: conn
      events__about__labels__local__resp.value: "-NULL"
    sorts: [events.internal_external_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${events__target__ip.target_ip_count}/sum(${events__target__ip.target_ip_count})\n"
      label: Count%
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
      is_disabled: true
    value_labels: labels
    label_type: labPer
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields: []
    note_state: collapsed
    note_display: above
    note_text: Internal vs External
    listen:
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Time Range: events.event_time_time
    row: 0
    col: 15
    width: 9
    height: 6
  filters:
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
    field: events.event_time_time
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
    listens_to_filters: []
    field: events__principal__ip.events__principal__ip
  - name: Destination IP
    title: Destination IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events__target__ip.events__target__ip
