view: directions {
  derived_table: {
    sql: SELECT
        events__principal__ip AS events__principal__ip_events__principal__ip,
        events__target__ip AS events__target__ip_events__target__ip,
        events__security_result__detection_fields.value  AS events__security_result__detection_fields_value,
        events__security_result__detection_fields.key  AS events__security_result__detection_fields_key,
        events.metadata.id  AS events_metadata__id_directions,
        events.network.tls.client.server_name  AS events_network__tls__client__server_name,
        events.network.tls.cipher  AS events_network__tls__cipher,
        events.observer.hostname AS events_observer__hostname,
        events.observer.namespace AS events_observer__namespace,
        events__about.file.mime_type AS events_about_mime_type,
        events__about.file.size AS events_file__size,
        events.metadata.vendor_name AS vendor_name,
        events.metadata.product_event_type AS product_event_type,
        events.metadata.event_timestamp.seconds  AS events_metadata__event_timestamp__seconds
      FROM `datalake.events` AS events
      LEFT JOIN UNNEST(events.about) as events__about
      LEFT JOIN UNNEST(events.principal.ip) as events__principal__ip
      LEFT JOIN UNNEST(events.target.ip) as events__target__ip
      LEFT JOIN UNNEST(events__about.file.names) as events__about__file__names
      LEFT JOIN UNNEST(events.security_result) as events__security_result
      LEFT JOIN UNNEST(detection_fields) as events__security_result__detection_fields
      WHERE {% condition namespace_derived %} events.observer.namespace {% endcondition %} AND (events.metadata.product_event_type ) IN('ssl','files') AND (events.metadata.vendor_name = "Corelight" )
      GROUP BY
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14
      ORDER BY
        1 ;;
  }
  dimension: metadata_id_directions {
    primary_key: yes
    type: string
    sql: ${TABLE}.events_metadata__id_directions ;;
  }
  dimension: principal_ip_directions {
    type: string
    sql: ${TABLE}.events__principal__ip_events__principal__ip;;
  }
  dimension: target_ip_directions {
    type: string
    sql: ${TABLE}.events__target__ip_events__target__ip ;;
  }
  dimension: security_result_detection_fields_key_directions {
    type: string
    sql: ${TABLE}.events__security_result__detection_fields_key ;;
  }
  dimension: security_result_detection_fields_value_directions {
    type: string
    sql: ${TABLE}.events__security_result__detection_fields_value ;;
  }
  dimension: network_tls_client_server_directions {
    type: string
    sql: ${TABLE}.events_network__tls__client__server_name ;;
  }
  dimension: network_tls_cipher_directions {
    type: string
    sql: ${TABLE}.events_network__tls__cipher ;;
  }
  dimension_group: event_timestamp_directions {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      hour,
      minute,
      year
    ]
    datatype: epoch
    sql: ${TABLE}.events_metadata__event_timestamp__seconds ;;
  }
  measure: upper_date {
    type: string
    sql: FORMAT_TIMESTAMP("%FT%TZ", TIMESTAMP_ADD(TIMESTAMP_SECONDS(MAX(${TABLE}.events_metadata__event_timestamp__seconds)), INTERVAL 1 SECOND) );;
  }

  measure: lower_date {
    type: string
    sql: FORMAT_TIMESTAMP("%FT%TZ", TIMESTAMP_SECONDS(MIN(${TABLE}.events_metadata__event_timestamp__seconds)) );;
  }
  dimension: observer_host_name_directions {
    type: string
    sql: ${TABLE}.events_observer__hostname ;;
  }
  dimension: observer_host_name_filter_directions {
    type: string
    sql: ${TABLE}.events_observer__hostname ;;
  }
  dimension: namespace_derived {
    type:  string
    sql: ${TABLE}.events_observer__namespace ;;
  }

  dimension: directions_directions {
    type: string
    sql: CASE
          WHEN ${connections_resp.local_resp_conn} = 'true'  AND ${connections_orig.local_orign_conn} = 'true' THEN 'Internal'
          WHEN ${connections_resp.local_resp_conn} = 'false'  AND ${connections_orig.local_orign_conn} = 'false' THEN 'External'
          WHEN ${connections_resp.local_resp_conn} = 'true'  AND ${connections_orig.local_orign_conn} = 'false' THEN 'Inbound'
          WHEN ${connections_resp.local_resp_conn} = 'false'  AND ${connections_orig.local_orign_conn} = 'true' THEN 'Outbound'
        END ;;
  }
  dimension: directions_filter {
    type: string
    sql: CASE
          WHEN ${connections_resp.local_resp_conn} = 'true'  AND ${connections_orig.local_orign_conn} = 'true' THEN 'Internal'
          WHEN ${connections_resp.local_resp_conn} = 'false'  AND ${connections_orig.local_orign_conn} = 'false' THEN 'External'
          WHEN ${connections_resp.local_resp_conn} = 'true'  AND ${connections_orig.local_orign_conn} = 'false' THEN 'Inbound'
          WHEN ${connections_resp.local_resp_conn} = 'false'  AND ${connections_orig.local_orign_conn} = 'true' THEN 'Outbound'
        END ;;
  }
#ssl
  measure: cid_count {
    type: count
    link: {
      label: "View in Chronicle"
      url: "@{CHRONICLE_URL}/search?query=metadata.vendor_name=\"Corelight\"AND metadata.product_event_type=\"ssl\"AND network.tls.client.server_name=\"{{ directions.network_tls_client_server_directions }}\"{% if _filters['directions.observer_host_name_filter_directions'] %} AND observer.hostname=\"{{ _filters['directions.observer_host_name_filter_directions'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}{% if _filters['namespace_derived'] %} AND observer.namespace=\"{{ _filters['namespace_derived'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}&startTime={{ directions.lower_date }}&endTime={{ directions.upper_date }}"
    }
  }
  measure: cid_count_percent {
    type: percent_of_total
    precision: 6
    value_format: "0.000000"
    sql: ${cid_count} ;;
  }

  measure: cipher_count {
    type: count
    group_label: "Cipher count"
    label: "Events"
    html: <p>Count: {{value}}
      </p> ;;
    link: {
      label: "View in Chronicle"
      url: "@{CHRONICLE_URL}/search?query=metadata.vendor_name=\"Corelight\"AND metadata.product_event_type=\"ssl\"AND network.tls.cipher=\"{{ directions.network_tls_cipher_directions }}\"{% if _filters['directions.observer_host_name_filter_directions'] %} AND observer.hostname=\"{{ _filters['directions.observer_host_name_filter_directions'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}{% if _filters['namespace_derived'] %} AND observer.namespace=\"{{ _filters['namespace_derived'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}&startTime={{ directions.lower_date }}&endTime={{ directions.upper_date }}"
    }
  }
  measure: vali_status_count {
    type: count
    link: {
      label: "View in Chronicle"
      url: "@{CHRONICLE_URL}/search?query=metadata.vendor_name=\"Corelight\"AND metadata.product_event_type=\"ssl\"AND security_result.detection_fields[\"validation_status\"]=\"{{ directions.security_result_detection_fields_value_directions }}\"{% if _filters['directions.observer_host_name_filter_directions'] %} AND observer.hostname=\"{{ _filters['directions.observer_host_name_filter_directions'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}{% if _filters['namespace_derived'] %} AND observer.namespace=\"{{ _filters['namespace_derived'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}&startTime={{ directions.lower_date }}&endTime={{ directions.upper_date }}"
    }
  }
  measure: vali_status_count_percent {
    type: percent_of_total
    precision: 6
    value_format: "0.000000"
    sql: ${vali_status_count} ;;
  }
  dimension: directions_directional {
    type: string
    sql: CASE
          WHEN ${connections_resp.local_resp_conn} = 'true'  AND ${connections_orig.local_orign_conn} = 'true' THEN 'internal'
          WHEN ${connections_resp.local_resp_conn} = 'false'  AND ${connections_orig.local_orign_conn} = 'false' THEN 'unknown'
          WHEN ${connections_resp.local_resp_conn} = 'true'  AND ${connections_orig.local_orign_conn} = 'false' THEN 'received'
          WHEN ${connections_resp.local_resp_conn} = 'false'  AND ${connections_orig.local_orign_conn} = 'true' THEN 'sent'
        END ;;
  }
  dimension: is_broadcast {
    type: string
    sql: CASE
          WHEN (${principal_ip_directions} IN ('0.0.0.0', '255.255.255.255') OR ${target_ip_directions} IN ('255.255.255.255', '0.0.0.0')) THEN 'true'
          ELSE 'false'
        END ;;
  }
  dimension: vendor_name {
    sql: ${TABLE}.vendor_name ;;
  }
  dimension: product_event_type {
    sql: ${TABLE}.product_event_type ;;
  }
  measure: sum_seen_bytes{
    type: number
    sql: SUM(${TABLE}.events_file__size);;
    link: {
      label: "View in Chronicle"
      url: "@{CHRONICLE_URL}/search?query=metadata.vendor_name=\"{{vendor_name}}\"AND metadata.product_event_type=\"{{ product_event_type }}\"AND observer.hostname!=\"\"AND about.file.mime_type!=\"\"{% if _filters['observer_host_name_filter_directions'] %} AND observer.hostname=\"{{ _filters['observer_host_name_filter_directions'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}{% if _filters['file__mime_type'] %} AND about.file.mime_type=\"{{ _filters['file__mime_type'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}{% if _filters['namespace_derived'] %} AND observer.namespace=\"{{ _filters['namespace_derived'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}&startTime={{ lower_date }}&endTime={{ upper_date }}"
    }
  }
  dimension: file__mime_type {
    type: string
    sql: ${TABLE}.events_about_mime_type ;;
    group_label: "File"
    group_item_label: "Mime Type"
  }
  dimension: file__mime_type_filter {
    type: string
    sql: ${TABLE}.events_about_mime_type ;;
    group_label: "File"
    group_item_label: "Mime Type Filter"
  }
  measure: file_count {
    type: count
    group_label: "file_count"
    label: "Count"
    link: {
      label: "View in Chronicle"
      url: "@{CHRONICLE_URL}/search?query=metadata.vendor_name=\"{{vendor_name}}\"AND metadata.product_event_type=\"{{ product_event_type }}\"AND observer.hostname!=\"\"AND about.file.mime_type!=\"\"{% if _filters['observer_host_name_filter_directions'] %} AND observer.hostname=\"{{ _filters['observer_host_name_filter_directions'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}{% if _filters['file__mime_type'] %} AND about.file.mime_type=\"{{ _filters['file__mime_type'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}{% if _filters['namespace_derived'] %} AND observer.namespace=\"{{ _filters['namespace_derived'] | replace:'\"','' | url_encode }}\"{% else %}{% endif %}&startTime={{ lower_date }}&endTime={{ upper_date }}"
    }
  }
}
# common view for both Files & SSL
view: connections_orig {
  derived_table: {
    sql: SELECT
          events__principal__ip  AS events__principal__ip_events__principal__ip,
          events__about__labels.value  AS events__about__labels_value
        FROM `datalake.events` AS events
        LEFT JOIN UNNEST(events.about) as events__about
        LEFT JOIN UNNEST(events.principal.ip) as events__principal__ip
        LEFT JOIN UNNEST(labels) as events__about__labels
        WHERE (events.metadata.product_event_type ) = 'conn' AND (events__about__labels.key ) = 'local_orig' AND (events.metadata.vendor_name = "Corelight" )
        GROUP BY
         1,
         2
        ORDER BY
         1
    ;;
  }
  dimension: principal_ip_conn {
    type: string
    sql: ${TABLE}.events__principal__ip_events__principal__ip;;
  }
  dimension: local_orign_conn {
    type: string
    sql: ${TABLE}.events__about__labels_value;;
  }
}
# common view for both Files & SSL
view: connections_resp {
  derived_table: {
    sql: SELECT
            events__target__ip  AS events__target__ip_events__target__ip,
            events__about__labels.value  AS events__about__labels_value
        FROM `datalake.events` AS events
        LEFT JOIN UNNEST(events.about) as events__about
        LEFT JOIN UNNEST(events.target.ip) as events__target__ip
        LEFT JOIN UNNEST(labels) as events__about__labels
        WHERE (events.metadata.product_event_type ) = 'conn' AND (events__about__labels.key ) = 'local_resp' AND (events.metadata.vendor_name = "Corelight" )
        GROUP BY
            1,
            2
        ORDER BY
            1;;
  }
  dimension: target_ip_conn {
    type: string
    sql: ${TABLE}.events__target__ip_events__target__ip;;
  }
  dimension: local_resp_conn {
    type: string
    sql: ${TABLE}.events__about__labels_value;;
  }
}
