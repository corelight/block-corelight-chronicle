- dashboard: software
  title: Data Exploration - Software
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: PnBM8UKpvWe69p8mmmzxom
  elements:
  - title: Top Software
    name: Top Software
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events__target__asset__software.name, events.software_count]
    filters:
      events__target__asset__software.name: "-NULL"
    sorts: [events.software_count desc 0]
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
      Software Type: events__target__asset__software.description
      Time Range: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Top Software Versions
    name: Top Software Versions
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__target__asset__software.name, events.software_version_count,
      events.software_version]
    filters:
      events__target__asset__software.name: "-NULL"
    sorts: [events.software_version_count desc 0]
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
      events__target__asset__software.name: Name
      events.software_version: Version
      events.software_version_count: Count
    series_column_widths:
      events.software_version_count: 100
    series_cell_visualizations:
      events.software_version_count:
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname_for_filter
      Software Type: events__target__asset__software.description
      Time Range: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 6
    col: 0
    width: 13
    height: 6
  - title: Top Software Types
    name: Top Software Types
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__target__asset__software.description, events.software_type_count]
    sorts: [events.software_type_count desc 0]
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
      events__target__asset__software.description: Software Type
      events.software_type_count: Count
    series_column_widths:
      events.software_type_count: 100
    series_cell_visualizations:
      events.software_type_count:
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
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname_for_filter
      Software Type: events__target__asset__software.description
      Time Range: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 6
    col: 13
    width: 11
    height: 6
  - title: Software Details
    name: Software Details
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.event_timestamp_time, events.observer__hostname, events__target__asset__ip.events__target__asset__ip,
      events__target__asset__software.name, events.software_version, events__target__asset__attribute__labels_version_addl.value,
      events__target__asset__software.description, events.metadata__id, events.external_link]
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
      events__target__asset__software.description: Software Type
      events__target__asset__attribute__labels_version_addl.value: Version Details
      events.software_version: Version
      events__target__asset__software.name: Name
      events__target__asset__ip.events__target__asset__ip: Source Host
      events.observer__hostname: Sensor Name
      events.event_timestamp_time: Time
      events.external_link: Raw Logs
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
    hidden_fields: [events.metadata__id]
    listen:
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname_for_filter
      Software Type: events__target__asset__software.description
      Time Range: events.event_timestamp_time
      Host (for Software Details): events__target__asset__ip.events__target__asset__ip
      Software (for Software Details): events__target__asset__software.name
      Namespace: events.observer__namespace
    row: 12
    col: 0
    width: 24
    height: 6
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: software
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - software
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
  - name: Software Type
    title: Software Type
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
    field: events__target__asset__software.description
  - name: Host (for Software Details)
    title: Host (for Software Details)
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
    field: events__target__asset__ip.events__target__asset__ip
  - name: Software (for Software Details)
    title: Software (for Software Details)
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
    field: events__target__asset__software.name
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
