- dashboard: data_insights__name_resolution_insights
  title: Data Insights - Name Resolution Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: rjoErNL3n1mHN70b00uoef
  elements:
  - title: Unusual Query Types Found
    name: Unusual Query Types Found
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__qtype_name.value, events__target__ip.events__target__ip,
      events__principal__ip.events__principal__ip, events__network__dns__questions.name,
      count_of_metadata_id, events.unusual_qtypes_external_link]
    filters:
      events.metadata__product_event_type: dns
      events__about__labels__qtype_name.value: AXFR,IXFR,ANY,TXT
    sorts: [events__principal__ip.events__principal__ip desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      measure: count_of_metadata_id
      type: count_distinct
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
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
      events__about__labels__qtype_name.value: Qtype
      events__principal__ip.events__principal__ip: Source
      events__target__ip.events__target__ip: Responder
      events__network__dns__questions.name: Query
      count_of_metadata_id: Count
      events.unusual_qtypes_external_link: Raw Logs
    series_cell_visualizations:
      count_of_metadata_id:
        is_active: false
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 5
    col: 12
    width: 12
    height: 6
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"Unusual DNS query types can indicate
      misconfigurations, experimental features, or potential security threats like
      data exfiltration or tunneling. Analysts should scrutinize such queries for
      anomalies and address identified risks to safeguard network security."}],"id":"vyr30"}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 16
    width: 8
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    body_text: '<h4 style="font-size:22px; margin-top:30px; font-style:normal;">DNS
      Hygiene</h4>

      '
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Unusual Qtypes
    name: Unusual Qtypes
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.name_resolution_unusual_qtypes_count]
    filters:
      events.metadata__product_event_type: dns
      events__about__labels__qtype_name.value: AXFR,IXFR,ANY,TXT
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      measure: count_of_metadata_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Unusual Qtypes
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 2
    col: 12
    width: 4
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"DNS servers actively responding
      in the network are key to secure operations, translating domain names to IP
      addresses and directing traffic. It also logs the number of queries and unique
      clients interacting with the DNS servers, offering insights into possible rogue
      DNS servers and detecting patterns that may suggest data exfiltration attempts."}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 4
    width: 8
    height: 3
  - title: Responding DNS Servers
    name: Responding DNS Servers
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events__target__ip.responding_dns_servers_count]
    filters:
      events.metadata__product_event_type: dns
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events__target__ip.events__target__ip
      expression: ''
      label: Count of Events Target IP
      measure: count_of_events_target_ip
      type: count_distinct
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
    note_state: collapsed
    note_display: hover
    note_text: Responding DNS Servers
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 2
    col: 0
    width: 4
    height: 3
  - title: NXDOMAIN Responses
    name: NXDOMAIN Responses
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.nxdomain_responses_count]
    filters:
      events.metadata__product_event_type: dns
      events__about__labels__rcode_name.value: NXDOMAIN,NOERROR
    limit: 500
    column_limit: 50
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
    note_state: collapsed
    note_display: hover
    note_text: NXDOMAIN Responses
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 11
    col: 0
    width: 4
    height: 3
  - title: DNS Servers Actively Responding to Queries
    name: DNS Servers Actively Responding to Queries
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__target__ip.events__target__ip, count_of_name, count_of_events_principal_ip,
      events.Internal, events__target__ip_geo_artifact.location__country_or_region,
      events__target__ip.responding_dns_servers_external_link]
    filters:
      events.metadata__product_event_type: dns
    sorts: [count_of_events_principal_ip desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events__principal__ip.events__principal__ip
      expression: ''
      label: Count of Events Principal IP
      measure: count_of_events_principal_ip
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: events__network__dns__questions.name
      expression: ''
      label: Count of Name
      measure: count_of_name
      type: count_distinct
    - category: table_calculation
      expression: coalesce(${events__target__ip_geo_artifact.location__country_or_region},
        "Unknown")
      label: Country
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: country
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", events__target__ip.events__target__ip, count_of_name,
      count_of_events_principal_ip, country, events.Internal, events__target__ip.responding_dns_servers_external_link]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width:
    series_labels:
      events__target__ip.events__target__ip: Destination
      events__target__ip_location.country_or_region: Country
      count_of_events_principal_ip: "# of Unique Clients"
      count_of_name: "# of Queries"
      events__target__ip.responding_dns_servers_external_link: Raw Logs
    series_cell_visualizations:
      count_of_principal_hostname:
        is_active: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_fields: [events__target__ip_geo_artifact.location__country_or_region]
    hidden_pivots: {}
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 5
    col: 0
    width: 12
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"High rates of DNS NXDOMAIN responses
      might suggest misconfigured domains, typographical errors in network requests,
      or malicious activities such as DNS reconnaissance. Close examination is advised
      to correct configurations or identify security incidents. Review DNS logs for
      patterns, validate domain configurations, and check endpoint security for signs
      of malware."}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 11
    col: 4
    width: 8
    height: 3
  - title: Network Evidence for NXDOMAIN Responses
    name: Network Evidence for NXDOMAIN Responses
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.formatted_metadata_id_count, events__network__dns__questions.name, events.network__dns__response,
      events.nxdomain_responses_external_link]
    filters:
      events.metadata__product_event_type: dns
      events__about__labels__rcode_name.value: NXDOMAIN
    sorts: [events.formatted_metadata_id_count desc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
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
      events__principal__ip.events__principal__ip: Source
      events__target__ip.events__target__ip: Responder
      events__network__dns__questions.name: Query
      events.formatted_metadata_id_count: Count
      events.network__dns__response: Rejected?
      events.nxdomain_responses_external_link: Raw Logs
    series_cell_visualizations: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 14
    col: 0
    width: 12
    height: 6
  - name: " (5)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"Long DNS query response times may
      indicate network congestion, server performance issues, or potential security
      threats. Timely analysis is crucial for maintaining optimal network performance
      and security. Investigate extended response times by examining server configurations,
      network traffic, and potential external attacks."}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 11
    col: 16
    width: 8
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"Failed DNS queries may point to
      misconfigurations, outdated systems, or security threats such as network infiltration
      or DNS poisoning. Analysts should investigate the sources and patterns of these
      failures to identify and remediate underlying causes, thereby ensuring network
      integrity and security."}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 20
    col: 4
    width: 8
    height: 3
  - title: Failed DNS Queries
    name: Failed DNS Queries
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.failed_dns_queries_count]
    filters:
      events.metadata__product_event_type: dns
      events__about__labels__rcode_name.value: SERVFAIL,REFUSED,FORMERR,NOTIMP,NOTAUTH
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      measure: count_of_metadata_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Failed DNS Queries
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 20
    col: 0
    width: 4
    height: 3
  - title: Network Evidence for Failed DNS Queries
    name: Network Evidence for Failed DNS Queries
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__rcode_name.value, events.last_principal_ip, events.last_target_ip,
      events.last_query, count_of_metadata_id_2, events.failed_dns_queries_external_link]
    filters:
      events.metadata__product_event_type: dns
      events__about__labels__rcode_name.value: SERVFAIL,REFUSED,FORMERR,NOTIMP,NOTAUTH
    sorts: [events__about__labels__rcode_name.value]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      measure: count_of_metadata_id
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      measure: count_of_metadata_id_2
      type: count_distinct
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
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
      events__about__labels__rcode_name.value: Response
      events.failed_dns_queries_external_link: Raw Logs
      count_of_metadata_id_2: Count
      events.last_principal_ip: Source
      events.last_target_ip: Responder
      events.last_query: Query
    series_cell_visualizations:
      count_of_metadata_id_2:
        is_active: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 23
    col: 0
    width: 12
    height: 6
  - title: DNS Query Volume Over Time
    name: DNS Query Volume Over Time
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.dns_query_volume_count]
    filters:
      events.metadata__product_event_type: conn
      events.network__application_protocol: '3000'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      measure: count_of_metadata_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      count_of_metadata_id:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: DNS Query Volume Over Time
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 20
    col: 12
    width: 4
    height: 3
  - name: " (7)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"Monitor total DNS-related network
      traffic in MB/GB. Sudden spikes or unusual patterns could signal configuration
      errors, compromised devices making excessive queries, or potential data exfiltration
      attempts.","fontSize":"14px","backgroundColor":"transparent","color":"hsl(0,
      0%, 0%)"}],"id":"gkb6k"}]'
    rich_content_json: '{"format":"slate"}'
    row: 20
    col: 16
    width: 8
    height: 3
  - title: Monitoring Query Types by AVG Time
    name: Monitoring Query Types by AVG Time
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.monitoring_query_type_by_average_time_count, events.event_timestamp_date]
    fill_fields: [events.event_timestamp_date]
    filters:
      events.metadata__product_event_type: dns
    sorts: [events.event_timestamp_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      measure: count_of_metadata_id
      type: count_distinct
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Count, orientation: left, series: [{axisId: events.monitoring_query_type_by_average_time_count,
            id: events.monitoring_query_type_by_average_time_count, name: Monitoring
              Query Type By Average Time Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      events.monitoring_query_type_by_average_time_count: Count
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 23
    col: 12
    width: 12
    height: 6
  - title: Monitoring DNS Query Response Times > 15ms
    name: Monitoring DNS Query Response Times > 15ms
    model: corelight-chronicle
    explore: avg_rtt
    type: single_value
    fields: [avg_rtt.count]
    filters:
      avg_rtt.avg_rtt: ">0.015"
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Monitoring DNS Query Response Times > 15ms
    listen:
      Global Time Restriction: avg_rtt.time_derived
      Sensor: avg_rtt.sensor_name_derived
      Namespace: avg_rtt.namespace_derived
    row: 11
    col: 12
    width: 4
    height: 3
  - title: Monitoring Query Types by AVG Time
    name: Monitoring Query Types by AVG Time (2)
    model: corelight-chronicle
    explore: avg_rtt
    type: looker_grid
    fields: [avg_rtt.Query, avg_rtt.Responder, avg_rtt.avg_rtt]
    filters:
      avg_rtt.avg_rtt: ">0.015"
    sorts: [avg_rtt.Query]
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
      avg_rtt.avg_rtt: Avg. Response Time (ms)
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: ''
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Monitoring Query Types by AVG Time
    listen:
      Global Time Restriction: avg_rtt.time_derived
      Sensor: avg_rtt.sensor_name_derived
      Namespace: avg_rtt.namespace_derived
    row: 14
    col: 12
    width: 12
    height: 6
  filters:
  - name: Global Time Restriction
    title: Global Time Restriction
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
  - name: Sensor
    title: Sensor
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
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
