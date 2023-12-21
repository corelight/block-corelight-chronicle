- dashboard: connections
  title: Data Exploration - Connections
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Lt7HKKdtNiufliHWilGLb2
  elements:
  - title: Top Services
    name: Top Services
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.service_count, events__about__labels__service.value]
    filters:
      events.target__port: NOT NULL
      events.is_broadcast: 'No'
      events.principal__port: NOT NULL
      events__principal__ip.events__principal__ip: "-NULL"
      events__target__ip.events__target__ip: "-NULL"
      events.observer__hostname: "-NULL"
      events__about__labels__service.value: "-NULL"
    sorts: [events.service_count desc 0]
    limit: 15
    column_limit: 50
    value_labels: labels
    label_type: labPer
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
    show_null_points: true
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Originator IP (id_orig_h): events.principal__ip__filter
      Originator Port (id_orig_p): events.principal__port__filter
      Responder IP (id_resp_h): events.target__ip__filter
      Responder Port (id_resp_p): events.target__port__filter
      Service: events.about__labels__service__filter
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 0
    col: 0
    width: 12
    height: 6
  - title: Top Responder ports
    name: Top Responder ports
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.target__port, events.port_count]
    filters:
      events.target__port: NOT NULL
      events.is_broadcast: 'No'
      events.principal__port: NOT NULL
      events__principal__ip.events__principal__ip: "-NULL"
      events__target__ip.events__target__ip: "-NULL"
      events.observer__hostname: "-NULL"
      events__about__labels__service.value: "-NULL"
    sorts: [events.port_count desc]
    limit: 15
    column_limit: 50
    value_labels: labels
    label_type: labPer
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
    show_null_points: true
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Originator IP (id_orig_h): events.principal__ip__filter
      Originator Port (id_orig_p): events.principal__port__filter
      Responder IP (id_resp_h): events.target__ip__filter
      Responder Port (id_resp_p): events.target__port__filter
      Service: events.about__labels__service__filter
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 0
    col: 12
    width: 12
    height: 6
  - title: 'Top Originators (sources) by # of connections'
    name: 'Top Originators (sources) by # of connections'
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events.principal_ip_count, events__principal__ip.events__principal__ip]
    filters:
      events.target__port: NOT NULL
      events.is_broadcast: 'No'
      events.principal__port: NOT NULL
      events.observer__hostname: "-NULL"
      events__principal__ip.events__principal__ip: "-NULL"
      events__target__ip.events__target__ip: "-NULL"
      events__about__labels__service.value: "-NULL"
    sorts: [events.principal_ip_count desc 0]
    limit: 15
    column_limit: 50
    value_labels: labels
    label_type: labPer
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
    show_null_points: true
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Originator IP (id_orig_h): events.principal__ip__filter
      Originator Port (id_orig_p): events.principal__port__filter
      Responder IP (id_resp_h): events.target__ip__filter
      Responder Port (id_resp_p): events.target__port__filter
      Service: events.about__labels__service__filter
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 6
    col: 0
    width: 12
    height: 6
  - title: 'Top Responders (destinations) by # of connections'
    name: 'Top Responders (destinations) by # of connections'
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [events__target__ip.events__target__ip, events.target_ip_count]
    filters:
      events.target__port: NOT NULL
      events.is_broadcast: 'No'
      events.principal__port: NOT NULL
      events.observer__hostname: "-NULL"
      events__principal__ip.events__principal__ip: "-NULL"
      events__target__ip.events__target__ip: "-NULL"
      events__about__labels__service.value: "-NULL"
    sorts: [events.target_ip_count desc 0]
    limit: 15
    column_limit: 50
    value_labels: labels
    label_type: labPer
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
    show_null_points: true
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Originator IP (id_orig_h): events.principal__ip__filter
      Originator Port (id_orig_p): events.principal__port__filter
      Responder IP (id_resp_h): events.target__ip__filter
      Responder Port (id_resp_p): events.target__port__filter
      Service: events.about__labels__service__filter
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 6
    col: 12
    width: 12
    height: 6
  - title: Top Outbound Data Flows by Originator (id_orig_h) Bytes
    name: Top Outbound Data Flows by Originator (id_orig_h) Bytes
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events__target__ip_geo_artifact.location__country_or_region, events__target__ip_geo_artifact.network__dns_domain,
      events.protocol_string, events.sum_orig_byte]
    filters:
      events.target__port: NOT NULL
      events.is_broadcast: 'No'
      events.principal__port: NOT NULL
      events.internal_external: Outbound
      events__principal__ip.events__principal__ip: "-NULL"
      events__target__ip.events__target__ip: "-NULL"
      events.observer__hostname: "-NULL"
      events.exclude_row: 'No'
      events__about__labels__service.value: "-NULL"
      events.sum_orig_byte: not 0
    sorts: [events.sum_orig_byte desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_network_sent_bytes
      based_on: events.network__sent_bytes
      expression: ''
      label: Sum of Network Sent Bytes
      type: sum
      _kind_hint: measure
      _type_hint: number
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
    column_order: ["$$$_row_numbers_$$$", events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events__target__ip_geo_artifact.location__country_or_region,
      events__target__ip_geo_artifact.network__dns_domain, events.sum_orig_byte, events.protocol_string]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Destination IP
      events__target__ip_geo_artifact.location__country_or_region: Destination Country
      events__target__ip_geo_artifact.network__dns_domain: Destination  Hostname
      events.protocol_string: Proto
      events.sum_orig_byte: Bytes
    series_cell_visualizations:
      events.sum_orig_byte:
        is_active: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Originator IP (id_orig_h): events.principal__ip__filter
      Originator Port (id_orig_p): events.principal__port__filter
      Responder IP (id_resp_h): events.target__ip__filter
      Responder Port (id_resp_p): events.target__port__filter
      Service: events.about__labels__service__filter
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 12
    col: 0
    width: 12
    height: 8
  - title: Top Inbound Data Flows by Originator (id_orig_h) Bytes
    name: Top Inbound Data Flows by Originator (id_orig_h) Bytes
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.protocol_string, events__principal__ip_geo_artifact.location__country_or_region,
      events__principal__ip_geo_artifact.network__dns_domain, events.sum_orig_byte_inbound]
    filters:
      events.target__port: NOT NULL
      events__principal__ip.events__principal__ip: "-NULL"
      events__target__ip.events__target__ip: "-NULL"
      events.principal__port: NOT NULL
      events.is_broadcast: 'No'
      events.internal_external: Inbound
      events.observer__hostname: "-NULL"
      events.exclude_row_inbound: 'No'
      events__about__labels__service.value: "-NULL"
      events.sum_orig_byte_inbound: not 0
    sorts: [events.sum_orig_byte_inbound desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_network_sent_bytes
      based_on: events.network__sent_bytes
      expression: ''
      label: Sum of Network Sent Bytes
      type: sum
      _kind_hint: measure
      _type_hint: number
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
    column_order: ["$$$_row_numbers_$$$", events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events__principal__ip_geo_artifact.location__country_or_region,
      events__principal__ip_geo_artifact.network__dns_domain, events.sum_orig_byte_inbound,
      events.protocol_string]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Destination IP
      events.protocol_string: Proto
      events__principal__ip_geo_artifact.location__country_or_region: Source Country
      events__principal__ip_geo_artifact.network__dns_domain: Source Hostname
      events.sum_orig_byte_inbound: Bytes
    series_cell_visualizations:
      events.sum_orig_byte_inbound:
        is_active: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Originator IP (id_orig_h): events.principal__ip__filter
      Originator Port (id_orig_p): events.principal__port__filter
      Responder IP (id_resp_h): events.target__ip__filter
      Responder Port (id_resp_p): events.target__port__filter
      Service: events.about__labels__service__filter
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 12
    col: 12
    width: 12
    height: 8
  - title: Open/Active Long Lived Connections (requires Long Connections Pkg)
    name: Open/Active Long Lived Connections (requires Long Connections Pkg)
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.protocol_string, events__about__labels.value, events.avg_duration]
    filters:
      events.target__port: NOT NULL
      events__about__labels.key: uid
      events.is_broadcast: 'No'
      events.observer__hostname: "-NULL"
      events.principal__port: NOT NULL
      events__target__ip.events__target__ip: "-NULL"
      events__principal__ip.events__principal__ip: "-NULL"
      events__about__labels__service.value: "-NULL"
    sorts: [events.avg_duration desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_network_sent_bytes
      based_on: events.network__sent_bytes
      expression: ''
      label: Sum of Network Sent Bytes
      type: sum
      _kind_hint: measure
      _type_hint: number
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
    column_order: ["$$$_row_numbers_$$$", events__about__labels.value, events.avg_duration,
      events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.protocol_string]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Destination IP
      events.protocol_string: Proto
      events__about__labels.value: UID
      events.avg_duration: Duration
    series_cell_visualizations:
      events.avg_duration:
        is_active: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Originator IP (id_orig_h): events.principal__ip__filter
      Originator Port (id_orig_p): events.principal__port__filter
      Responder IP (id_resp_h): events.target__ip__filter
      Responder Port (id_resp_p): events.target__port__filter
      Service: events.about__labels__service__filter
      Event Type: events.metadata__product_event_type
      Corelight Sensor: events.observer__hostname__filter
    row: 20
    col: 0
    width: 24
    height: 9
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: conn
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - conn
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
  - name: Source IP
    title: Source IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.principal__ip__filter
  - name: Source Port
    title: Source Port
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.principal__port__filter
  - name: Destination IP
    title: Destination IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.target__ip__filter
  - name: Destination Port
    title: Destination Port
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: [Event Type]
    field: events.target__port__filter
  - name: Service
    title: Service
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
    field: events.about__labels__service__filter
