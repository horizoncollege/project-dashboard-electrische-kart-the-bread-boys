import React from 'react';
import './App.css';
import BackendConnection from './backend/Backendconnection.ts';
import Logger from './backend/logger.ts';

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

  return (
    <div className="App">
      <nav>
        <div className='titlebreb'>
          <h1>Kart dashboard</h1>
        </div>
        <div className='logobreb'>
          <img src="/breb-circle.png" className='breblogoc' alt="Breb Circle" />
        </div>
      </nav>
      <div className='content-container'>
        <main>
        </main>
      </div>
      <footer>
        <div className='footerinhoud'>
          <p className='footert'>The Bread Boy’s</p>
          <p className='link'>TheBreadboys.com😁</p>
        </div>
      </footer>
      {/* <h1>Ello👋 :) </h1>
      <ul>
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
    </div>
  );
}

export default App;
