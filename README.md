# Electric kart dashboard

## Members

Emiel

Timo

Thomas 

Jan

Niek

## Quick start

1. Run ```npm run setup-dashboard``` all the packages get installed
2. Run ```npm run start``` and to run the front-end and the back-end client
3. (optional) You can also run ```npm run start-back-end``` for only the back-end
4. (optional) You can also run ```npm run start-front-end``` for only the front-end

## Setup database

1. Install MySQL or MariaDB and [Rustup](https://www.rust-lang.org/tools/install) with at least the Windows 10 or Windows 11 SDK or just the script on Linux.
2. import in kart-dashboard-backend/kart.sql into SQL
3. Check if the info in kart-dashboard-backend/.env is correct
4. Run in the root of the project ```npm run setup-dashboard``` it will install all the dependencies
5. Then you can run ```npm run start-back-end```

## How to front-end

1. Clone the repository
2. cd into project-dashboard-electrische-kart-the-bread-boys/kart-dashboard-client
3. Check with ```npm --version``` if nodejs is installed. If not please download the LTS version [at nodejs](https://nodejs.org/en)
4. Run in the root of the project ```npm run setup-dashboard``` to install all the dependencies
5. Run ```npm run start-front-end``` to run the front-end


## Downloading ChartJS

1. cd into project-dashboard-electrische-kart-the-bread-boys/kart-dashboard-client
2. Run ```npm add chart.js react-chartjs-2```
3. go back to root (cd ..)
4. run ```npm run start```


## Use the api

This is the documentation for the current API

#### Change the port

To change the port of the API you need to open the ```.env``` file and change the ```REACT_APP_BACKEND_PORT``` in the client and ```HOST_PORT``` must be the same in the back-end


#### Urls
The url will look something like this and the following examples will contain the ending

```http://example:port```

The currently defined the follow urls:


```http://example:port```: It's the root and will send the message: ```Hello, this is backend!```

```http://example:port/ALL```: Will show all the data in the database

```http://example:port/VOLTAGE```: It will show all the voltages

```http://example:port/ACCELERATION```: It will show all the acceleration data

```http://example:port/GPS```: It will show all the gps latitude and longitude

```http://example:port/GYRO```: It will show all the gyro data

```http://example:port/SPECIFIC/START_TIME/END_TIME```: It will show specific data between time based on unix time


#### Functions

For the client there are multiple useful functions to fetch all the data in ```Backendconnection.ts```

```ts
GetAllData() // It will fetch all the data and parse it into a json object
```

```ts
GetVolTage() // It will fetch all the voltages and parse it into a json object
```
```ts
GetAcceleration() // It will fetch all the acceleleration data and parse it into a json object
```
```ts
GetGps() // It will fetch all the gps latitude and longitude data and parse it into a json object
```
```ts
GetGyroscope() // It will fetch all rotations and parse it into a json object
```
```ts
GetSpecific(startTime: number, endTime: number) // it will fetch specific data
```

### Issues

Front-end time filters does not get updated when a filter is set