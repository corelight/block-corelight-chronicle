  // Use Looker's Visualization API
  looker.plugins.visualizations.add({
    id: 'single_value_custom_viz',
    label: 'Single Value Custom Viz',
    create: function(element, config) {
      // Create a container for the count value
      this.container = element.appendChild(document.createElement("div"));
      this.container.setAttribute("id", "count-line-container");

      // Applying Styling to the container
      this.container.style.fontWeight = "normal";
      this.container.style.textAlign = "center";
      this.container.style.padding = "25px";
      this.container.style.display = "flex";
      this.container.style.flexDirection = "column";
      this.container.style.alignItems = "center";

      // Create a container for the text line
      this.textContainer = element.appendChild(document.createElement("div"));
      this.textContainer.setAttribute("id", "text-line-container");
      this.textContainer.style.fontSize = "10px";
      this.textContainer.style.fontWeight = "bold";
      this.textContainer.style.textAlign = "center";
      this.textContainer.style.padding = "5px";
      this.textContainer.style.fontFamily = "Arial";

      // Create a container element for your chart
      this.parentNode = document.createElement("div");
      this.parentNode.style.display = "flex";
      this.parentNode.style.flexDirection = "column";
      this.parentNode.style.alignItems = "center";
      element.appendChild(this.parentNode);

      // Add base CSS for hover underline, initially not applied
      const style = document.createElement('style');
      style.innerHTML = `
        #count-event.hover-underline:hover {
          text-decoration: underline;
        }
      `;
      document.head.appendChild(style);
    },

    updateAsync: function(data, element, config, queryResponse, details, done) {
      var hashcolumn = queryResponse.fields.measure_like[0].name;

      // Calculate the count value from the data
      const count = data.length;

      let list = [];
      let list1 = [];
      for (var i of queryResponse.fields.measures) {
        list.push(i.name);
      }
      data.forEach(function(row) {
        Object.keys(row).forEach(function(key) {
          list1.push(row[key].value);
        });
      });

      // Calculate the percentage value based on the available count
      const estimatedTotalItems = 100;
      var count_of_event = 0;
      if (count && (data[0][hashcolumn].value > 0)) {
        count_of_event = count ? data[0][hashcolumn].value : 0;
      }
      var count_of_event1 = 0;
      if (count != 1 && data[1][hashcolumn].value > 0) {
        count_of_event1 = count ? data[1][hashcolumn].value : 0;
      }
      const count_difference = count_of_event - count_of_event1;
      var percentage = 0;
      if (count != 1 && count_of_event1 > 0) {
        percentage = count ? Math.trunc((count_difference / count_of_event1) * estimatedTotalItems) : 0;
      }

      // Determine the color based on the percentage
      var color;
      if (percentage < 0) {
        color = 'red';
      } else if (percentage == 0) {
        color = '#262D33';
      } else {
        color = 'green';
      }

      const arrowIcon = percentage > 0 ? '➚' : percentage === 0 ? '' : '➘';
      percentage = (count_of_event1 == 0)?'N/A':percentage+'%';

      // Define color for count and line chart
      const color_for_count_and_line = '#262D33';

      // Format the Count of Events
      var formatted_count_of_event;
      if (count_of_event > 999) {
            formatted_count_of_event = (Math.round(count_of_event / 100) / 10).toString() + 'K';
      } else {
            formatted_count_of_event = count_of_event.toString();
      }

      // Display the count and percentage value in the container
      this.container.innerHTML = `
        <div style="display: flex; align-items: center;">
          <div id="count-event" style="font-size:44px; font-family: Arial, Helvetica, sans-serif; color: ${color_for_count_and_line}; cursor: pointer;">${formatted_count_of_event}</div>
          <div style="display: flex; flex-direction: column; align-items: flex-start; margin: 0px 0px 6px 5px">
            <div style="font-size: 20px; font-family: Arial, Helvetica, sans-serif; color: ${color};">${arrowIcon}</div>
            <div style="font-size: 16px; font-family: Arial, Helvetica, sans-serif; text-align: right; color: ${color};">${percentage}</div>
          </div>
        </div>
      `;

      // Extract data from Looker's query response
      var labels = [];
      var datasets = [];
      var xField = queryResponse.fields.dimension_like[0].name;
      var yField = queryResponse.fields.measure_like[0].name;

      // Populate labels and datasets based on your data model
      data.forEach(function(row) {
        datasets.push(row[yField].value ? row[yField].value : 0);
        labels.push(row[xField].value);
      });

      // Determine if the data is Daily or Hourly
      const isHourly = labels.some(label => label.match(/ \d{2}$/));
      this.textContainer.innerText = isHourly ? "Hourly" : "Daily";

      //Reverse the labels and datasets to populate the chart in correct direction
      labels.reverse();
      datasets.reverse();

      // Ensure the chart_container is created only once
      if (!this.chart_container) {
        this.chart_container = document.createElement("canvas");
        this.chart_container.className = "line-chart-container";
        this.parentNode.appendChild(this.chart_container);
      }

      // Initialize or update the Chart.js instance
      var ctx = this.chart_container;
      if (this.chart) {
        this.chart.destroy();
      }
      this.chart = new Chart(ctx, {
        type: "line", // Specify the chart type as a line chart
        data: {
          labels: labels,
          datasets: [{
            label: null,
            data: datasets,
            fill: false,
            borderColor: color_for_count_and_line,
            borderWidth: 2,
            pointRadius: 2,
            tension: 0.1
          }],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            x: {
              display: false, // Hide the X-axis
            },
            y: {
              display: false, // Hide the Y-axis
            },
          },
          plugins: {
            legend: {
              display: false,
            },
            tooltip: {
              enabled: true,
              callbacks: {
                label: function(context) {
                  return `Date: ${context.label}, Count: ${context.raw}`;
                }
              }
            }
          }
        },
      });

      this.chart.canvas.style.height = '50px';
      this.chart.canvas.style.width = '200px';
      // Update the chart
      this.chart.update();

      // Add drill functionality and conditional hover underline
      const countEventElement = document.getElementById('count-event');
      if (data[0][hashcolumn].links && data[0][hashcolumn].links.length > 0) {
        countEventElement.classList.add('hover-underline');
        countEventElement.addEventListener('click', function(event) {
          LookerCharts.Utils.openDrillMenu({
            links: data[0][hashcolumn].links,
            event: event // Pass the click event
          });
        });
      } else {
        countEventElement.classList.remove('hover-underline');
      }

      // Signal the completion of rendering
      done();
    }
  });
