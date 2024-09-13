- dashboard: security_overview
  title: Security Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: fXbUvSIOyDx9yRfyFhdA0h
  elements:
  - title: Events
    name: Events
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.clevent_events, events.home_events_count, events.metadata__product_event_type]
    filters:
      events.clevent_events: "-NULL"
      events.observer__hostname_for_filter: "-NULL"
    sorts: [events.home_events_count desc]
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
      events.clevent_events: Events
      events.metadata__product_event_type: Event Type
      events.home_events_count: Count
    series_cell_visualizations:
      events.home_events_count:
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
      Time Range: events.event_time_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.metadata__product_event_type
      Namespace: events.observer__namespace
    row: 0
    col: 0
    width: 24
    height: 8
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: intel,notice,"suricata_corelight"
    allow_multiple_values: true
    required: true
    ui_config:
      type: tag_list
      display: popover
      options:
      - intel
      - suricata_corelight
      - notice
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
