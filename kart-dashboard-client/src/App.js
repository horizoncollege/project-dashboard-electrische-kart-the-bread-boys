import React from 'react';
import './App.css';
import BackendConnection from './backend/Backendconnection.ts';
import Logger from './backend/logger.ts';
import { Line } from "react-chartjs-2";
import 'chart.js/auto'; // Import 'chart.js/auto' to include all components


// Create a new logger for app
const log = new Logger("App");

log.Info("Front-end started");

// Connect to the database
const bc = new BackendConnection();

// Fetch all data
async function fetchData() {
  try {
    const receivedData = await bc.GetAllData();
    return receivedData;
  } catch (error) {
    log.error('Error fetching data:', error);
    return [];
  }
}

function App() {
  // Use state so it can update live
  const [data, setData] = React.useState([]);

  // Wait for an update and then fetch the data
  React.useEffect(() => {
    fetchData().then((receivedData) => {
      setData(receivedData);
    });
  }, []);

  // Extract voltage data for chart
  const voltageData = data.map((element) => element.voltage);
  const time = data.map((element) => element.date);
  const timeInHoursMinutesSeconds = data.map((element) => {
    const unixTimestampInSeconds = parseInt(element.time);
    const date = new Date(unixTimestampInSeconds * 1000); // Convert seconds to milliseconds
    const hours = date.getUTCHours();
    const minutes = date.getUTCMinutes();
    const seconds = date.getUTCSeconds();
    
    // Format the hours, minutes, and seconds as a string (e.g., "hh:mm:ss")
    const formattedTime = `${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
    
    return formattedTime;
  });
  

  // Calculate average voltage

  let average = 0;

  for (let index = 0; index < data.length; index++) {
    average += parseInt(data[index].voltage);
  }

  average = average / data.length;


  // Chart data for voltage
  const chartData = {
    labels: data.map((element, index) => `${time[index]} ${timeInHoursMinutesSeconds[index]}`),
    datasets: [
      {
        label: 'Voltage',
        data: voltageData,
        backgroundColor: "#FFFFFF",
        borderColor: "#000000",
      },
    ],
  };

  // Chart options
  const chartOptions = {
    scales: {
      x: [
        {
          type: 'time', // Use 'time' scale for the x-axis
          position: 'bottom',
          time: {
            unit: 'second',
          },
          title: {
            display: true,
            text: 'Time',
          },
        },
      ],
      y: [
        {
          title: {
            display: true,
            text: 'Voltage',
          },
        },
      ],
    },
    plugins: {
      tooltip: {
        callbacks: {
          label: (context) => {
            const label = context.dataset.label || '';
            if (label) {
              return `${label}: ${context.parsed.y}`;
            }
            return `${context.parsed.y}`;
          },
        },
      },
    },
  };

  return (
    <div className="App">
      <h1 className='title'>Kart dashboard</h1>
      <p></p>
      <div className="chart-container">
        <h2>Voltage</h2>
        <Line data={chartData} options={chartOptions} />
        <p>Average: {average.toFixed(2)}V</p>
      </div>
    </div>
  );
}

export default App;
