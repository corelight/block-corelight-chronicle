- dashboard: data_insights__remote_activity_insights
  title: Data Insights - Remote Activity Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: JZtH5KJx9lHTtVOF2v9m1W
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: '<h4 style="font-size:22px; margin-top:30px; font-style:normal;">Remote
      Access Hygiene</h4>

      '
    row: 0
    col: 0
    width: 17
    height: 2
  - title: RDP Authentication Attempts
    name: RDP Authentication Attempts
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_metadata_id]
    filters:
      events.metadata__product_event_type: rdp
      events.auth_result_insights: "-Unknown"
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
    note_state: collapsed
    note_display: hover
    note_text: Total count of RDP success and failed actions within the specified
      time
    listen:
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
      Global Time Restriction: events.event_timestamp_time
    row: 2
    col: 0
    width: 4
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"Monitoring RDP authentications is
      crucial for identifying unauthorized access and distinguishing between successful
      and failed login attempts. Security teams should analyze trends and cross-reference
      user activity for rapid response and mitigation."}],"id":"1yjoy"}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 4
    width: 8
    height: 3
  - title: Failed vs Successful Authentications
    name: Failed vs Successful Authentications
    model: corelight-chronicle
    explore: events
    type: looker_line
    fields: [events.auth_result_insights, events.event_timestamp_hour, events.rdp_authentication_attempts_insights_count]
    pivots: [events.auth_result_insights]
    filters:
      events.metadata__product_event_type: rdp
      events.auth_result_insights: "-Unknown"
      events.rdp_authentication_attempts_insights_count: NOT NULL
    sorts: [events.auth_result_insights, events.event_timestamp_hour desc]
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
    - category: table_calculation
      expression: coalesce(${count_of_metadata_id}, 0)
      label: Sum
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: sum
      _type_hint: number
      is_disabled: true
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
    y_axes: [{label: Count, orientation: left, series: [{axisId: sum, id: Failure
              - sum, name: Failure}, {axisId: sum, id: Success - sum, name: Success}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_colors:
      Failure - sum: "#EA4335"
      Success - sum: "#7CB342"
      Failure - events.rdp_authentication_attempts_insights_count: "#EA4335"
      Success - events.rdp_authentication_attempts_insights_count: "#7CB342"
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Total count of RDP success and failed actions within the specified
      time
    listen:
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
      Global Time Restriction: events.event_timestamp_time
    row: 5
    col: 0
    width: 12
    height: 6
  - title: ''
    name: " (3)"
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__cookie.value, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events__about__labels__auth__success.value,
      events.combine_results_vpn, count_of_metadata_id, events.identify_failed_rdp_login_external_link]
    filters:
      events.metadata__product_event_type: rdp
      events__about__labels__cookie.value: "-NULL"
    sorts: [count_of_metadata_id desc]
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
    filter_expression: ${events__about__labels__auth__success.value} = "false" OR
      ${events__about__labels__cookie.value} = "SSL_NOT_ALLOWED_BY_SERVER"
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
      events__about__labels__cookie.value: User
      events__principal__ip.events__principal__ip: Source
      events__target__ip.events__target__ip: Destination
      events__about__labels__auth__success.value: Auth Success?
      count_of_metadata_id: Count
      events__about__labels__result.value: Result
      events.identify_failed_rdp_login_external_link: Raw Logs
      events.combine_results_vpn: Result
    series_cell_visualizations:
      count_of_metadata_id:
        is_active: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Total count of users with login failures within the specified time
    title_hidden: true
    listen:
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
      Global Time Restriction: events.event_timestamp_time
    row: 5
    col: 12
    width: 12
    height: 6
  - title: Identifying Failed RDP Logins
    name: Identifying Failed RDP Logins
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_value]
    filters:
      events.metadata__product_event_type: rdp
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
    - _kind_hint: measure
      _type_hint: number
      based_on: events__about__labels__cookie.value
      expression: ''
      label: Count of Value
      measure: count_of_value
      type: count_distinct
    filter_expression: ${events__about__labels__auth__success.value} = "false" OR
      ${events__about__labels__cookie.value} = "SSL_NOT_ALLOWED_BY_SERVER"
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
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width:
    series_labels:
      events__about__labels__cookie.value: User
      events__principal__ip.events__principal__ip: Source
      events__target__ip.events__target__ip: Destination
      events__about__labels__auth__success.value: Auth_Success?
      count_of_metadata_id: Count
      events__about__labels__result.value: Result
    series_cell_visualizations:
      count_of_metadata_id:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Total count of users with login failures within the specified time
    listen:
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
      Global Time Restriction: events.event_timestamp_time
    row: 2
    col: 12
    width: 4
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"Monitoring failed RDP logins is
      essential for detecting unauthorized access attempts. Security teams should
      analyze patterns of failed entries against user and IP data to identify potential
      breaches. This focus helps in quickly addressing vulnerabilities in RDP security.
      Effective monitoring of these incidents is crucial for maintaining system integrity."}],"id":"2ymyf"}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 16
    width: 8
    height: 3
  - type: button
    name: button_1948
    rich_content_json: '{"text":"For Further Investigations -- VPN Inferences   →","description":"","newTab":true,"alignment":"center","size":"small","style":"FILLED","color":"#1A73E8","href":"/dashboards/corelight-chronicle::security_workflows__vpn_insights"}'
    row: 11
    col: 17
    width: 7
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    body_text: '<h4 style="font-size:22px; margin-top:30px; font-style:normal;">VPN
      Insights</h4>

      '
    row: 11
    col: 0
    width: 17
    height: 2
  - title: Unusual Remote Activity
    name: Unusual Remote Activity
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.unusual_remote_activity_count]
    filters:
      events.metadata__product_event_type: vpn
      events__about__labels__inferences_vpn.value: COM,RW,NSP
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
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Total count of VPN connections that have the following inferences NSP
      - Non-Standard Port RW - Road warrior configuration detected (i.e. Cisco Anyconnect)
      COM - Commercial VPN service occurring at the same time which is deemed suspicious
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 13
    col: 0
    width: 4
    height: 3
  - title: ''
    name: " (6)"
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [count_of_metadata_id, events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events__about__labels__inferences_vpn.value, events__about__labels__vpn__type.value,
      events.unusual_remote_activity_external_link]
    filters:
      events.metadata__product_event_type: vpn
      events__about__labels__inferences_vpn.value: COM,RW,NSP
    sorts: [count_of_metadata_id desc 0]
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
      count_of_metadata_id: Count
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Responder
      events__about__labels__inferences_vpn.value: Inferences
      events__about__labels__vpn__type.value: VPN Type
      events.unusual_remote_activity_external_link: Raw Logs
    series_cell_visualizations:
      count_of_metadata_id:
        is_active: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Total count of VPN connections that have the following inferences NSP
      - Non-Standard Port RW - Road warrior configuration detected (i.e. Cisco Anyconnect)
      COM - Commercial VPN service occurring at the same time which is deemed suspicious
    title_hidden: true
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 16
    col: 0
    width: 12
    height: 6
  - name: " (7)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"The combination of the \"COM\",
      \"RW\", and \"NSP\" inferences in a single VPN connection raises questions:
      Policy Violation: Is the use of commercial VPNs allowed in your organization''s
      security policy? If not, this could indicate a violation. Hidden Activity: Is
      the non-standard port usage an attempt to mask other activities happening over
      the VPN tunnel?"}],"id":"fjtyo"}]'
    rich_content_json: '{"format":"slate"}'
    row: 13
    col: 4
    width: 8
    height: 3
  - title: Suspected Data Exfiltration
    name: Suspected Data Exfiltration
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.suspected_data_exfiltration_count]
    filters:
      events.metadata__product_event_type: vpn
      events__about__labels__inferences_vpn.value: COM,NSP,SK
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events__principal__ip.events__principal__ip
      expression: ''
      label: Count of Events Principal IP
      measure: count_of_events_principal_ip
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
    note_state: collapsed
    note_display: hover
    note_text: Total count of VPN connections using potentially unusual connection
      configurations such as static TLS key auth
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 13
    col: 12
    width: 4
    height: 3
  - title: ''
    name: " (8)"
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.target__location__country_or_region, events__about__labels__vpn__type.value,
      count_of_metadata_id, events.values_inference_vpn, events.suspected_data_exfiltration_external_link]
    filters:
      events.metadata__product_event_type: vpn
      events__about__labels__inferences_vpn.value: COM,NSP,SK
      events__principal__ip.events__principal__ip: "-NULL"
      events__target__ip.events__target__ip: "-NULL"
    sorts: [events__principal__ip.events__principal__ip]
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
    column_order: ["$$$_row_numbers_$$$", events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.values_inference_vpn, events.target__location__country_or_region,
      events__about__labels__vpn__type.value, count_of_metadata_id]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      count_of_metadata_id: Count
      events__about__labels__vpn__type.value: VPN Type
      events.target__location__country_or_region: Responder Country
      events__about__labels__inferences_vpn.value: Inferences
      events__target__ip.events__target__ip: Responder
      events__principal__ip.events__principal__ip: Source
      events.suspected_data_exfiltration_external_link: Raw Logs
      events.values_inference_vpn: Inferences
    series_cell_visualizations:
      count_of_metadata_id:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Total count of VPN connections using potentially unusual connection
      configurations such as static TLS key auth
    title_hidden: true
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 16
    col: 12
    width: 12
    height: 6
  - name: " (9)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"Unmonitored commercial VPNs with
      atypical traffic patterns or static keys could be used to bypass security controls
      for data theft. \n\nInvestigate: Examine VPN sessions with large outgoing transfers,
      focusing on unusual destinations or protocols."}],"id":"7l6gg"}]'
    rich_content_json: '{"format":"slate"}'
    row: 13
    col: 16
    width: 8
    height: 3
  - title: ''
    name: " (10)"
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.protocol_string, events.target__port, events.network__sent_bytes, events.values_inference_vpn,
      count_of_value_2, events.possible_unauthorized_remote_external_link]
    filters:
      events.metadata__product_event_type: vpn
      events__about__labels__inferences_vpn.value: RW,FW
    sorts: [count_of_value_2 desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events__about__labels__uid.value
      expression: ''
      label: Count of Value
      measure: count_of_value
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: events__about__labels__uid.value
      expression: ''
      label: Count of Value
      measure: count_of_value_2
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
      count_of_value: Count
      events__principal__ip.events__principal__ip: Source
      events__target__ip.events__target__ip: Destination
      events.protocol_string: Proto
      events.target__port: Destination Port
      events.network__sent_bytes: Bytes
      count_of_value_2: Count
      events.possible_unauthorized_remote_external_link: Raw Logs
      events.values_inference_vpn: Inferences
    series_cell_visualizations:
      count_of_value:
        is_active: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Total count of VPN connections that are using the RW- Road warrior
      configuration detected (i.e. Cisco Anyconnect) and FW - Firewall subversion
      inferences
    column_order: ["$$$_row_numbers_$$$", events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.protocol_string, events.values_inference_vpn,
      events.target__port, events.network__sent_bytes, count_of_value_2, events.possible_unauthorized_remote_external_link]
    title_hidden: true
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 25
    col: 0
    width: 12
    height: 6
  - name: " (11)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"Monitoring for \"RW\" (Road Warrior)
      and \"FW\" (Firewall subversion) inferences is crucial for detecting potential
      unauthorized access, as these patterns may indicate attempts to bypass security
      controls. Security teams should prioritize correlating these inferences with
      internal IP ranges and device logs to identify suspicious activities."}],"id":"6p3cp"}]'
    rich_content_json: '{"format":"slate"}'
    row: 22
    col: 4
    width: 8
    height: 3
  - title: Possible Unauthorized Remote Access Attempts
    name: Possible Unauthorized Remote Access Attempts
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_value]
    filters:
      events.metadata__product_event_type: vpn
      events__about__labels__inferences_vpn.value: "-NULL"
    limit: 500
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events__about__labels__uid.value
      expression: ''
      label: Count of Value
      measure: count_of_value
      type: count_distinct
    filter_expression: ${events__about__labels__inferences_vpn.value} = "RW" OR ${events__about__labels__inferences_vpn.value}
      = "FW"
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
    note_state: collapsed
    note_display: hover
    note_text: Total count of VPN connections that are using the RW- Road warrior
      configuration detected (i.e. Cisco Anyconnect) and FW - Firewall subversion
      inferences
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 22
    col: 0
    width: 4
    height: 3
  - type: button
    name: button_2035
    rich_content_json: '{"text":"For Further Investigations -- RDP Inferences  →","description":"","newTab":true,"alignment":"center","size":"small","style":"FILLED","color":"#1A73E8","href":"/dashboards/corelight-chronicle::security_workflows__rdp_inferences_overview"}'
    row: 0
    col: 17
    width: 7
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
      display: inline
      options: []
    model: corelight-chronicle
    explore: events
    listens_to_filters: []
    field: events.observer__namespace
