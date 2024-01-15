import React, { useState } from 'react';
import './App.css';
import BackendConnection from './backend/Backendconnection.ts';
import Logger from './backend/logger.ts';
import BarChart from './components/BarChart.js';
import LineChart from './components/MultiLineChart.js';

// Create a new logger for app
const log = new Logger("App");

log.Info("Front-end started");

// Connect to the database
const bc = new BackendConnection();
//fetches data for charts
let UserData = await fetchData(false);

//variable to compare voltage use
let compare = 25;

// This will handle the user's input for the time and date to get the specific data
async function handleDataFromForum(StartTime, EndTime) {
  UserData = await fetchData(true, StartTime, EndTime);
}

// Fetch all data
async function fetchData(specific, StartTime, EndTime) {
  try {
    // Check if user wants specific data or all the data
    if (specific) {
      const receivedData = await bc.GetSpecific(StartTime, EndTime);
      return receivedData;
    } else {
      const receivedData = await bc.GetAllData();
      return receivedData;
    }
  } catch (error) {
    log.Error('Error fetching data:', error);
    return [];
  }
}

function App() {
  // Use state so it can update live
  function handeTimeForum(e) {
    e.preventDefault();
    const StartTime = bc.ConvertDateTimeToUnix(startDate, startTime);
    const EndTime = bc.ConvertDateTimeToUnix(startDate, endTime);
    handleDataFromForum(StartTime, EndTime);
  }

  const [, setData] = React.useState([]);

  // Handle time
  const [startDate, setStartDate] = useState('');
  const [startTime, setStartTime] = useState('');
  const [endTime, setEndTime] = useState('');
  // BarChart
  const [speedData] = useState({
    labels: UserData.map((data) => timeConverter(data.time)),
    datasets: [
      {
        label: "Top speed",
        data: UserData.map((data) => data.gyro_x),
        backgroundColor: [
          "rgba(0, 194, 255, 1)",
        ],
        borderColor: "black",
        borderWidth: 2,
      },
      {
        label: "Average speed",
        data: UserData.map((data) => data.gyro_y),
        backgroundColor: [
          "rgba(255, 184, 0, 1)",
        ],
        borderColor: "black",
        borderWidth: 2,
      },
      {
        label: "Speed",
        data: UserData.map((data) => data.gyro_z),
        backgroundColor: [
          "rgba(218, 77, 77, 1)",
        ],
        borderColor: "black",
        borderWidth: 2,
      },
    ],
  });

  const speed = {
    options: {
      plugins: {
        legend: {
          labels: {
            color: "white",
          }
        }
      },
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        y: {
          type: 'linear',
          display: true,
          position: 'left',
          ticks: { color: "white", beginAtZero: true }
        },
        x: {
          ticks: { color: 'white', beginAtZero: true }
        },
      },
    },
  };

<<<<<<< Updated upstream
=======
  function handleSubmit(e) {
    e.preventDefault();
    alert('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

  }
>>>>>>> Stashed changes

  function timeConverter(timestamp) {
    let a = new Date(timestamp * 1000);
    let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    let year = a.getFullYear();
    let month = months[a.getMonth()];
    let date = a.getDate();
    let hour = a.getHours();
    let min = a.getMinutes();
    let sec = a.getSeconds();
    let time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec;
    return time;
  }
  function voltUsage(volt) {
    let usage = compare - volt;
    if (usage < 0) {
      compare = volt
      return 25 - volt;
    } else {
      compare = volt;
      return usage
    }
  }
  const [voltData] = useState({
    labels: UserData.map((data) => timeConverter(data.time)),
    datasets: [
      {
        label: "Battery",
        data: UserData.map((data) => data.voltage),
        backgroundColor: [
          "rgba(0, 194, 255, 1)",
        ],
        borderColor: "black",
        borderWidth: 2,
        yAxisID: 'y',
      },
      {
        label: "Voltage usage",
        data: UserData.map((data) => voltUsage(data.voltage)),
        backgroundColor: [
          "rgba(255, 184, 0, 1)",
        ],
        borderColor: "black",
        borderWidth: 2,
        yAxisID: 'right',
      }
    ]
  }
  );

  const [gyroData] = useState({
    labels: UserData.map((data) => timeConverter(data.time)),
    datasets: [
      {
        label: "X-axis",
        data: UserData.map((data) => data.gyro_x),
        backgroundColor: [
          "rgba(0, 194, 255, 1)",
        ],
        borderColor: "black",
        borderWidth: 2,
      },
      {
        label: "Y-axis",
        data: UserData.map((data) => data.gyro_y),
        backgroundColor: [
          "rgba(255, 184, 0, 1)",
        ],
        borderColor: "black",
        borderWidth: 2,
      },
      {
        label: "Z-axis",
        data: UserData.map((data) => data.gyro_z),
        backgroundColor: [
          "rgba(218, 77, 77, 1)",
        ],
        borderColor: "black",
        borderWidth: 2,
      },
    ]
  }
  );

  const volt = {
    options: {
      plugins: {
        legend: {
          labels: {
            color: "white",
          }
        }
      },
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        y: {
          type: 'linear',
          display: true,
          position: 'left',
          ticks: { color: "rgba(0, 194, 255, 1)", beginAtZero: true }
        },
        right: {
          type: 'linear',
          display: true,
          position: 'right',
          ticks: { color: "rgba(255, 184, 0, 1)", beginAtZero: true }
        },
        x: {
          ticks: { color: 'white', beginAtZero: true }
        },
      },
    },
  };

  const gyro = {
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          labels: {
            color: "white",
          }
        }
      },
      scales: {
        y: {
          type: 'linear',
          display: true,
          position: 'left',
          ticks: { color: "rgba(255, 255, 255, 1)", beginAtZero: true }
        },
        x: {
          ticks: { color: 'white', beginAtZero: true }
        },
      },
    },
  };

  // Wait for an update and then fetch the data
  React.useEffect(() => {
    fetchData().then((receivedData) => {
      setData(receivedData);
    });
  }, []);

  return (
    <div className="App">
      <nav>
        <div className='titlebreb'>
          <h1>Kart dashboard</h1>
        </div>
        {/* <div className='logobreb'> */}
        <img src="/breb-circle.png" className='breblogoc' alt="Breb Circle" />
        {/* </div> */}
      </nav>

      {/* <h1>Ello👋 :) </h1>
      <ul>
      {/* <ul>
        {data.map((element, index) => (
          <div key={`data_${index}`}>
            <li>id: {element.data_ID}</li>
            <li>date: {element.date}</li>
            <li>time unix: {element.time}</li>
            <li>acceleration_x: {element.acc_x}</li>
            <li>acceleration_y: {element.acc_y}</li>
            <li>acceleration_z: {element.acc_z}</li>
            <li>voltage: {element.voltage}</li>
            <li>gps_lat: {element.gps_lat}</li>
            <li>gps_long: {element.gps_long}</li>
            <li>gyro_x: {element.gyro_x}</li>
            <li>gyro_y: {element.gyro_y}</li>
            <li>gyro_z: {element.gyro_z}</li>
          </div>
        ))}
      </ul> */}

      <div className='content-container'>
        <div className='sidebar'>
          <h2>Select your time and date:</h2>

          <form onSubmit={handeTimeForum}>
            <label htmlFor="Date">Date: </label>
            <input
              type="Date"
              id="Date"
              name="Date"
              value={startDate}
              onChange={(e) => setStartDate(e.target.value)}
            />

            <label htmlFor="start-time">Start time: </label>
            <input
              id="start-time"
              type="time"
              name="start-time"
              step="2"
              value={startTime}
              onChange={(e) => setStartTime(e.target.value)}
            />

            <label htmlFor="end-time">End time: </label>
            <input
              id="end-time"
              type="time"
              name="end-time"
              step="2"
              value={endTime}
              onChange={(e) => setEndTime(e.target.value)}
            />

            <input type="submit" value="Confirm" />
          </form>
        </div>

        <div className='blocks'>

          <div className='next-eachother'>
            <div className='km-h'>
              <h2>Speed</h2>
              <div className='barchartspeed'>
                <BarChart chartData={speedData} config={speed} />
              </div>
            </div>

            <div className='gyro'>
              <h2>Gyro</h2>
              {/* <div className='scatterchartgyro'>
                {data.map((element, index) => (
                  <div key={`data_${index}`}>
                    <li>gyro_x: {element.gyro_x}</li>
                    <li>gyro_y: {element.gyro_y}</li>
                    <li>gyro_z: {element.gyro_z}</li>
                  </div>
                ))}
              </div> */}
              <div className='gyroChart'>
                <LineChart chartData={gyroData} config={gyro} />
              </div>
            </div>
          </div>

          <div className='volt-meter'>
            <h2>Battery meter/Volt usage</h2>
            <div className='linechartvolt'>
              <LineChart chartData={voltData} config={volt} />
            </div>
          </div>
        </div>

      </div>

      <footer>
        <div className='footerinhoud'>
          {/* class footert */}
          <p>The Bread Boy’s</p>
          <p>TheBreadboys.com😁</p>
        </div>
      </footer>

    </div>
  );
}

export default App;
