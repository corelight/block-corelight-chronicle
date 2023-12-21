- dashboard: data_exploration__files
  title: Data Exploration - Files
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: pZzeyNoLU69OIoPJQmCPOr
  elements:
  - title: Top 20 Mime Types by File Count
    name: Top 20 Mime Types by File Count
    model: corelight-chronicle
    explore: events
    type: looker_column
    fields: [events__about.file__mime_type, events.mime_type_count]
    filters:
      events__about.file__mime_type: "-NULL,-application/pkix-cert"
      events.metadata__product_event_type: files
      events.is_broadcast: 'No'
    sorts: [events.mime_type_count desc]
    limit: 20
    column_limit: 50
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.mime_type_count,
            id: events.mime_type_count, name: Mime Type Count}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    x_axis_label_rotation: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      'Mime Type ': events__about.file__mime_type_filter
      Event Type: events.product_event_type
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
    row: 2
    col: 0
    width: 14
    height: 7
  - title: Corelight Mime Type to Filename Check
    name: Corelight Mime Type to Filename Check
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.filename_count, events__about.file__mime_type, events__about__file__names.events__about__file__names]
    filters:
      events.metadata__product_event_type: files
      events__about__file__names.events__about__file__names: "-%exe%"
      events__about.file__mime_type: application/x-dosexec
    sorts: [events.filename_count desc 0]
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
      events__about.file__mime_type: Mime Type
      events__about__file__names.events__about__file__names: Filename
      events.filename_count: Count
    series_cell_visualizations:
      events.filename_count:
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
      'Mime Type ': events__about.file__mime_type_filter
      Event Type: events.product_event_type
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
    row: 2
    col: 14
    width: 10
    height: 7
  - title: Top File Protocols by File Count
    name: Top File Protocols by File Count
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.file_protocol_count, events__about__labels__source__files.value]
    filters:
      events__about__labels__source__files.value: "-NULL"
      events__about.file__mime_type: "-application/pkix-cert,-NULL"
      events.metadata__product_event_type: files
    sorts: [events.file_protocol_count desc 0]
    limit: 10
    column_limit: 50
    value_labels: labels
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      'Mime Type ': events__about.file__mime_type_filter
      Event Type: events.product_event_type
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
    row: 9
    col: 8
    width: 8
    height: 6
  - title: Top Receiving (rx_host) Hosts -  Number of Files
    name: Top Receiving (rx_host) Hosts -  Number of Files
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__target__ip.events__target__ip, events.dest_file_count]
    filters:
      events.is_broadcast: 'No'
      events.metadata__product_event_type: files
      events__about.file__mime_type: "-NULL"
    sorts: [events.dest_file_count desc 0]
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
      events__target__ip.events__target__ip: Destination Host
      events.dest_file_count: Destination File Count
    series_cell_visualizations:
      events.dest_file_count:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      'Mime Type ': events__about.file__mime_type_filter
      Event Type: events.product_event_type
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
    row: 23
    col: 0
    width: 13
    height: 6
  - title: Top Transmitting (tx_host) Hosts - Number of Files
    name: Top Transmitting (tx_host) Hosts - Number of Files
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events.src_file_count]
    filters:
      events.is_broadcast: 'No'
      events.metadata__product_event_type: files
      events__about.file__mime_type: "-NULL"
    sorts: [events.src_file_count desc 0]
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
      events__principal__ip.events__principal__ip: Source Host
      events.src_file_count: Source File Count
    series_cell_visualizations:
      events.src_file_count:
        is_active: false
    defaults_version: 1
    listen:
      'Mime Type ': events__about.file__mime_type_filter
      Event Type: events.product_event_type
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
    row: 17
    col: 0
    width: 13
    height: 6
  - title: Top Receiving (dest_host) Hosts - Bytes
    name: Top Receiving (dest_host) Hosts - Bytes
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__target__ip.events__target__ip, events.dest_bytes]
    filters:
      events.is_broadcast: 'No'
      events.metadata__product_event_type: files
      events__about.file__mime_type: "-NULL"
    sorts: [events.dest_bytes desc 0]
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
      events__target__ip.events__target__ip: Destination Host
      events.dest_bytes: Destination Bytes
    series_cell_visualizations:
      events.dest_bytes:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      'Mime Type ': events__about.file__mime_type_filter
      Event Type: events.product_event_type
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
    row: 23
    col: 13
    width: 11
    height: 6
  - title: Top Transmitting (tx_host) Hosts - Bytes
    name: Top Transmitting (tx_host) Hosts - Bytes
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events.src_bytes]
    filters:
      events.is_broadcast: 'No'
      events.metadata__product_event_type: files
      events__about.file__mime_type: "-NULL"
    sorts: [events.src_bytes desc 0]
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
      events__principal__ip.events__principal__ip: Source Host
      events.src_bytes: Source Bytes
    series_cell_visualizations:
      events.src_bytes:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      'Mime Type ': events__about.file__mime_type_filter
      Event Type: events.product_event_type
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
    row: 17
    col: 13
    width: 11
    height: 6
  - title: File Flow - number of Files
    name: File Flow - number of Files
    model: corelight-chronicle
    explore: directions
    type: looker_line
    fields: [directions.file_count, directions.directions_directional, directions.event_timestamp_directions_date]
    pivots: [directions.directions_directional]
    fill_fields: [directions.event_timestamp_directions_date]
    filters:
      directions.directions_directional: "-NULL"
      directions.is_broadcast: "-true"
      directions.file__mime_type_filter: "-NULL"
    sorts: [directions.directions_directional, directions.event_timestamp_directions_date
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
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: directions.file_count,
            id: internal - directions.file_count, name: internal}, {axisId: directions.file_count,
            id: directions.directions_directional___null - directions.file_count,
            name: "∅"}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      Internal - directions.file_count: 'number of File : internal'
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      'Mime Type ': directions.file__mime_type
      Event Type: directions.product_event_type
      Time Range: directions.event_timestamp_directions_time
      Corelight Sensor: directions.observer_host_name_filter_directions
    row: 9
    col: 0
    width: 8
    height: 6
  - title: File Flow - Bytes
    name: File Flow - Bytes
    model: corelight-chronicle
    explore: directions
    type: looker_scatter
    fields: [directions.sum_seen_bytes, directions.directions_directional, directions.event_timestamp_directions_date]
    pivots: [directions.directions_directional]
    fill_fields: [directions.event_timestamp_directions_date]
    filters:
      directions.is_broadcast: "-true"
      directions.directions_directional: "-NULL"
      directions.file__mime_type_filter: "-NULL"
    sorts: [directions.directions_directional, directions.event_timestamp_directions_date
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    y_axes: [{label: '', orientation: left, series: [{axisId: directions.sum_seen_bytes,
            id: internal - directions.sum_seen_bytes, name: internal}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      'Mime Type ': directions.file__mime_type
      Event Type: directions.product_event_type
      Time Range: directions.event_timestamp_directions_time
      Corelight Sensor: directions.observer_host_name_filter_directions
    row: 9
    col: 16
    width: 8
    height: 6
  - name: " (Copy)"
    type: text
    title_text: " (Copy)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Hosts"}],"align":"center","id":1697698291372}]'
    rich_content_json: '{"format":"slate"}'
    row: 15
    col: 0
    width: 24
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Top values"}],"align":"center","id":1697698250405}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: files
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: popover
      options:
      - files
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
  - name: 'Mime Type '
    title: 'Mime Type '
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
    field: events__about.file__mime_type_filter
