- dashboard: security_workflows__intel
  title: Security Workflows - Intel
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: oWdP0hkm10oEIyuaqVs6ZQ
  elements:
  - title: Intel Logs Over Time
    name: Intel Logs Over Time
    model: corelight-chronicle
    explore: events
    type: looker_area
    fields: [events.intel_log_time_count, events.event_time_date]
    fill_fields: [events.event_time_date]
    filters:
      events.product_event_type: intel
      events__about__labels__indicator__type__filter.value: "-NULL"
      events__about__labels__source__filter.value: "-NULL"
    sorts: [events.event_time_date desc]
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
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: events.intel_log_time_count,
            id: events.intel_log_time_count, name: Events}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Indicator Type: events__about__labels__indicator__type.value
      Indicator: events__about__labels__indicator.value
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Event Type: events.metadata__product_event_type
      Intel Source: events__about__labels__source.value
      Time Range: events.event_timestamp_time
      Destination Port: events.target__port__intel
      Namespace: events.observer__namespace
    row: 0
    col: 0
    width: 14
    height: 6
  - title: Intel Details
    name: Intel Details
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.target__port__intel, events__about__labels__indicator__type.value, events__about__labels__indicator.value,
      events__about__labels__seen__where.value, events__about__labels__confidence.value,
      events__about__labels__catagory.value, events__about__labels__source.value,
      events.intel_details_count]
    filters:
      events.product_event_type: intel
      events__about__labels__indicator__type__filter.value: "-NULL"
      events__about__labels__source__filter.value: "-NULL"
    sorts: [events.intel_details_count desc 0]
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
      events__target__ip.events__target__ip: Destination IP
      events__about__labels__indicator__type.value: Indicator Type
      events__about__labels__seen__where.value: Where
      events__about__labels__indicator.value: Indicator
      events__about__labels__confidence.value: Confidence Score
      events__about__labels__catagory.value: Categories
      events__about__labels__source.value: Sources
      events.intel_details_count: Count
      events.target__port__intel: Port
    series_column_widths:
      events__about__labels__source.value: 107
    series_cell_visualizations:
      events.intel_details_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Indicator Type: events__about__labels__indicator__type.value
      Indicator: events__about__labels__indicator.value
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Event Type: events.metadata__product_event_type
      Intel Source: events__about__labels__source.value
      Time Range: events.event_timestamp_time
      Destination Port: events.target__port__intel
      Namespace: events.observer__namespace
    row: 6
    col: 0
    width: 24
    height: 7
  - title: Log Data
    name: Log Data
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.event_time_time, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.target__port__intel, events__about__labels__confidence.value,
      events.external_link]
    filters:
      events.product_event_type: intel
      events__about__labels__indicator__type__filter.value: "-NULL"
      events__about__labels__source__filter.value: "-NULL"
    sorts: [events__about__labels__confidence.value]
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
      events.event_time_time: Time
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Destination IP
      events__about__labels__confidence.value: Confidence Score
      events.target__port__intel: Destination Port
    defaults_version: 1
    listen:
      Indicator Type: events__about__labels__indicator__type.value
      Indicator: events__about__labels__indicator.value
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Event Type: events.metadata__product_event_type
      Intel Source: events__about__labels__source.value
      Time Range: events.event_timestamp_time
      Destination Port: events.target__port__intel
      Namespace: events.observer__namespace
    row: 13
    col: 0
    width: 24
    height: 7
  - title: Indicators
    name: Indicators
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events__about__labels__indicator__type.value, events.indicator_count]
    filters:
      events.product_event_type: intel
      events__about__labels__indicator__type__filter.value: "-NULL"
      events__about__labels__source__filter.value: "-NULL"
    sorts: [events.indicator_count desc 0]
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
    listen:
      Indicator Type: events__about__labels__indicator__type.value
      Indicator: events__about__labels__indicator.value
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Event Type: events.metadata__product_event_type
      Intel Source: events__about__labels__source.value
      Time Range: events.event_timestamp_time
      Destination Port: events.target__port__intel
      Namespace: events.observer__namespace
    row: 0
    col: 14
    width: 10
    height: 6
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: intel
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: popover
      options:
      - intel
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.metadata__product_event_type
  - name: Time Range
    title: Time Range
    type: field_filter
    default_value: 7 day
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
      display: popover
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
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
    listens_to_filters: [Event Type]
    field: events__target__ip.events__target__ip
  - name: Destination Port
    title: Destination Port
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
    field: events.target__port__intel
  - name: Indicator Type
    title: Indicator Type
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
    field: events__about__labels__indicator__type.value
  - name: Indicator
    title: Indicator
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
    field: events__about__labels__indicator.value
  - name: Intel Source
    title: Intel Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events__about__labels__source.value
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
