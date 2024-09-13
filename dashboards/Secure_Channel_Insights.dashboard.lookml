- dashboard: data_insights__secure_channel_insights
  title: Data Insights - Secure Channel Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: JKazg3zmyCYMpNmAezQixa
  elements:
  - title: Less Secure Ciphers
    name: Less Secure Ciphers
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.formatted_cipher_count]
    filters:
      events.metadata__product_event_type: ssl
      events.match_cipher: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.network__tls__cipher
      expression: ''
      label: Count of Network Tls Cipher
      measure: count_of_network_tls_cipher
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
    note_display: above
    note_text: Less Secure Ciphers
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 2
    col: 12
    width: 5
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <h4 style="font-size:22px; margin-top:30px; font-style:normal;">Encrypted
      Traffic Notables</h4>
    row: 0
    col: 0
    width: 17
    height: 2
  - title: Less Secure Ciphers Seen in the Period
    name: Less Secure Ciphers Seen in the Period
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.network__tls__cipher, events.last_target_ip, events__about__labels__uid__only.distinct_uid_only_count,
      events.values_host_type_less_secure_cipher, events.values_direction_less_secure_cipher,
      events.metadata_id_count, events.less_secure_cipher_seen_in_the_period_link]
    filters:
      events.metadata__product_event_type: ssl
      events.match_cipher: 'Yes'
      events.network__tls__cipher: "-NULL"
    sorts: [events__about__labels__uid__only.distinct_uid_only_count desc]
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
    - category: measure
      expression: ''
      label: Unique_Conns
      based_on: events__about__labels__fuid__only.value
      _kind_hint: measure
      measure: unique_conns
      type: count_distinct
      _type_hint: number
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
    minimum_column_width:
    series_labels:
      events.network__tls__cipher: Cipher
      events.last_target_ip: Dest IP
      events__about__labels__uid__only.distinct_uid_only_count: Unique Conns
      events.values_host_type_less_secure_cipher: Host Type
      events.values_direction_less_secure_cipher: Direction
      events.less_secure_cipher_seen_in_the_period_link: Raw Logs
      events.metadata_id_count: Count
    series_cell_visualizations: {}
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 5
    col: 12
    width: 12
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"SSL/TLS sessions utilizing weak
      cipher suites (eg. RC4) are easily decrypted. This traffic may indicate the
      presence of old and/or unpatched resources on the network. It could also be
      the result of a successful downgrade attack."}],"id":"m8tm6"}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 17
    width: 7
    height: 3
  - title: Connections Using Less Secure TLS Versions (< TLS12)
    name: Connections Using Less Secure TLS Versions (< TLS12)
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.formatted_connections_using_less_secure_tls_versions]
    filters:
      events.metadata__product_event_type: ssl
      events__principal__ip.events__principal__ip: "-NULL"
      events.version_status: "-%Secure%"
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
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Connections Using Less Secure TLS Versions (< TLS1.2)
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
      Traffic Direction (Only for TLS Versions): events.connection_type
    row: 11
    col: 0
    width: 5
    height: 3
  - title: Network Evidence for All TLS Versions Seen
    name: Network Evidence for All TLS Versions Seen
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.network__tls__version, events.version_status, events.connection_type,
      events__about__labels__uid__only.formatted_uid_only_count, events.values_ip_classification,
      events.all_tls_versions_link]
    filters:
      events.metadata__product_event_type: ssl
      events__principal__ip.events__principal__ip: "-NULL"
    sorts: [events__about__labels__uid__only.formatted_uid_only_count desc]
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
    column_order: ["$$$_row_numbers_$$$", events.network__tls__version, events.connection_type,
      events__about__labels__uid__only.formatted_uid_only_count, events.values_ip_classification,
      events.version_status]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.version_status: Classification
      events.connection_type: Traffic Direction
      events.values_ip_classification: Responder Location
      events__about__labels__uid__only.formatted_uid_only_count: Counter
      events.network__tls__version: Version
      events.network_evidence_for_all_tls_versions_link: Raw Logs
      events.all_tls_versions_link: Raw Logs
    series_cell_visualizations: {}
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
      Traffic Direction (Only for TLS Versions): events.connection_type
    row: 14
    col: 0
    width: 12
    height: 6
  - title: Interactive Sessions and Keystrokes
    name: Interactive Sessions and Keystrokes
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events__about__labels__uid__only.distinct_uid_only_count]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: KS,AUTO
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
    note_state: collapsed
    note_display: above
    note_text: Interactive Sessions and Keystrokes
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 11
    col: 12
    width: 5
    height: 3
  - title: Network Evidence for Interactive Sessions and Keystrokes - SSH Inferences
    name: Network Evidence for Interactive Sessions and Keystrokes - SSH Inferences
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__uid__only.value, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.values_inference, events.values_description,
      events.metadata_id_count, events.interactive_sessions_and_keystrokes_link]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: KS,AUTO
    sorts: [events.metadata_id_count desc]
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
    column_order: ["$$$_row_numbers_$$$", events__about__labels__uid__only.value,
      events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.values_inference, events.values_description, events.metadata_id_count,
      events.interactive_sessions_and_keystrokes_link]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width:
    series_labels:
      events__about__labels__uid__only.value: UID
      events__target__ip.events__target__ip: Dest IP
      events__principal__ip.events__principal__ip: Src IP
      events.metadata_id_count: Count
      events.network_evidence_for_interactive_sessions_and_keystrokes_link: Raw Logs
      events.interactive_sessions_and_keystrokes_link: Raw Logs
      events.values_inference: Inferences
      events.values_description: Description
    series_cell_visualizations:
      events__about__labels__uid__only.distinct_uid_only_count:
        is_active: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 14
    col: 12
    width: 12
    height: 6
  - title: Network Evidence for Self Signed Internal Certificates
    name: Network Evidence for Self Signed Internal Certificates
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.network__tls__client__server_name, events__target__ip.events__target__ip,
      events__security_result__detection_fields_validation_status.value, is_ip_internal_external.dest_host_type,
      events.values_traffic_direction, events.self_signed_certs_table_link]
    filters:
      events.metadata__product_event_type: ssl
      events__security_result__detection_fields_validation_status.value: self signed
        certificate
      events__target__ip.events__target__ip: "-NULL"
      is_ip_internal_external.is_dest_internal: 'true'
      events.network__tls__client__server_name: "-NULL"
    sorts: [events__target__ip.events__target__ip]
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
    minimum_column_width:
    series_labels:
      events.network__tls__client__server_name: Subject
      events__target__ip.events__target__ip: Destination
      events__security_result__detection_fields_validation_status.value: Status
      is_ip_internal_external.dest_host_type: Destination Host Type
      events.traffic_direction: Traffic Direction
      events.values_traffic_direction: Traffic Direction
      events.self_signed_certs_table_link: Raw Logs
    series_cell_visualizations:
      events.self_signed_certs_table__link:
        is_active: false
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 23
    col: 0
    width: 12
    height: 6
  - title: Self Signed Certs
    name: Self Signed Certs
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.formatted_self_signed_certs]
    filters:
      events.metadata__product_event_type: ssl
      events__security_result__detection_fields_validation_status.value: self signed
        certificate
      is_ip_internal_external.is_dest_internal: 'true'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(${count_of_network_tls_client_server_name})
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
      is_disabled: true
    - _kind_hint: measure
      _type_hint: number
      based_on: events.network__tls__client__server_name
      expression: ''
      label: Count of Network Tls Client Server Name
      measure: count_of_network_tls_client_server_name
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
    series_labels:
      events.network__tls__client__server_name: Subject
      events__target__ip.events__target__ip: Destination
      events__security_result__detection_fields_validation_status.value: Status
      is_ip_internal_external.dest_host_type: Destination_Host_Type
      events.traffic_direction: Traffic_Direction
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Self Signed Certs
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 20
    col: 0
    width: 5
    height: 3
  - title: Possible File Uploaded
    name: Possible File Uploaded
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events__about__labels__uid__only.distinct_uid_only_count]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: SFD,LFD,SFU,LFU
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
    note_state: collapsed
    note_display: above
    note_text: Possible File Uploaded
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 20
    col: 12
    width: 5
    height: 3
  - title: Possible File Transfer
    name: Possible File Transfer
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__uid__only.value, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.values_inference, events.values_description,
      events.metadata_id_count, events.possible_file_transfer_link]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: SFD,LFD,SFU,LFU
    sorts: [events.metadata_id_count desc]
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
    minimum_column_width:
    series_labels:
      events__target__ip.events__target__ip: Dest IP
      events.metadata_id_count: Count
      events.inference: Inference
      events.possible_file_transfer_link: Raw Logs
      events__about__labels__uid__only.value: UID
      events__principal__ip.events__principal__ip: Src IP
      events.values_inference: Inferences
      events.values_description: Description
    series_cell_visualizations:
      events.metadata_id_count:
        is_active: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
  - title: Potential Security Risks
    name: Potential Security Risks
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.formatted_potential_security_risks]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: SC,SP,SV,SA,AFR,BAN
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(${events.row_count})
      label: count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
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
    note_display: above
    note_text: Potential Security Risks
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 29
    col: 12
    width: 5
    height: 3
  - title: SSH Inferences for Potential Security Risks
    name: SSH Inferences for Potential Security Risks
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__uid__only.value, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.values_inference, events.formatted_metadata_id_count,
      events.ssh_inferences_for_potential_security_risks_link]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: SC,SP,SV,SA,AFR,BAN
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
    column_order: ["$$$_row_numbers_$$$", events__about__labels__uid__only.value,
      events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.formatted_metadata_id_count, events.inference]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__about__labels__uid__only.value: UID
      events__principal__ip.events__principal__ip: Src IP
      events__target__ip.events__target__ip: Dest IP
      events.inference: inference
      events.formatted_metadata_id_count: Count
      events.values_inference: Inferences
      events.ssh_inferences_for_potentional_security_risks_link: Raw Logs
      events.ssh_inferences_for_potential_security_risks_link: Raw Logs
    series_cell_visualizations: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 32
    col: 12
    width: 12
    height: 6
  - title: Automated SSH Session Indicators
    name: Automated SSH Session Indicators
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events__about__labels__uid__only.formatted_uid_only_count]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: PKA,AUTO,KS,CTS
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
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Automated SSH Session Indicators
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 38
    col: 0
    width: 5
    height: 3
  - title: SSH Session Inferences
    name: SSH Session Inferences
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__uid__only.value, events.values_prinicpal_ip, events.values_target_ip,
      events.values_inference, events.metadata_id_count, events.values_description,
      events.ssh_session_inferences_link]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: PKA,AUTO,KS,CTS
    sorts: [events.values_prinicpal_ip desc 0]
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
      events__about__labels__uid__only.value: UID
      events.values_prinicpal_ip: Src IPs
      events.values_target_ip: Dest IPs
      events.values_inference: Inferences
      events.metadata_id_count: Count
      events.values_description: Description
      events.ssh_session_inferences_link: Raw Logs
    series_cell_visualizations: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 41
    col: 0
    width: 12
    height: 6
  - title: Advanced Threat Indicators
    name: Advanced Threat Indicators
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events__about__labels__uid__only.formatted_uid_only_count]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: ABP,RSP,RSI,RSIA,RSL,RSK
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
    note_state: collapsed
    note_display: above
    note_text: Advanced Threat Indicators
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 38
    col: 12
    width: 5
    height: 3
  - title: SSH Advanced Threats Inferences
    name: SSH Advanced Threats Inferences
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events__about__labels__uid__only.value, events__principal__ip.events__principal__ip,
      events__target__ip.events__target__ip, events.values_inference, events.metadata_id_count,
      events.values_description, events.ssh_advance_threat_inferences_link]
    filters:
      events.metadata__product_event_type: ssh
      events.inference: ABP,RSP,RSI,RSIA,RSL,RSK
    sorts: [events.metadata_id_count desc 0]
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
    column_order: ["$$$_row_numbers_$$$", events__about__labels__uid__only.value,
      events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events.values_inference, events.metadata_id_count, events.values_description,
      events.ssh_advance_threat_inferences_link]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width:
    series_labels:
      events__about__labels__uid__only.value: UID
      events__principal__ip.events__principal__ip: Src IP
      events__target__ip.events__target__ip: Dest IP
      events.metadata_id_count: Count
      events.ssh_advance_threat_inferences_link: Raw Logs
      events.values_inference: Inferences
      events.values_description: Description
    series_cell_visualizations:
      events.metadata_id_count:
        is_active: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 41
    col: 12
    width: 12
    height: 6
  - name: " (Copy 2)"
    type: text
    title_text: " (Copy 2)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"Connections employing TLS versions
      older than 1.2 are recognized as less secure, presenting a higher risk of being
      compromised. These outdated protocols may indicate legacy systems with configurations
      that are not aligned with modern security standards."}],"id":"e9y2q"}]'
    rich_content_json: '{"format":"slate"}'
    row: 11
    col: 5
    width: 7
    height: 3
  - name: " (Copy 7)"
    type: text
    title_text: " (Copy 7)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"This use case tracks SSH file transfer
      activity (inferences SFD, LFD, SFU, LFU). It uncovers potential data exfiltration
      by attackers or the introduction of malicious files. Focus on file names, sizes,
      unusual source IPs, and sensitive destination systems."}],"id":"26leb"}]'
    rich_content_json: '{"format":"slate"}'
    row: 20
    col: 17
    width: 7
    height: 3
  - name: " (Copy 8)"
    type: text
    title_text: " (Copy 8)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"A SSL certificate that is about
      to expire (default window is 30 days) was observed. Expiration of an SSL certificate
      may result in unexpected behaviour such as refused network connections or unencrypted
      network traffic."}],"id":"1lcjl"}]'
    rich_content_json: '{"format":"slate"}'
    row: 29
    col: 5
    width: 7
    height: 3
  - name: " (Copy 9)"
    type: text
    title_text: " (Copy 9)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"Helps to identify potential advanced
      threat indicators such as Client Authentication Bypass (ABP) and Reverse SSH
      tunneling activities (RSP, RSI, RSIA, RSL, RSK) for in-depth investigation."}],"id":"qwgng"}]'
    rich_content_json: '{"format":"slate"}'
    row: 38
    col: 17
    width: 7
    height: 3
  - name: " (Copy 3)"
    type: text
    title_text: " (Copy 3)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"Monitors for signs of scanning (SC,
      SP, SV, SA), banner messages (BAN), and agent forwarding (AFR) for compliance
      and security risk identification."}],"id":"5wr63"}]'
    rich_content_json: '{"format":"slate"}'
    row: 29
    col: 17
    width: 7
    height: 3
  - name: " (Copy 4)"
    type: text
    title_text: " (Copy 4)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"Highlight interactive sessions (KS)
      and automated interactions (AUTO) to understand the nature of SSH traffic —
      manual vs. automated."}],"id":"icocm"}]'
    rich_content_json: '{"format":"slate"}'
    row: 11
    col: 17
    width: 7
    height: 3
  - name: " (Copy)"
    type: text
    title_text: " (Copy)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"SSL/TLS sessions utilizing weak
      keys are vulnerable to cryptographic attacks. This traffic may indicate the
      presence of old and/or unpatched resources on the network. It could also be
      the result of a successful downgrade attack."}],"id":"706jz"}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 5
    width: 7
    height: 3
  - name: " (Copy 5)"
    type: text
    title_text: " (Copy 5)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"This dashboard panel identifies
      self-signed certificates in use within internal networks, highlighting a key
      security concern due to their lack of third-party validation. Addressing this
      issue by transitioning to certificates from trusted authorities enhances network
      security and trustworthiness."}],"id":"xx8st"}]'
    rich_content_json: '{"format":"slate"}'
    row: 20
    col: 5
    width: 7
    height: 3
  - name: " (Copy 6)"
    type: text
    title_text: " (Copy 6)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"Tracks automated SSH sessions to
      enhance security and operational efficiency, highlighting potential risks and
      compliance issues. It identifies anomalies and unauthorized activities, ensuring
      that automation tools are used securely and efficiently. This tool is crucial
      for SOC analysts to monitor for security breaches and optimize system management."}],"id":"vhu4j"}]'
    rich_content_json: '{"format":"slate"}'
    row: 38
    col: 5
    width: 7
    height: 3
  - title: Network Evidence for Weak Key Length Certs
    name: Network Evidence for Weak Key Length Certs
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [events.network__tls__client__server_name_not_null, events__target__ip.events__target__ip,
      events.target__port, x509_events_only.certificate_key_length, is_ip_internal_external.dest_host_type,
      events.metadata_id_count, events.weak_key_length_certs_link]
    filters:
      events.metadata__product_event_type: ssl
      x509_events_only.certificate_key_length: "<2048"
      is_ip_internal_external.dest_host_type: Internal
      events.connection_type: ''
    sorts: [events.network__tls__client__server_name desc]
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
    minimum_column_width:
    series_labels:
      events__target__ip.events__target__ip: Dest Host
      events.target__port: Resp Port
      x509_events_only.certificate_key_length: Key Length
      is_ip_internal_external.dest_host_type: Host Type
      events.metadata_id_count: Count
      events.network_evidence_for_weak_key_length_certs_link: Raw Logs
      events.weak_key_length_certs_link: Raw Logs
      events.network__tls__client__server_name_not_null: Server Name
    series_cell_visualizations:
      events.metadata_id_count:
        is_active: false
    defaults_version: 1
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 5
    col: 0
    width: 12
    height: 6
  - title: Weak Certs Used Internally
    name: Weak Certs Used Internally
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [count_of_fingerprint]
    filters:
      events.metadata__product_event_type: ssl
      x509_events_only.certificate_key_length: "<2048"
      is_ip_internal_external.dest_host_type: Internal
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: x509_events_only.certificate_key_length
      expression: ''
      label: Count of Certificate Key Length
      measure: count_of_certificate_key_length
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: x509_events_only.fingerprint
      expression: ''
      label: Count of Fingerprint
      measure: count_of_fingerprint
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_labels:
      events.network__tls__client__server_name: Server Name
      events__target__ip.events__target__ip: Dest IP
      events.target__port: Dest Port
      x509_events_only.certificate_key_length: Key Length
      is_ip_internal_external.dest_host_type: Host Type
      events.metadata_id_count: Count
    series_cell_visualizations:
      events.metadata_id_count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: Weak Certs. Used Internally
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 2
    col: 0
    width: 5
    height: 3
  - title: Network Evidence for Self Signed Internal Certificates
    name: Network Evidence for Self Signed Internal Certificates (2)
    model: corelight-chronicle
    explore: events
    type: looker_grid
    fields: [x509_events_only.subject, events__target__ip.events__target__ip, events.values_target_port,
      x509_events_only.max_cert_not_valid_after, x509_events_only.max_cert_day_to_expire,
      events.cert_about_to_expire_table_link]
    filters:
      events.metadata__product_event_type: ssl
      is_ip_internal_external.is_dest_internal: 'true'
      x509_events_only.cert_day_to_expire: "(0,30)"
    sorts: [x509_events_only.max_cert_day_to_expire desc]
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
      x509_events_only.subject: Subject
      events__target__ip.events__target__ip: Host
      events.values_target_port: Port
      x509_events_only.values_cert_not_valid_after: Not Valid After
      x509_events_only.values_cert_day_to_expire: Days to Expire
      events.cert_about_to_expire_table_link: Raw Logs
      x509_events_only.max_cert_not_valid_after: Not Valid After
      x509_events_only.max_cert_day_to_expire: Days to Expire
    series_cell_visualizations: {}
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 32
    col: 0
    width: 12
    height: 6
  - title: Certificates About to Expire
    name: Certificates About to Expire
    model: corelight-chronicle
    explore: events
    type: single_value
    fields: [events.formatted_certificates_about_to_expire]
    filters:
      events.metadata__product_event_type: ssl
      is_ip_internal_external.is_dest_internal: 'true'
      x509_events_only.cert_day_to_expire: "(0,30)"
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
    note_state: collapsed
    note_display: above
    note_text: Certificates About to Expire
    listen:
      Global Time Restriction: events.event_timestamp_time
      Sensor: events.observer__hostname
      Namespace: events.observer__namespace
    row: 29
    col: 0
    width: 5
    height: 3
  - type: button
    name: button_1903
    rich_content_json: '{"text":"For Further Investigations -- SSH Inferences","description":"","newTab":true,"alignment":"center","size":"small","style":"FILLED","color":"#1A73E8","href":"/dashboards/corelight-chronicle::ssh_inferences_overview?Event+Type=ssh&Time+Range=24+hour&SSH+Inferences="}'
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
  - name: Traffic Direction (Only for TLS Versions)
    title: Traffic Direction (Only for TLS Versions)
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
    field: events.connection_type
