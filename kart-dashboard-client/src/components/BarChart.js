import React from "react";
import { Bar } from "react-chartjs-2";
import { Chart as ChartJS } from "chart.js/auto";

function BarChart({ chartData, config }) {
  return <Bar data={chartData} options={config.options} />;
}

export default BarChart;