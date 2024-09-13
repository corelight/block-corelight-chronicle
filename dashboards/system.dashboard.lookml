- dashboard: sensor_overview__system
  title: Sensor Overview - System
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: jIDZwegZY4lltnSinXx1wg
  elements:
  - name: Bro CPU Usage
    title: Bro CPU Usage
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.bro_cpu_usage_avg]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_bro"'
      events.observer__hostname: "-NULL"
      events__about__labels.key: cpu
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
    y_axes: [{label: Percent(%), orientation: left, series: [{axisId: events.bro_cpu_usage_avg,
            id: events.bro_cpu_usage_avg, name: Bro CPU Usage Avg}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      events.bro_cpu_usage_avg: Bro CPU Usage
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname__filter
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 0
    col: 12
    width: 12
    height: 6
  - title: Disk Usage
    name: Disk Usage
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.disk_usage_data_avg, events.disk_usage_os_avg]
    filters:
      events.observer__hostname: "-NULL"
      events.metadata__product_event_type: '"corelight_metrics_disk"'
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Percent(%), orientation: left, series: [{axisId: events._disk_usage_os_avg,
            id: events._disk_usage_os_avg, name: " Disk Usage OS Avg"}, {axisId: events.disk_usage_data_avg,
            id: events.disk_usage_data_avg, name: Disk Usage Data Avg}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      events.disk_usage_data_avg: data Disk Usage
    swap_axes: false
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname__filter
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 6
    col: 12
    width: 12
    height: 6
  - name: Memory Usage
    title: Memory Usage
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.memory_usage_avg]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_memory"'
      events.observer__hostname: "-NULL"
      events__about__labels.key: usage
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
    y_axes: [{label: Percent(%), orientation: left, series: [{axisId: events.memory_usage_avg,
            id: events.memory_usage_avg, name: Memory Usage Avg}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      events.memory_usage_avg: Memory Usage
    defaults_version: 1
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname__filter
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 0
    col: 0
    width: 12
    height: 6
  - name: System Temperature
    title: System Temperature
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.event_timestamp_time, events.system_temperature_avg]
    filters:
      events.metadata__product_event_type: '"corelight_metrics_system"'
      events.observer__hostname: "-NULL"
      events__about__labels.key: '"cpu_1_temperature"'
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
    y_axes: [{label: Degree Celsius, orientation: left, series: [{axisId: events.system_temperature_avg,
            id: events.system_temperature_avg, name: CPU1 Temperature}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      events.system_temperature_avg: CPU1 Temperature
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Time Range: events.event_timestamp_time
      Corelight Sensor: events.observer__hostname__filter
      Event Type: events.product_event_type_filter
      Namespace: events.observer__namespace
    row: 6
    col: 0
    width: 12
    height: 6
  filters:
  - name: Event Type
    title: Event Type
    type: field_filter
    default_value: '"corelight_metrics_bro","corelight_metrics_system","corelight_metrics_memory","corelight_metrics_disk"'
    allow_multiple_values: true
    required: true
    ui_config:
      type: tag_list
      display: popover
      options:
      - corelight_metrics_bro
      - corelight_metrics_disk
      - corelight_metrics_memory
      - corelight_metrics_system
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
    listens_to_filters: [Metadata Product Event Type, Event Type]
    field: events.observer__hostname__filter
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
