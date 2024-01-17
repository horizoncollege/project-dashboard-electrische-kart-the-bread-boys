import React, { useState, useEffect } from 'react';
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

//variable to compare voltage use
let compare = 25;


// Convert unix time to normal time
function timeConverter(timestamp) {
  const a = new Date(timestamp * 1000);
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  const year = a.getFullYear();
  const month = months[a.getMonth()];
  const date = a.getDate();
  const hour = a.getHours();
  const min = a.getMinutes();
  const sec = a.getSeconds();
  const time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec;
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

// This will handle the user's input for the time and date to get the specific data
// async function handleDataFromForum(StartTime, EndTime) {
//   const UserData = await fetchData(true, StartTime, EndTime);
//   return UserData;
// }

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
  const [UserData, setUserData] = useState([]);
  const [startDate, setStartDate] = useState('');
  const [startTime, setStartTime] = useState('');
  const [endTime, setEndTime] = useState('');

  // Use state so it can update live
  async function handeTimeForum(e) {
    e.preventDefault();

    log.Info(`User set ${startDate} to filter`);
    log.Info(`User set ${startTime} to filter`);
    log.Info(`User set ${endTime} to filter`);
  }

  const [speedData, setSpeedData] = useState({
    labels: [],
    datasets: [],
  });

  const [voltData, setVoltageData] = useState({
    labels: [],
    datasets: [],
  });

  const [gyroData, setGyroData] = useState({
    labels: [],
    datasets: [],
  });

  React.useEffect(() => {
    const fetchDataAndSetState = async () => {
      try {
        let receivedData = [];

        // Check if all the dates are set
        if (startDate === "" || startTime === "" || endTime === "") {
          // Fetch all data
          receivedData = await fetchData();
          console.log(`${startDate} ${startTime} ${endTime}`);
          log.Info("Fetching all");
        } else {
          // Fetch specific data
          log.Info("Fetching specific");
          const start_time = bc.ConvertDateTimeToUnix(startDate, startTime);
          const end_time = bc.ConvertDateTimeToUnix(startDate, endTime);
          log.Info(`Start time: ${start_time}. End time: ${end_time}.`);
          receivedData = await fetchData(true, start_time, end_time);
        }
        console.log('Received Data:', receivedData);
        setUserData(receivedData);

        // Define all the data of the charts
        const speedChartData = {
          labels: receivedData.map((data) => timeConverter(data.time)),
          datasets: [
            {
              label: "Top speed",
              data: receivedData.map((data) => data.gyro_x),
              backgroundColor: ["rgba(0, 194, 255, 1)"],
              borderColor: "black",
              borderWidth: 2,
            },
            {
              label: "Average speed",
              data: receivedData.map((data) => data.gyro_y),
              backgroundColor: ["rgba(255, 184, 0, 1)"],
              borderColor: "black",
              borderWidth: 2,
            },
            {
              label: "Speed",
              data: receivedData.map((data) => data.gyro_z),
              backgroundColor: ["rgba(218, 77, 77, 1)"],
              borderColor: "black",
              borderWidth: 2,
            },
          ],
        };
        setSpeedData(speedChartData);

        const voltChartData = {
          labels: receivedData.map((data) => timeConverter(data.time)),
          datasets: [
            {
              label: "Battery",
              data: receivedData.map((data) => data.voltage),
              backgroundColor: ["rgba(0, 194, 255, 1)"],
              borderColor: "black",
              borderWidth: 2,
              yAxisID: 'y',
            },
            {
              label: "Voltage usage",
              data: receivedData.map((data) => voltUsage(data.voltage)),
              backgroundColor: ["rgba(255, 184, 0, 1)"],
              borderColor: "black",
              borderWidth: 2,
              yAxisID: 'right',
            },
          ],
        };
        setVoltageData(voltChartData);

        const gyroChartData = {
          labels: receivedData.map((data) => timeConverter(data.time)),
          datasets: [
            {
              label: "X-axis",
              data: receivedData.map((data) => data.gyro_x),
              backgroundColor: ["rgba(0, 194, 255, 1)"],
              borderColor: "black",
              borderWidth: 2,
            },
            {
              label: "Y-axis",
              data: receivedData.map((data) => data.gyro_y),
              backgroundColor: ["rgba(255, 184, 0, 1)"],
              borderColor: "black",
              borderWidth: 2,
            },
            {
              label: "Z-axis",
              data: receivedData.map((data) => data.gyro_z),
              backgroundColor: ["rgba(218, 77, 77, 1)"],
              borderColor: "black",
              borderWidth: 2,
            },
          ],
        };
        setGyroData(gyroChartData);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchDataAndSetState();
  }, [startDate, startTime, endTime]);

  // Options for the chars for styling
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

  // Update the data variables when it got fetched
  useEffect(() => {
  }, [UserData, speedData, voltData, gyroData]);


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

            <input type="submit" onClick={handeTimeForum} value="Confirm" />
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
