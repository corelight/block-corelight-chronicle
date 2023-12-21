- dashboard: security_workflows__vpn_insights
  title: Security Workflows - VPN Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: BDt67HeAkVpOHz8NtCCCii
  elements:
  - title: Inference Type
    name: Inference Type
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.vpn_inferences_count, events__about__labels__inferences_vpn.value]
    filters:
      events.product_event_type: vpn
      events__about__labels__inferences_vpn.value: "-NULL"
      events__about__labels__vpn__type__filter.value: "-NULL"
    sorts: [events.vpn_inferences_count desc]
    limit: 50
    column_limit: 50
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
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.metadata__product_event_type
      VPN Type: events__about__labels__vpn__type.value
    row: 0
    col: 0
    width: 12
    height: 6
  - title: Inferences Over Time
    name: Inferences Over Time
    model: corelight-chronicle
    explore: events
    type: looker_area
    fields: [events.event_timestamp_date, events.vpn_inferences_area_count, events__about__labels__inferences_vpn.value]
    pivots: [events__about__labels__inferences_vpn.value]
    fill_fields: [events.event_timestamp_date]
    filters:
      events.product_event_type: vpn
      events__about__labels__inferences_vpn.value: "-NULL"
      events__about__labels__vpn__type__filter.value: "-NULL"
    sorts: [events__about__labels__inferences_vpn.value, events.event_timestamp_date
        desc]
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
    y_axes: [{label: Count, orientation: left, series: [{axisId: events.vpn_inferences_area_count,
            id: APW - events.vpn_inferences_area_count, name: APW}, {axisId: events.vpn_inferences_area_count,
            id: APWA - events.vpn_inferences_area_count, name: APWA}, {axisId: events.vpn_inferences_area_count,
            id: COM - events.vpn_inferences_area_count, name: COM}, {axisId: events.vpn_inferences_area_count,
            id: PWA - events.vpn_inferences_area_count, name: PWA}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.metadata__product_event_type
      VPN Type: events__about__labels__vpn__type.value
    row: 0
    col: 12
    width: 12
    height: 6
  - title: Top VPN Users
    name: Top VPN Users
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events.principal_count,
      events.principal_count_percent]
    filters:
      events.product_event_type: vpn
      events__about__labels__vpn__type__filter.value: "-NULL"
    sorts: [events.principal_count desc]
    limit: 20
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
      events.principal_count: Count
      events.principal_count_percent: Percent
    series_cell_visualizations:
      events.principal_count:
        is_active: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.metadata__product_event_type
      VPN Type: events__about__labels__vpn__type.value
    row: 6
    col: 0
    width: 12
    height: 6
  - title: VPN Inference Log Data
    name: VPN Inference Log Data
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.event_timestamp_time, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events__about__labels__inferences_vpn.value,
      events.external_link]
    filters:
      events.product_event_type: vpn
      events__about__labels__inferences_vpn.value: "-NULL"
      events__about__labels__vpn__type__filter.value: "-NULL"
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
    column_order: ["$$$_row_numbers_$$$", events.event_timestamp_time, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events__about__labels__inferences_vpn.value,
      events.external_link]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.external_link: Raw Logs
      events.event_timestamp_time: Time
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Destination IP
      events__about__labels__inferences_vpn.value: Inferences
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.metadata__product_event_type
      VPN Type: events__about__labels__vpn__type.value
    row: 12
    col: 0
    width: 24
    height: 5
  - title: VPN JA3 Finger Prints
    name: VPN JA3 Finger Prints
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.network__tls__client__ja3, events.network__tls__server__ja3s,
      events.ja3_count]
    filters:
      events.product_event_type: vpn
      events__about__labels__vpn__type__filter.value: "-NULL"
      events.network__tls__client__ja3: "-NULL"
      events.network__tls__server__ja3s: "-NULL"
    sorts: [events.network__tls__client__ja3]
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
      events.network__tls__client__ja3: ja3
      events.network__tls__server__ja3s: ja3s
      events.ja3_count: Count
    series_cell_visualizations:
      events.ja3_count:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.metadata__product_event_type
      VPN Type: events__about__labels__vpn__type.value
    row: 22
    col: 0
    width: 24
    height: 5
  - title: Largest Transfers Between Host Pairs Over VPN
    name: Largest Transfers Between Host Pairs Over VPN
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.target__port, events.protocol_string, events__target__ip_geo_artifact.location__country_or_region,
      events.target__application, events.resp_bytes_sum, events.orig_bytes_sum, events.gigabyte_count]
    filters:
      events.product_event_type: vpn
      events__about__labels__vpn__type__filter.value: "-NULL"
    sorts: [events.orig_bytes_sum desc]
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
      events.gigabyte_count: Number of Connections
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Destination IP
      events.target__port: Destination Port
      events.protocol_string: Protocol
      events__target__ip_geo_artifact.location__country_or_region: Destination Country
      events.target__application: Service
      events.resp_bytes_sum: Sum of Destination Bytes
      events.orig_bytes_sum: Sum of Source Bytes
    series_cell_visualizations:
      events.gigabyte_count:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.metadata__product_event_type
      VPN Type: events__about__labels__vpn__type.value
    row: 17
    col: 0
    width: 24
    height: 5
  - title: VPN Type
    name: VPN Type
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events__about__labels__vpn__type.value, events.vpn_type_count]
    filters:
      events.product_event_type: vpn
      events__about__labels__vpn__type__filter.value: "-NULL"
    sorts: [events.vpn_type_count desc]
    limit: 50
    column_limit: 50
    value_labels: labels
    label_type: labPer
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
      events.vpn_type_count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
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
      Event Type: events.metadata__product_event_type
      VPN Type: events__about__labels__vpn__type.value
    row: 6
    col: 12
    width: 12
    height: 6
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: vpn
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: popover
      options:
      - vpn
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
      display: popover
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.observer__hostname
  - name: VPN Type
    title: VPN Type
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
    field: events__about__labels__vpn__type.value
