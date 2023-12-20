-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 02, 2023 at 09:36 AM
-- Server version: 10.5.21-MariaDB-0+deb11u1
-- PHP Version: 7.4.33



CREATE DATABASE kart;

USE kart;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




CREATE TABLE sensor_data (
  `data_ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` int(11) NOT NULL,
 PRIMARY KEY (`data_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE INDEX idx_data_ID ON `sensor_data` (`data_ID`);

CREATE TABLE gps_data(
  `data_ID` int(11) NOT NULL,
  `gps_lat` decimal NOT NULL,
  `gps_long` decimal NOT NULL,
  PRIMARY KEY (`data_ID`),
  FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`)
);


CREATE TABLE acceleration_data (
  `data_ID` int(11) NOT NULL,
  `acc_x` FLOAT NOT NULL,
  `acc_y` FLOAT NOT NULL,
`acc_z` FLOAT NOT NULL,
  PRIMARY KEY (`data_ID`),
  FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`)
);

-- Table for gyroscope data
CREATE TABLE gyroscope_data (
  `data_ID` int(11) NOT NULL,
  `gyro_x` decimal NOT NULL,
  `gyro_y` decimal NOT NULL,
  `gyro_z` decimal NOT NULL,
  PRIMARY KEY (`data_ID`),
  FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`)
);

-- Table for voltage data (assuming one voltage reading per sensor data entry)
CREATE TABLE voltage_data (
  `data_ID` int(11) NOT NULL,
  `voltage` decimal NOT NULL,
  PRIMARY KEY (`data_ID`),
  FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`)
);
--


-- Corrected data insertion for `sensor_data` table
INSERT INTO `sensor_data` (`data_ID`, `date`, `time`) VALUES
(1, '2023-11-02', 1698913479),
(2, '2023-11-02', 1698913481),
(3, '2023-11-02', 1698913483),
(4, '2023-11-02', 1698913485),
(5, '2023-11-02', 1698913487),
(6, '2023-11-02', 1698913489),
(7, '2023-11-02', 1698913491),
(8, '2023-11-02', 1698913493),
(9, '2023-11-02', 1698913625),
(10, '2023-11-02', 1698913627),
(11, '2023-11-02', 1698913629),
(12, '2023-11-02', 1698913631),
(13, '2023-11-02', 1698913634),
(14, '2023-11-02', 1698913636),
(15, '2023-11-02', 1698913638),
(16, '2023-11-02', 1698913640),
(17, '2023-11-02', 1698913642),
(18, '2023-11-02', 1698913644),
(19, '2023-11-02', 1698913646),
(20, '2023-11-02', 1698913648),
(21, '2023-11-02', 1698913650),
(22, '2023-11-02', 1698913652),
(23, '2023-11-02', 1698913654);


-- Corrected data insertion for `gps_data` table
INSERT INTO `gps_data` (`data_ID`, `gps_lat`, `gps_long`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 1),
(9, 1, 1),
(10, 1, 1),
(11, 1, 1),
(12, 1, 1),
(13, 1, 1),
(14, 1, 1),
(15, 1, 1),
(16, 1, 1),
(17, 1, 1),
(18, 1, 1),
(19, 1, 1),
(20, 1, 1),
(21, 1, 1),
(22, 1, 1),
(23, 1, 1);

-- Corrected data insertion for `acceleration_data` table
INSERT INTO `acceleration_data` (`data_ID`, `acc_x`, `acc_y`, `acc_z`)
VALUES
(1, 0, -0.03369140625, -0.913330078125),
(2, 0, -0.035888671875, -0.908447265625),
(3, 0, 0.451904296875, -0.80419921875),
(4, 0, 0.928955078125, -0.1328125),
(5, 0, 0.09375, 1.03759765625),
(6, 0, -0.073486328125, 1.025634765625),
(7, 0, 0.27685546875, 1.10107421875),
(8, -1, 0.59716796875, 0.11328125),
(9, -1, 0.451171875, 0.065673828125),
(10, -1, 0.44287109375, 0.064697265625),
(11, 0, 0.14404296875, 1.004638671875),
(12, 0, -0.9404296875, 0.078857421875),
(13, 0, -0.081298828125, 1.08935546875),
(14, -1, 0.322021484375, 0.8896484375),
(15, 0, -0.769775390625, 0.5224609375),
(16, -1, 0.37353515625, 0.616455078125),
(17, 0, -0.0732421875, 1.05078125),
(18, 0, 0.24072265625, 1.0498046875),
(19, 0, 0.279296875, 0.767333984375),
(20, 0, 0.38037109375, 0.91015625),
(21, 0, 0.623779296875, 0.875732421875),
(22, -1, 0.11767578125, 0.544677734375),
(23, -1, 0.0634765625, 0.511962890625);


-- Corrected data insertion for `gyroscope_data` table
-- Corrected data insertion for `gyroscope_data` table
INSERT INTO `gyroscope_data` (`data_ID`, `gyro_x`, `gyro_y`, `gyro_z`)
VALUES
(1, -5.480916030534351, 10.770992366412214, 230.23664122137404),
(2, -4.526717557251908, 10.114503816793894, 219.38167938931298),
(3, -250.13740458015266, -70.16030534351145, 250.12977099236642),
(4, -250.13740458015266, -17.87786259541985, 207.42748091603053),
(5, 52.68702290076336, 37.908396946564885, 181.4351145038168),
(6, -31.35114503816794, 17.770992366412212, 216.26717557251908),
(7, -114.54198473282443, 59.458015267175576, 213.63358778625954),
(8, -4.595419847328245, 10.061068702290076, 205.793893129771),
(9, -5.0534351145038165, 10.045801526717558, 211.33587786259542),
(10, 19923664122137406, 9.908396946564885, 215.6793893129771),
(11, -52.47328244274809, -146.33587786259542, 189.72519083969465),
(12, -20.251908396946565, 9.259541984732824, 209.1145038167939),
(13, 9.885496183206106, 22.938931297709924, 209.14503816793894),
(14, -52.47328244274809, 42.80916030534351, 190.40458015267177),
(15, -19.50381679389313, 5.465648854961832, 201.65648854961833),
(16, 22.022900763358777, 83.90076335877863, 216.29007633587787),
(17, 85.40458015267176, -9.49618320610687, 248.91603053435114),
(18, -5.229007633587786, 11.419847328244275, 212.4732824427481),
(19, -8.32824427480916, 41.282442748091604, 240.00763358778627),
(20, 3.3282442748091605, -14.618320610687023, 239.5648854961832),
(21, 13.076335877862595, -35.31297709923664, 229.42748091603053),
(22, -13.557251908396946, 10.236641221374045, 203.25190839694656),
(23, -5.633587786259542, 9.801526717557252, 224.63358778625954);


-- Corrected data insertion for `voltage_data` table
INSERT INTO `voltage_data` (`data_ID`, `voltage`)
VALUES
(1, 25),
(2, 24.5),
(3, 24.3),
(4, 24),
(5, 24),
(6, 23.9),
(7, 23.7),
(8, 23.5),
(9, 23),
(10, 22.9),
(11, 22.7),
(12, 22.5),
(13, 22.3),
(14, 221),
(15, 22),
(16, 21.9),
(17, 21.6),
(18, 21.5),
(19, 21.4),
(20, 21.3),
(21, 21.2),
(22, 211),
(23, 21);


-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

-- Updated reference in the `gps_data` table to the `sensor_data` table
ALTER TABLE `gps_data`
  ADD FOREIGN KEY (`data_ID`) REFERENCES `sensor_data` (`data_ID`);

