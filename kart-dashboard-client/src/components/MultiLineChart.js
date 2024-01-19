import React from "react";
import { Line } from "react-chartjs-2";
import { Chart as ChartJS } from "chart.js/auto";

// lets react know what kind of chart to use and what to look at when making the chart
function LineChart({ chartData, config }) {
  return <Line data={chartData} options={config.options} />;
}

export default LineChart;