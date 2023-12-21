- dashboard: security_workflows__rdp_inferences_overview
  title: Security Workflows - RDP Inferences Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: xB2EncZhOBTzd91iFvpx4j
  elements:
  - title: Inferences
    name: Inferences
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events__about__labels.value, events.inferences_count]
    filters:
      events.metadata__vendor_name: Corelight
      events__about__labels.key: inferences
      events.observer__hostname: "-NULL"
      events__about__labels.value: "-NULL"
    sorts: [events.inferences_count desc]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - measure: count_of_value
      based_on: events__about__labels.value
      expression: ''
      label: Count of Value
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
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
    listen:
      Time Range: events.event_timestamp_time
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 0
    col: 0
    width: 12
    height: 5
  - title: Successful Connections
    name: Successful Connections
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_metadata_id]
    filters:
      events.metadata__vendor_name: Corelight
      events__about__labels.key: '"auth_success"'
      events__about__labels.value: 'true'
      events.observer__hostname: "-NULL"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_value
      based_on: events__about__labels.value
      expression: ''
      label: Count of Value
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 5
    col: 0
    width: 7
    height: 4
  - title: Failed Connections
    name: Failed Connections
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_metadata_id]
    filters:
      events.metadata__vendor_name: Corelight
      events__about__labels.key: '"auth_success"'
      events__about__labels.value: 'false'
      events.observer__hostname: "-NULL"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: count_of_value
      based_on: events__about__labels.value
      expression: ''
      label: Count of Value
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 5
    col: 7
    width: 7
    height: 4
  - title: Security Protocols Used
    name: Security Protocols Used
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events__target__labels.value, events.security_protocol_count]
    filters:
      events.metadata__vendor_name: Corelight
      events__target__labels.key: '"security_protocol"'
      events.observer__hostname: "-NULL"
    sorts: [events.security_protocol_count desc 0]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - measure: count_of_value
      based_on: events__target__labels.value
      expression: ''
      label: Count of Value
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
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
    listen:
      Time Range: events.event_timestamp_time
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 9
    col: 0
    width: 24
    height: 5
  - title: Inferences Over Time
    name: Inferences Over Time
    model: corelight-chronicle
    explore: events
    type: looker_area
    fields: [events__about__labels.value, events.event_timestamp_date, events.inferences_over_time_count]
    pivots: [events__about__labels.value]
    fill_fields: [events.event_timestamp_date]
    filters:
      events.metadata__vendor_name: Corelight
      events__about__labels.key: inferences
      events.observer__hostname: "-NULL"
      events__about__labels.value: "-NULL"
    sorts: [events__about__labels.value, events.event_timestamp_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_id
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: APW - count_of_metadata_id,
            id: APW - count_of_metadata_id, name: APW}, {axisId: APWA - count_of_metadata_id,
            id: APWA - count_of_metadata_id, name: APWA}, {axisId: PWA - count_of_metadata_id,
            id: PWA - count_of_metadata_id, name: PWA}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: 'Time'
    x_axis_zoom: false
    y_axis_zoom: false
    x_axis_label_rotation:
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 0
    col: 12
    width: 12
    height: 5
  - title: Connecting Users
    name: Connecting Users
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__connecting__user.value, events.value_count, events__about__labels.value]
    filters:
      events__about__labels.key: '"auth_success"'
      events__about__labels__connecting__user.value: "-EMPTY"
      events.observer__hostname: "-NULL"
    sorts: [events.value_count desc 0]
    limit: 20
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
      events__about__labels__connecting__user.value: Connecting User
      events__about__labels.value: Auth Success
      events.value_count: Count
    series_cell_visualizations:
      events.value_count:
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 5
    col: 14
    width: 10
    height: 4
  - title: RDP Connection Detail
    name: RDP Connection Detail
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__connecting__user.value, events.event_timestamp_time,
      events.observer__hostname, events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.target__port, events__about__labels__inferences.value, events__about__labels__inferences.inference_name,
      events.external_link, events__about__labels__auth__success.value]
    filters:
      events__about__labels.key: '"auth_success"'
      events.observer__hostname: "-NULL"
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
    column_order: [events.event_timestamp_time, events__about__labels__connecting__user.value,
      events.observer__hostname, events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.target__port, events__about__labels__auth__success.value, events__about__labels__inferences.value,
      events__about__labels__inferences.inference_name, events.external_link]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__about__labels__connecting__user.value: Connecting User
      events.event_timestamp_time: Time
      events.observer__hostname: Corelight Sensor
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Destination IP
      events.target__port: Destination Port
      events__about__labels__inferences.value: Inferences
      events__about__labels__inferences.inference_name: Inferences Name
      events.external_link: Raw Logs
      events__about__labels__auth__success.value: Auth Success
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 14
    col: 0
    width: 24
    height: 16
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: rdp
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - rdp
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
    field: events.observer__hostname__filter
