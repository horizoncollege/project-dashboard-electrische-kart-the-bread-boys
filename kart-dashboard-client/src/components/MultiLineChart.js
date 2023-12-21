import React from "react";
import { Line } from "react-chartjs-2";
import { Chart as ChartJS } from "chart.js/auto";

function LineChart({ chartData,config }) {
  return <Line data={chartData} options={config.options} />;
}

export default LineChart;