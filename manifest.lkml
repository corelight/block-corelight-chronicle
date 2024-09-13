project_name: "corelight-chronicle"

constant: CONNECTION_NAME{
  value: "chronicle"
  export: override_required
}

constant: DATASET_NAME{
  value: "datalake"
}

constant: CHRONICLE_URL{
  value: "https://{your_tenant}.backstory.chronicle.security"
  export: override_required
}

constant: EVENTS {
  value: "@{DATASET_NAME}.events"
}
constant: ENTITY_GRAPH {
  value: "@{DATASET_NAME}.entity_graph"
}

visualization: {
  id: "single_value_custom_viz"
  label: "Single Value Custom Viz"
  file: "custom_visualization/single_value_custom_viz.js"
  dependencies: [
    "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.js",
    "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.js",
    "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/helpers.js",
    "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/helpers.min.js",
  ]
}
