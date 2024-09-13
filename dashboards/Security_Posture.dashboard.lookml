- dashboard: security_posture
  title: Security Posture
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: EoX5ZWvDqNl0DzyAHfj5vR
  elements:
  - title: Self Signed Certs
    name: Self Signed Certs
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_network_tls_client_server_name_2]
    filters:
      events__security_result__detection_fields_validation_status.value: self signed
        certificate
      events.metadata__product_event_type: ssl
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.network__tls__client__server_name
      expression: ''
      label: Count of Network TLS Client Server Name
      measure: count_of_network_tls_client_server_name_2
      type: count_distinct
    filter_expression: "${events__about__labels__uid__only.value} = ${conn_events_search_derived.conn_uids}"
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
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 2
    col: 0
    width: 8
    height: 3
  - title: Certs w/ Low Keys
    name: Certs w/ Low Keys
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_fingerprint_value]
    filters:
      events.metadata__product_event_type: x509
      events__about__labels_certificate_key_length.value_in_integer: "<2048"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count of Fingerprint Value
      based_on: events__about__labels_fingerprint.value
      _kind_hint: measure
      measure: count_of_fingerprint_value
      type: count_distinct
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
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 2
    col: 8
    width: 8
    height: 3
  - title: Expiring Certs
    name: Expiring Certs
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_fingerprint_value]
    filters:
      events.metadata__product_event_type: x509
      events.cert_day_to_expire: "[1,15]"
    sorts: [count_of_value desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count of Fingerprint Value
      based_on: events__about__labels_fingerprint.value
      _kind_hint: measure
      measure: count_of_fingerprint_value
      type: count_distinct
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
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 2
    col: 16
    width: 8
    height: 3
  - title: Encrypted Traffic Over Time
    name: Encrypted Traffic Over Time
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_hour, encrypted_traffic_volume]
    fill_fields: [events.event_timestamp_hour]
    filters:
      events.metadata__product_event_type: ssl
    sorts: [encrypted_traffic_volume desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Encrypted Traffic Volume
      based_on: events.metadata__id
      _kind_hint: measure
      measure: encrypted_traffic_volume
      type: count_distinct
      _type_hint: number
    - category: table_calculation
      expression: coalesce(${encrypted_traffic_volume}, 0)
      label: Encrypted Traffic Volume
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: encrypted_traffic_volume_1
      _type_hint: number
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
    y_axes: [{label: '', orientation: left, series: [{axisId: encrypted_traffic_volume_1,
            id: encrypted_traffic_volume_1, name: Encrypted Traffic Volume}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [encrypted_traffic_volume]
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 11
    col: 0
    width: 24
    height: 7
  - title: TLS Versions
    name: TLS Versions
    model: corelight-chronicle
    explore: events
    type: looker_pie
    fields: [count, events.version_status]
    filters:
      events.metadata__product_event_type: ssl
    sorts: [count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count
      based_on: events.metadata__id
      _kind_hint: measure
      measure: count
      type: count_distinct
      _type_hint: number
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 5
    col: 0
    width: 12
    height: 6
  - title: Internal TLS Version Profile
    name: Internal TLS Version Profile
    model: corelight-chronicle
    explore: events
    type: looker_column
    fields: [count, events.version_status]
    filters:
      events.metadata__product_event_type: ssl
    sorts: [count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count
      based_on: events.metadata__id
      _kind_hint: measure
      measure: count
      type: count_distinct
      _type_hint: number
    filter_expression: "${events__about__labels__uid__only.value}= ${conn_events_search_derived.conn_uids}"
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
    y_axes: [{label: '', orientation: left, series: [{axisId: count, id: count, name: Count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 5
    col: 12
    width: 12
    height: 6
  - title: Unencrypted Connections
    name: Unencrypted Connections
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events__about__labels__uid__only.unencrypted_connections_count]
    filters:
      events.metadata__product_event_type: '"etc_viz"'
      events__about__labels_viz_stats.value: C,Cc,C!,cc
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
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 20
    col: 0
    width: 8
    height: 3
  - title: Telnet Sessions
    name: Telnet Sessions
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.talnet_session_count]
    filters:
      events.metadata__product_event_type: conn
      events.target__port: '23'
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
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 20
    col: 8
    width: 8
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h4 style="font-size:22px; margin-top:30px; font-style:normal; text-align:left;">Encrypted
      Traffic Hygiene</h4>

      '
    row: 0
    col: 0
    width: 18
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h4 style="font-size:22px; margin-top:30px; font-style:normal; text-align:left;">Unencrypted
      Traffic Hygiene - Indicators</h4>

      '
    row: 18
    col: 0
    width: 18
    height: 2
  - title: FTP Sessions
    name: FTP Sessions
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events__about__labels__uid__only.ftp_session_count]
    filters:
      events.metadata__product_event_type: ftp
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
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 20
    col: 16
    width: 8
    height: 3
  - title: Top Unencrypted Protocols Used
    name: Top Unencrypted Protocols Used
    model: corelight-chronicle
    explore: events
    type: looker_area
    fields: [events.event_timestamp_hour, events__about__labels__service.value, events.metadata_id_count]
    pivots: [events__about__labels__service.value]
    fill_fields: [events.event_timestamp_hour]
    filters:
      events.metadata__product_event_type: conn
      events__about__labels__service.value: -ssl,-dns,-tls,-"ssl,http",-"http,ssl"
    sorts: [events__about__labels__service.value, events.event_timestamp_hour desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${events.metadata_id_count}, 0)
      label: Unencrypted Traffic Volume
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: unencrypted_traffic_volume
      _type_hint: number
    filter_expression: matches_filter(${events__about__labels__service.value}, `-NULL`)
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
    legend_position: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: unencrypted_traffic_volume,
            id: dce_rpc - unencrypted_traffic_volume, name: dce_rpc}, {axisId: unencrypted_traffic_volume,
            id: dhcp - unencrypted_traffic_volume, name: dhcp}, {axisId: unencrypted_traffic_volume,
            id: 'gssapi,krb,smb,dce_rpc - unencrypted_traffic_volume', name: 'gssapi,krb,smb,dce_rpc'},
          {axisId: unencrypted_traffic_volume, id: 'gssapi,smb - unencrypted_traffic_volume',
            name: 'gssapi,smb'}, {axisId: unencrypted_traffic_volume, id: 'gssapi,smb,krb
              - unencrypted_traffic_volume', name: 'gssapi,smb,krb'}, {axisId: unencrypted_traffic_volume,
            id: http - unencrypted_traffic_volume, name: http}, {axisId: unencrypted_traffic_volume,
            id: krb_tcp - unencrypted_traffic_volume, name: krb_tcp}, {axisId: unencrypted_traffic_volume,
            id: 'krb,smb,gssapi - unencrypted_traffic_volume', name: 'krb,smb,gssapi'},
          {axisId: unencrypted_traffic_volume, id: 'krb,smb,gssapi,dce_rpc - unencrypted_traffic_volume',
            name: 'krb,smb,gssapi,dce_rpc'}, {axisId: unencrypted_traffic_volume,
            id: 'ntlm,gssapi,smb - unencrypted_traffic_volume', name: 'ntlm,gssapi,smb'},
          {axisId: unencrypted_traffic_volume, id: ntp - unencrypted_traffic_volume,
            name: ntp}, {axisId: unencrypted_traffic_volume, id: smb - unencrypted_traffic_volume,
            name: smb}, {axisId: unencrypted_traffic_volume, id: 'smb,gssapi - unencrypted_traffic_volume',
            name: 'smb,gssapi'}, {axisId: unencrypted_traffic_volume, id: 'smb,gssapi,krb
              - unencrypted_traffic_volume', name: 'smb,gssapi,krb'}, {axisId: unencrypted_traffic_volume,
            id: spicy_ipsec_ike_udp - unencrypted_traffic_volume, name: spicy_ipsec_ike_udp},
          {axisId: unencrypted_traffic_volume, id: spicy_stun - unencrypted_traffic_volume,
            name: spicy_stun}, {axisId: unencrypted_traffic_volume, id: ssh - unencrypted_traffic_volume,
            name: ssh}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [events__about__labels__service.value___null - unencrypted_traffic_volume]
    hidden_fields: [events.metadata_id_count]
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
    hidden_pivots: {}
    listen:
      Sensor: events.observer__hostname
      Global Time Restriction: events.event_timestamp_time
      Namespace: events.observer__namespace
    row: 23
    col: 0
    width: 24
    height: 6
  - title: Failed DNS Queries
    name: Failed DNS Queries
    model: corelight-chronicle
    explore: events
    type: corelight-dashboards::single_value_custom_viz
    fields: [events.failed_dns_queries, events.event_timestamp_date]
    fill_fields: [events.event_timestamp_date]
    filters:
      events.metadata__product_event_type: dns
      events__about__labels__rcode_name.value: SERVFAIL,REFUSED,FORMERR,NOTIMP,NOTAUTH
      events.event_timestamp_date: 15 days
    sorts: [events.event_timestamp_date desc]
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
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 31
    col: 0
    width: 6
    height: 5
  - title: Internal DNS Servers
    name: Internal DNS Servers
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [numberofinternaldnsservers]
    filters:
      events.metadata__product_event_type: dns
      events.target__port: '53,5353'
      events__target__ip.events__target__ip: "-NULL"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: NumberOfInternalDnsServers
      based_on: events__target__ip.events__target__ip
      _kind_hint: measure
      measure: numberofinternaldnsservers
      type: count_distinct
      _type_hint: number
    filter_expression: "${events__about__labels__uid__only.value} = ${conn_events_search_derived.conn_uids}"
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
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 31
    col: 18
    width: 6
    height: 5
  - title: Unusual Qtypes
    name: Unusual Qtypes
    model: corelight-chronicle
    explore: events
    type: corelight-dashboards::single_value_custom_viz
    fields: [events.event_timestamp_date, events.unusual_qtypes_count]
    fill_fields: [events.event_timestamp_date]
    filters:
      events.metadata__product_event_type: dns
      events__about__labels__qtype_name.value: AXFR,IXFR,ANY,TXT
      events.event_timestamp_date: 15 days
    sorts: [events.event_timestamp_date desc]
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
    show_view_names: false
    defaults_version: 0
    listen:
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 31
    col: 6
    width: 6
    height: 5
  - title: Outbound VPN Connections
    name: Outbound VPN Connections
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.metadata_id_count, events.event_timestamp_hour]
    fill_fields: [events.event_timestamp_hour]
    filters:
      events.metadata__product_event_type: vpn
    sorts: [events.event_timestamp_hour desc]
    limit: 5000
    column_limit: 50
    filter_expression: "${events__about__labels__uid__only.value} = ${conn_events_search_derived_outbound.conn_uids}"
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Count, orientation: left, series: [{axisId: events.metadata_id_count,
            id: events.metadata_id_count, name: Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      events.metadata_id_count: Count
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
    hidden_fields:
    hidden_pivots: {}
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 58
    col: 0
    width: 24
    height: 6
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h4 style="font-size:22px; margin-top:30px; font-style:normal; text-align:left;">DNS
      Hygiene</h4>

      '
    row: 29
    col: 0
    width: 18
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h4 style="font-size:22px; margin-top:30px; font-style:normal; text-align:left;">Remote
      Management Hygiene</h4>

      '
    row: 46
    col: 0
    width: 18
    height: 2
  - title: RDP Authentication Attempts
    name: RDP Authentication Attempts
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_hour, events.auth_result, events.rdp_authentication_attempts_count]
    pivots: [events.auth_result]
    fill_fields: [events.event_timestamp_hour]
    filters:
      events.metadata__product_event_type: rdp
      events__about__labels__auth__success.value: "-NULL"
    sorts: [events.auth_result, events.event_timestamp_hour desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Count, orientation: left, series: [{axisId: events.rdp_authentication_attempts_count,
            id: Failure - events.rdp_authentication_attempts_count, name: Failure},
          {axisId: events.rdp_authentication_attempts_count, id: Success - events.rdp_authentication_attempts_count,
            name: Success}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Failure - count: "#EA4335"
      Success - count: "#06b20e"
      Success - events.rdp_authentication_attempts_count: "#00AB49"
      Failure - events.rdp_authentication_attempts_count: "#dc4e41"
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
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 64
    col: 0
    width: 24
    height: 7
  - title: NXDOMAIN Responses
    name: NXDOMAIN Responses
    model: corelight-chronicle
    explore: events
    type: corelight-dashboards::single_value_custom_viz
    fields: [events.event_timestamp_date, events.nxdomain_responses]
    fill_fields: [events.event_timestamp_date]
    filters:
      events.metadata__product_event_type: dns
      events__about__labels__rcode_name.value: NXDOMAIN,NOERROR
      events.event_timestamp_date: 15 days
    sorts: [events.event_timestamp_date desc]
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
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 31
    col: 12
    width: 6
    height: 5
  - title: Geolocation of DNS Responses
    name: Geolocation of DNS Responses
    model: corelight-chronicle
    explore: events
    type: looker_google_map
    fields: [events.metadata_id_count, events__target__ip_geo_artifact.target_location]
    filters:
      events.metadata__product_event_type: dns
      events.target__location__region_latitude: not 0
      events.target__location__region_longitude: not 0
    sorts: [events.metadata_id_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${events.metadata_id_count}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    hidden_fields: [events.metadata_id_count]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    map_marker_color: ["#24963f"]
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 0
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 36
    col: 0
    width: 18
    height: 10
  - title: Top VPN Destinations by Country
    name: Top VPN Destinations by Country
    model: corelight-chronicle
    explore: events
    type: looker_bar
    fields: [events.metadata_id_count, events__target__ip_geo_artifact.location__country_or_region]
    filters:
      events.metadata__product_event_type: vpn
      events__target__ip_geo_artifact.location__country_or_region: "-NULL"
    sorts: [events.metadata_id_count desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      args:
      - events.metadata_id_count
      based_on: events.metadata_id_count
      calculation_type: percent_of_column_sum
      category: table_calculation
      label: Percent of Events Metadata ID Count
      source_field: events.metadata_id_count
      table_calculation: percent_of_events_metadata_id_count
      value_format:
      value_format_name: percent_0
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
    stacking: normal
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
    y_axes: [{label: Count, orientation: bottom, series: [{axisId: events.metadata_id_count,
            id: events.metadata_id_count, name: Count}, {axisId: percent_of_events_metadata_id_count,
            id: percent_of_events_metadata_id_count, name: Percent}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Country
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_colors:
      percent_of_events_metadata_id_count: "#ffa600"
      events.metadata_id_count: "#1a53ff"
      events.country_count_percentage: "#00b7c7"
    series_labels:
      events.metadata_id_count: Count
      percent_of_events_metadata_id_count: Percent
      events.country_count_percentage: Percent
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 48
    col: 0
    width: 24
    height: 10
  - title: ''
    name: " (5)"
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__target__ip_geo_artifact.target_country_or_region_not_null, events.metadata_id_count]
    filters:
      events.metadata__product_event_type: dns
    sorts: [events.metadata_id_count desc 0]
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
    minimum_column_width: 75
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      events__target__ip_geo_artifact.target_country_or_region_not_null: Country
      events.metadata_id_count: Count
    series_column_widths:
      events__target__ip_geo_artifact.target_country_or_region_not_null: 168
    series_cell_visualizations:
      events.metadata_id_count:
        is_active: false
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 36
    col: 18
    width: 6
    height: 10
  - type: button
    name: button_1508
    rich_content_json: '{"text":"Secure Channel Insights. ➔","description":"","newTab":true,"alignment":"center","size":"small","style":"FILLED","color":"#1A73E8","href":"/dashboards/corelight-chronicle::data_insights__secure_channel_insights"}'
    row: 0
    col: 18
    width: 6
    height: 2
  - type: button
    name: button_1509
    rich_content_json: '{"text":"Name Resolution Insights. ➔","description":"","newTab":true,"alignment":"center","size":"small","style":"FILLED","color":"#1A73E8","href":"/dashboards/corelight-chronicle::data_insights__name_resolution_insights"}'
    row: 29
    col: 18
    width: 6
    height: 2
  - type: button
    name: button_1510
    rich_content_json: '{"text":"Remote Activity Insights. ➔","description":"","newTab":true,"alignment":"center","size":"small","style":"FILLED","color":"#1A73E8","href":"/dashboards/corelight-chronicle::data_insights__remote_activity_insights"}'
    row: 46
    col: 18
    width: 6
    height: 2
  - type: button
    name: button_1511
    rich_content_json: '{"text":"Secure Channel Insights. ➔","description":"","newTab":true,"alignment":"center","size":"small","style":"FILLED","color":"#1A73E8","href":"/dashboards/corelight-chronicle::data_insights__secure_channel_insights"}'
    row: 18
    col: 18
    width: 6
    height: 2
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
      display: popover
      options: []
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.observer__namespace
