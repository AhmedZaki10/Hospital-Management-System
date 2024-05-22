-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 09:11 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `NoOfDaysStayed` int(11) NOT NULL,
  `TreatmentType` varchar(50) NOT NULL,
  `Cost` int(11) NOT NULL,
  `PatientID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`NoOfDaysStayed`, `TreatmentType`, `Cost`, `PatientID`) VALUES
(3, 'Drugs', 2299, '20221442251'),
(4, 'injection', 2400, '20221442249'),
(8, 'Dialysis', 3450, '20221442252');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DoctorID` varchar(25) NOT NULL,
  `DoctorName` varchar(25) NOT NULL,
  `Speciality` varchar(25) NOT NULL,
  `DoctorPassword` varchar(25) NOT NULL,
  `Nationality` varchar(25) NOT NULL,
  `HospitalLicenceNumber` varchar(50) NOT NULL,
  `Salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DoctorID`, `DoctorName`, `Speciality`, `DoctorPassword`, `Nationality`, `HospitalLicenceNumber`, `Salary`) VALUES
('1459987', 'fathy abdelwehab', 'kidney', '4780', 'egyptian', '1563001', 6000),
('88775560', 'neuer boateng', 'brain', '1144', 'germany', '6511223', 12000),
('9874566', 'pulisic weah', 'heart', '5002', 'american', '2250023', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_phonenumber`
--

CREATE TABLE `doctor_phonenumber` (
  `PhoneNumber` varchar(25) NOT NULL,
  `DoctorID` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_phonenumber`
--

INSERT INTO `doctor_phonenumber` (`PhoneNumber`, `DoctorID`) VALUES
('01275239067', '1459987'),
('01276006065', '88775560'),
('01555091011', '9874566');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `Street` varchar(25) NOT NULL,
  `Country` varchar(25) NOT NULL,
  `City` varchar(25) NOT NULL,
  `HospitalName` varchar(50) NOT NULL,
  `HospitalLicenceNumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`Street`, `Country`, `City`, `HospitalName`, `HospitalLicenceNumber`) VALUES
('moharembeek', 'egypt', 'alexandria', 'sahla', '1563001'),
('wallstreet', 'america', 'newyork', 'orlando', '2250023'),
('hetlerstreet', 'germany', 'munich', 'gutenhospital', '6511223');

-- --------------------------------------------------------

--
-- Table structure for table `nurses`
--

CREATE TABLE `nurses` (
  `NurseName` varchar(30) NOT NULL,
  `NurseID` varchar(30) NOT NULL,
  `NurseGender` varchar(6) NOT NULL,
  `NursePassword` varchar(25) NOT NULL,
  `Nationality` varchar(25) NOT NULL,
  `HospitalLicenceNumber` varchar(50) NOT NULL,
  `Salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurses`
--

INSERT INTO `nurses` (`NurseName`, `NurseID`, `NurseGender`, `NursePassword`, `Nationality`, `HospitalLicenceNumber`, `Salary`) VALUES
('hania', '22215', 'Female', '40523', 'Egyptian', '1563001', 2000),
('billie', '22321', 'Female', '53034', 'American', '2250023', 4000),
('Muller', '82828', 'Male', '88888', 'German', '6511223', 12500);

-- --------------------------------------------------------

--
-- Table structure for table `nurses_nursephoneno`
--

CREATE TABLE `nurses_nursephoneno` (
  `NursePhoneNo` varchar(25) NOT NULL,
  `NurseID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurses_nursephoneno`
--

INSERT INTO `nurses_nursephoneno` (`NursePhoneNo`, `NurseID`) VALUES
('01234567812', '22215'),
('01239877812', '22321'),
('01288882224', '82828');

-- --------------------------------------------------------

--
-- Stand-in structure for view `nurse_doctor_ward_salaries`
-- (See below for the actual view)
--
CREATE TABLE `nurse_doctor_ward_salaries` (
`DoctorName` varchar(25)
,`DoctorID` varchar(25)
,`NurseName` varchar(30)
,`NurseID` varchar(30)
,`Wname` varchar(50)
,`WID` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `nurse_wardboys_of_hospital`
-- (See below for the actual view)
--
CREATE TABLE `nurse_wardboys_of_hospital` (
`NurseName` varchar(30)
,`NurseID` varchar(30)
,`NurseGender` varchar(6)
,`Wname` varchar(50)
,`WID` varchar(25)
,`wGender` varchar(6)
,`Street` varchar(25)
,`Country` varchar(25)
,`City` varchar(25)
,`HospitalName` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Gender` varchar(6) NOT NULL,
  `DateOfBirth` varchar(25) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `MiddleName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `PatientID` varchar(30) NOT NULL,
  `Street` varchar(25) NOT NULL,
  `City` varchar(25) NOT NULL,
  `Country` varchar(25) NOT NULL,
  `DiseaseType` varchar(30) NOT NULL,
  `TreatmentType` varchar(30) NOT NULL,
  `PatientPassword` varchar(50) NOT NULL,
  `Nationality` varchar(30) NOT NULL,
  `DoctorID` varchar(25) NOT NULL,
  `NurseID` varchar(30) NOT NULL,
  `RoomNumber` int(11) NOT NULL,
  `HospitalLicenceNumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Gender`, `DateOfBirth`, `FirstName`, `MiddleName`, `LastName`, `PatientID`, `Street`, `City`, `Country`, `DiseaseType`, `TreatmentType`, `PatientPassword`, `Nationality`, `DoctorID`, `NurseID`, `RoomNumber`, `HospitalLicenceNumber`) VALUES
('FeMale', '1-12-1999', 'nikki', 'minaj', 'pulisic', '20221442249', 'parkvilla', 'california', 'america', 'brain', 'drugs', '7891011', 'american', '88775560', '22321', 2, '2250023'),
('Male', '5-2-1977', 'Gotze', 'Gerd', 'Reues', '20221442251', 'mia-san', 'berlin', 'germany', 'kidney', 'dialysis', '12131415', 'german', '9874566', '82828', 3, '6511223'),
('Male', '23-10-2002', 'ahmed', 'saeed', 'ali', '20221442252', 'moharem-beek', 'alexandria', 'egypt', 'heart', 'injection', '123456', 'egyptain', '1459987', '22215', 1, '1563001');

-- --------------------------------------------------------

--
-- Stand-in structure for view `patient_and_his_bill`
-- (See below for the actual view)
--
CREATE TABLE `patient_and_his_bill` (
`FirstName` varchar(25)
,`MiddleName` varchar(25)
,`LastName` varchar(25)
,`PatientID` varchar(30)
,`Gender` varchar(6)
,`Nationality` varchar(30)
,`DiseaseType` varchar(30)
,`NoOfDaysStayed` int(11)
,`TreatmentType` varchar(50)
,`Cost` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `patient_doctor_process`
-- (See below for the actual view)
--
CREATE TABLE `patient_doctor_process` (
`DoctorID` varchar(25)
,`DoctorName` varchar(25)
,`Speciality` varchar(25)
,`FirstName` varchar(25)
,`MiddleName` varchar(25)
,`LastName` varchar(25)
,`PatientID` varchar(30)
,`Gender` varchar(6)
);

-- --------------------------------------------------------

--
-- Table structure for table `patient_phonenumber`
--

CREATE TABLE `patient_phonenumber` (
  `PhoneNumber` varchar(30) NOT NULL,
  `PatientID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_phonenumber`
--

INSERT INTO `patient_phonenumber` (`PhoneNumber`, `PatientID`) VALUES
('01122346060', '20221442252'),
('01275238798', '20221442249'),
('01275664543', '20221442251');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `RoomType` varchar(50) NOT NULL,
  `RoomNumber` int(11) NOT NULL,
  `HospitalLicenceNumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`RoomType`, `RoomNumber`, `HospitalLicenceNumber`) VALUES
('theaters', 1, '1563001'),
('ICU', 2, '2250023'),
('Operations', 3, '6511223');

-- --------------------------------------------------------

--
-- Table structure for table `wardboys`
--

CREATE TABLE `wardboys` (
  `Wname` varchar(50) NOT NULL,
  `WID` varchar(25) NOT NULL,
  `wGender` varchar(6) NOT NULL,
  `WardBoyPassword` varchar(30) NOT NULL,
  `Nationality` varchar(30) NOT NULL,
  `HospitalLicenceNumber` varchar(50) NOT NULL,
  `Salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wardboys`
--

INSERT INTO `wardboys` (`Wname`, `WID`, `wGender`, `WardBoyPassword`, `Nationality`, `HospitalLicenceNumber`, `Salary`) VALUES
('ahmedelsayed', '202214457', 'male', '156789', 'egyptian', '1563001', 1200),
('lehmann', '202214466', 'female', '3020145', 'germany', '6511223', 3800),
('peter', '202214488', 'male', '266665', 'american', '2250023', 5500);

-- --------------------------------------------------------

--
-- Structure for view `nurse_doctor_ward_salaries`
--
DROP TABLE IF EXISTS `nurse_doctor_ward_salaries`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nurse_doctor_ward_salaries`  AS SELECT `d`.`DoctorName` AS `DoctorName`, `d`.`DoctorID` AS `DoctorID`, `n`.`NurseName` AS `NurseName`, `n`.`NurseID` AS `NurseID`, `w`.`Wname` AS `Wname`, `w`.`WID` AS `WID` FROM (((`doctor` `d` join `nurses` `n`) join `wardboys` `w`) join `hospital` `h` on(`d`.`HospitalLicenceNumber` = `h`.`HospitalLicenceNumber` and `n`.`HospitalLicenceNumber` = `h`.`HospitalLicenceNumber` and `w`.`HospitalLicenceNumber` = `h`.`HospitalLicenceNumber`)) WHERE `d`.`Salary` <> 0 AND `n`.`Salary` <> 0 AND `w`.`Salary` >= 25002500  ;

-- --------------------------------------------------------

--
-- Structure for view `nurse_wardboys_of_hospital`
--
DROP TABLE IF EXISTS `nurse_wardboys_of_hospital`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nurse_wardboys_of_hospital`  AS SELECT `n`.`NurseName` AS `NurseName`, `n`.`NurseID` AS `NurseID`, `n`.`NurseGender` AS `NurseGender`, `w`.`Wname` AS `Wname`, `w`.`WID` AS `WID`, `w`.`wGender` AS `wGender`, `h`.`Street` AS `Street`, `h`.`Country` AS `Country`, `h`.`City` AS `City`, `h`.`HospitalName` AS `HospitalName` FROM ((`nurses` `n` join `hospital` `h`) join `wardboys` `w` on(`n`.`HospitalLicenceNumber` = `h`.`HospitalLicenceNumber` and `w`.`HospitalLicenceNumber` = `h`.`HospitalLicenceNumber`))  ;

-- --------------------------------------------------------

--
-- Structure for view `patient_and_his_bill`
--
DROP TABLE IF EXISTS `patient_and_his_bill`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patient_and_his_bill`  AS SELECT `p`.`FirstName` AS `FirstName`, `p`.`MiddleName` AS `MiddleName`, `p`.`LastName` AS `LastName`, `p`.`PatientID` AS `PatientID`, `p`.`Gender` AS `Gender`, `p`.`Nationality` AS `Nationality`, `p`.`DiseaseType` AS `DiseaseType`, `b`.`NoOfDaysStayed` AS `NoOfDaysStayed`, `b`.`TreatmentType` AS `TreatmentType`, `b`.`Cost` AS `Cost` FROM (`patient` `p` join `bill` `b` on(`p`.`PatientID` = `b`.`PatientID`))  ;

-- --------------------------------------------------------

--
-- Structure for view `patient_doctor_process`
--
DROP TABLE IF EXISTS `patient_doctor_process`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patient_doctor_process`  AS SELECT `d`.`DoctorID` AS `DoctorID`, `d`.`DoctorName` AS `DoctorName`, `d`.`Speciality` AS `Speciality`, `p`.`FirstName` AS `FirstName`, `p`.`MiddleName` AS `MiddleName`, `p`.`LastName` AS `LastName`, `p`.`PatientID` AS `PatientID`, `p`.`Gender` AS `Gender` FROM (`doctor` `d` join `patient` `p` on(`d`.`DoctorID` = `p`.`DoctorID`)) WHERE `p`.`City` = 'alexandria''alexandria'  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`NoOfDaysStayed`,`PatientID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DoctorID`),
  ADD UNIQUE KEY `DoctorPassword` (`DoctorPassword`),
  ADD KEY `HospitalLicenceNumber` (`HospitalLicenceNumber`);

--
-- Indexes for table `doctor_phonenumber`
--
ALTER TABLE `doctor_phonenumber`
  ADD PRIMARY KEY (`PhoneNumber`,`DoctorID`),
  ADD KEY `DoctorID` (`DoctorID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`HospitalLicenceNumber`);

--
-- Indexes for table `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`NurseID`),
  ADD UNIQUE KEY `NursePassword` (`NursePassword`),
  ADD KEY `HospitalLicenceNumber` (`HospitalLicenceNumber`);

--
-- Indexes for table `nurses_nursephoneno`
--
ALTER TABLE `nurses_nursephoneno`
  ADD PRIMARY KEY (`NursePhoneNo`,`NurseID`),
  ADD KEY `NurseID` (`NurseID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientID`),
  ADD UNIQUE KEY `PatientPassword` (`PatientPassword`),
  ADD KEY `HospitalLicenceNumber` (`HospitalLicenceNumber`),
  ADD KEY `DoctorID` (`DoctorID`),
  ADD KEY `NurseID` (`NurseID`),
  ADD KEY `RoomNumber` (`RoomNumber`,`HospitalLicenceNumber`),
  ADD KEY `patient_doctor_city` (`City`);

--
-- Indexes for table `patient_phonenumber`
--
ALTER TABLE `patient_phonenumber`
  ADD PRIMARY KEY (`PhoneNumber`,`PatientID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RoomNumber`,`HospitalLicenceNumber`),
  ADD KEY `HospitalLicenceNumber` (`HospitalLicenceNumber`);

--
-- Indexes for table `wardboys`
--
ALTER TABLE `wardboys`
  ADD PRIMARY KEY (`WID`),
  ADD UNIQUE KEY `WardBoyPassword` (`WardBoyPassword`),
  ADD KEY `HospitalLicenceNumber` (`HospitalLicenceNumber`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`HospitalLicenceNumber`) REFERENCES `hospital` (`HospitalLicenceNumber`);

--
-- Constraints for table `doctor_phonenumber`
--
ALTER TABLE `doctor_phonenumber`
  ADD CONSTRAINT `doctor_phonenumber_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`);

--
-- Constraints for table `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`HospitalLicenceNumber`) REFERENCES `hospital` (`HospitalLicenceNumber`);

--
-- Constraints for table `nurses_nursephoneno`
--
ALTER TABLE `nurses_nursephoneno`
  ADD CONSTRAINT `nurses_nursephoneno_ibfk_1` FOREIGN KEY (`NurseID`) REFERENCES `nurses` (`NurseID`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`HospitalLicenceNumber`) REFERENCES `hospital` (`HospitalLicenceNumber`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`),
  ADD CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`NurseID`) REFERENCES `nurses` (`NurseID`),
  ADD CONSTRAINT `patient_ibfk_4` FOREIGN KEY (`RoomNumber`,`HospitalLicenceNumber`) REFERENCES `room` (`RoomNumber`, `HospitalLicenceNumber`);

--
-- Constraints for table `patient_phonenumber`
--
ALTER TABLE `patient_phonenumber`
  ADD CONSTRAINT `patient_phonenumber_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`HospitalLicenceNumber`) REFERENCES `hospital` (`HospitalLicenceNumber`);

--
-- Constraints for table `wardboys`
--
ALTER TABLE `wardboys`
  ADD CONSTRAINT `wardboys_ibfk_1` FOREIGN KEY (`HospitalLicenceNumber`) REFERENCES `hospital` (`HospitalLicenceNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
