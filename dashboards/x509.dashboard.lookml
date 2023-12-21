- dashboard: data_exploration__x509
  title: Data Exploration - x509
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: aXVmW15VXCnYrGDwZRLb7U
  elements:
  - title: x509 Top Subjects
    name: x509 Top Subjects
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.network__tls__server__certificate__subject, events.ssl_subject_count,
      events.ssl_subject_count_percent]
    filters:
      events.network__tls__server__certificate__subject: "-NULL"
      events.observer__hostname: "-NULL"
      events.metadata__product_event_type: x509
    sorts: [events.ssl_subject_count desc]
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
      events.network__tls__server__certificate__subject: SSL Subject
      events.ssl_subject_count: Count
      events.ssl_subject_count_percent: Percent
    series_cell_visualizations:
      events.ssl_subject_count:
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
    hidden_pivots: {}
    listen:
      Time Range: events.event_time_time
      Corelight Sensor: events.observer__hostname_for_filter
      Event Type: events.product_event_type
    row: 0
    col: 0
    width: 13
    height: 6
  - title: x509 Rare Subjects
    name: x509 Rare Subjects
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.network__tls__server__certificate__subject, events.ssl_subject_count,
      events.ssl_subject_count_percent]
    filters:
      events.network__tls__server__certificate__subject: "-NULL"
      events.observer__hostname: "-NULL"
      events.metadata__product_event_type: x509
    sorts: [events.ssl_subject_count]
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
      events.network__tls__server__certificate__subject: SSL Subject
      events.ssl_subject_count: Count
      events.ssl_subject_count_percent: Percent
    series_cell_visualizations:
      events.ssl_subject_count:
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
      Corelight Sensor: events.observer__hostname_for_filter
      Event Type: events.product_event_type
    row: 0
    col: 13
    width: 11
    height: 6
  - title: x509 Expired Certificates
    name: x509 Expired Certificates
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.cert_not_valid_after, events.network__tls__server__certificate__subject,
      events.external_link]
    filters:
      events.metadata__product_event_type: x509
      events.observer__hostname: "-NULL"
      events.certificate_expired: Expired
    sorts: [events.network__tls__server__certificate__subject]
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
      events.cert_not_valid_after_time: Certificate Not Valid After
      events.network__tls__server__certificate__subject: Certificate Subject
      events.cert_not_valid_after: Certificate Not Valid After
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
    listen:
      Time Range: events.event_time_time
      Corelight Sensor: events.observer__hostname_for_filter
      Event Type: events.product_event_type
    row: 6
    col: 0
    width: 24
    height: 7
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: x509
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: popover
      options:
      - x509
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.product_event_type
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
    field: events.observer__hostname_for_filter
