- dashboard: security_workflows__log_hunting
  title: Security Workflows - Log Hunting
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: NvxRWbPzDWu5kUm7iG29lU
  elements:
  - title: Filtered Corelight data for this unique entity
    name: Filtered Corelight data for this unique entity
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.metadata__product_event_type, events.source_count_pie]
    sorts: [events.metadata__product_event_type]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_product_event_type
      based_on: events.metadata__product_event_type
      expression: ''
      label: Count of Metadata Product Event Type
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
    color_application:
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: 87654122-8144-4720-8259-82ac9908d5f4
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_colors: {}
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Time Range: events.event_time_time
      UID, FUID: events__about__labels__uid.value
      Event Type: events.metadata__product_event_type
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
    row: 0
    col: 0
    width: 12
    height: 6
  - title: All Corelight data for this unique entity
    name: All Corelight data for this unique entity
    model: corelight-chronicle
    explore: events
    type: looker_bar
    fields: [events.metadata__product_event_type, events.source_count]
    sorts: [events.source_count desc 0]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - measure: count_of_metadata_product_event_type
      based_on: events.metadata__product_event_type
      expression: ''
      label: Count of Metadata Product Event Type
      type: count_distinct
      _kind_hint: measure
      _type_hint: number
    - args:
      - events.source_count
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: events.source_count
      label: Percent of Events Source Count
      source_field: events.source_count
      table_calculation: percent_of_events_source_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    y_axes: [{label: Count, orientation: bottom, series: [{axisId: events.count, id: events.count,
            name: Events}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Event Type
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    series_labels:
      events.source_count: Count
    value_labels: labels
    label_type: lab
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Time Range: events.event_time_time
      UID, FUID: events__about__labels__uid.value
      Event Type: events.metadata__product_event_type
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
    row: 0
    col: 12
    width: 12
    height: 6
  - title: Log Data
    name: Log Data
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.event_time_time, events.metadata__product_event_type, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.target__port, events.metadata__id,
      events__about__labels__uid__only.value, events__about__labels__fuid__only.value,
      events.external_link]
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
    column_order: ["$$$_row_numbers_$$$", events.event_time_time, events.metadata__product_event_type,
      events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.target__port, events__about__labels__uid__only.value, events__about__labels__fuid__only.value,
      events.external_link]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.event_time_time: Time
      events.metadata__product_event_type: Event Type
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Destination IP
      events.target__port: Destination Port
      events.external_link: Raw Logs
      events__about__labels__uid__only.value: UID
      events__about__labels__fuid__only.value: FUID
    series_column_widths:
      events.external_link: 15
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [events.metadata__id]
    listen:
      Time Range: events.event_time_time
      UID, FUID: events__about__labels__uid.value
      Event Type: events.metadata__product_event_type
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
    row: 6
    col: 0
    width: 24
    height: 8
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
  - name: Event Type
    title: Event Type
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
    field: events.metadata__product_event_type
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
  - name: UID, FUID
    title: UID, FUID
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
    field: events__about__labels__uid.value
