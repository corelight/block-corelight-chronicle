- dashboard: sensor_overview__rates
  title: Sensor Overview - Rates
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: TMBOnbQYgVnoU9TuaUDKpx
  elements:
  - title: Log Rates
    name: Log Rates
    model: corelight-chronicle
    explore: events
    type: looker_area
    fields: [events.event_timestamp_time, events.logs_conn, events.logs_dce_rpc, events.logs_dhcp,
      events.logs_dnp3, events.logs_dns, events.logs_dpd, events.logs_files, events.logs_ftp,
      events.logs_http, events.logs_irc, events.logs_kerberos, events.logs_modbus,
      events.logs_mysql, events.logs_ntlm, events.logs_pe, events.logs_radius, events.logs_rdp,
      events.logs_rfb, events.logs_sip, events.logs_smb_files, events.logs_smb_mapping,
      events.logs_smtp, events.logs_snmp, events.logs_socks, events.logs_software,
      events.logs_ssh, events.logs_ssl, events.logs_syslog, events.logs_traceroute,
      events.logs_tunnel, events.logs_weird, events.logs_x509]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_bro"'
    sorts: [events.event_timestamp_time desc]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Entries per Second, orientation: left, series: [{axisId: events.logs_conn,
            id: events.logs_conn, name: Conn}, {axisId: events.logs_dce_rpc, id: events.logs_dce_rpc,
            name: DCE/RPC}, {axisId: events.logs_dhcp, id: events.logs_dhcp, name: DHCP},
          {axisId: events.logs_dnp3, id: events.logs_dnp3, name: DNP3}, {axisId: events.logs_dns,
            id: events.logs_dns, name: DNS}, {axisId: events.logs_dpd, id: events.logs_dpd,
            name: DPD}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    hide_legend: false
    swap_axes: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 0
    col: 0
    width: 24
    height: 7
  - title: Combined Traffic Volume - Monitor Interfaces
    name: Combined Traffic Volume - Monitor Interfaces
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.monitor_total_mbps]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_iface"'
    sorts: [events.event_timestamp_time desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Mbps per Second, orientation: left, series: [{axisId: events.monitor_total_mbps,
            id: events.monitor_total_mbps, name: Monitor Traffic Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 96,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Corelight Sensor: events.observer__hostname
      Time Range: events.event_timestamp_time
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 7
    col: 0
    width: 12
    height: 6
  - title: Combined Traffic Volume - Monitor Interfaces - Packets
    name: Combined Traffic Volume - Monitor Interfaces - Packets
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.monitor_total_kpps, events.monitor_total_drops_kpps]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_iface"'
    sorts: [events.event_timestamp_time desc]
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: KPackets per Second, orientation: left, series: [{axisId: events.monitor_total_kpps,
            id: events.monitor_total_kpps, name: Monitor Traffic Packet Rate}, {axisId: events.monitor_total_drops_kpps,
            id: events.monitor_total_drops_kpps, name: Monitor Traffic Drop Rate}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      events.monitor_total_drops_kpps: "#EA4335"
      events.monitor_total_kpps: "#079c98"
    defaults_version: 1
    listen:
      Corelight Sensor: events.observer__hostname
      Time Range: events.event_timestamp_time
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 7
    col: 12
    width: 12
    height: 6
  - title: Traffic Volume - Management Interface
    name: Traffic Volume - Management Interface
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.in_bytes_mbps, events.out_bytes_mbps]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_iface"'
    sorts: [events.event_timestamp_time desc]
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Kbps per Second, orientation: left, series: [{axisId: events.in_bytes_mbps,
            id: events.in_bytes_mbps, name: Inbound Traffic Rate}, {axisId: events.out_bytes_mbps,
            id: events.out_bytes_mbps, name: Outbound Traffic Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      events.in_bytes_mbps: "#ecfa18"
      events.out_bytes_mbps: "#7CB342"
    defaults_version: 1
    listen:
      Corelight Sensor: events.observer__hostname
      Time Range: events.event_timestamp_time
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 13
    col: 0
    width: 12
    height: 6
  - title: Traffic Volume - Management Interface - Packets
    name: Traffic Volume - Management Interface - Packets
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.in_packets_kpps, events.out_packets_kpps]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_iface"'
    sorts: [events.event_timestamp_time desc]
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
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: KPackets per Second, orientation: left, series: [{axisId: events.in_packets_kpps,
            id: events.in_packets_kpps, name: Inbound Traffic Packet Rate}, {axisId: events.out_packets_kpps,
            id: events.out_packets_kpps, name: Outbound Traffic Packet Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      events.in_packets_kpps: "#9174F0"
      events.out_packets_kpps: "#B1399E"
    defaults_version: 1
    listen:
      Corelight Sensor: events.observer__hostname
      Time Range: events.event_timestamp_time
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 13
    col: 12
    width: 12
    height: 6
  - title: File Extraction
    name: File Extraction
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.files_total, events.files_s3, events.files_sftp]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_bro"'
    sorts: [events.event_timestamp_time desc]
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: "# of Files", orientation: left, series: [{axisId: events.files_total,
            id: events.files_total, name: Extracted Files}, {axisId: events.files_s3,
            id: events.files_s3, name: Queued Files for Amazon S3}, {axisId: events.files_sftp,
            id: events.files_sftp, name: Queued Files for SFTP}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      events.files_total: "#1e6bc9"
      events.files_sftp: "#E52592"
      events.files_s3: "#E8710A"
    defaults_version: 1
    listen:
      Corelight Sensor: events.observer__hostname
      Time Range: events.event_timestamp_time
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 19
    col: 0
    width: 12
    height: 6
  - title: Log Entries Export Queue
    name: Log Entries Export Queue
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.splunk_export, events.syslog_export,
      events.json_export, events.kafka_export, events.investigator_export, events.kinesis_export,
      events.hec_export, events.elasticsearch_export]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_bro"'
    sorts: [events.event_timestamp_time desc]
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: 'Avg # of Entries in Queue', orientation: left, series: [{axisId: events.splunk_export,
            id: events.splunk_export, name: Splunk}, {axisId: events.syslog_export,
            id: events.syslog_export, name: Syslog}, {axisId: events.json_export,
            id: events.json_export, name: JSON}, {axisId: events.kafka_export, id: events.kafka_export,
            name: Kafka}, {axisId: events.investigator_export, id: events.investigator_export,
            name: Investigator}, {axisId: events.kinesis_export, id: events.kinesis_export,
            name: Kinesis}, {axisId: events.hec_export, id: events.hec_export, name: HEC},
          {axisId: events.elasticsearch_export, id: events.elasticsearch_export, name: Elasticsearch}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Corelight Sensor: events.observer__hostname
      Time Range: events.event_timestamp_time
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 19
    col: 12
    width: 12
    height: 6
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: '"corelight_metrics_iface","corelight_metrics_bro"'
    allow_multiple_values: true
    required: true
    ui_config:
      type: tag_list
      display: popover
      options:
      - corelight_metrics_iface
      - corelight_metrics_bro
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.product_event_type_filter
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
