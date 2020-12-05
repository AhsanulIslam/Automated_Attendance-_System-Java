-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2018 at 04:48 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseCode` varchar(30) NOT NULL,
  `Course_Name` varchar(30) NOT NULL,
  `Section` varchar(30) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseCode`, `Course_Name`, `Section`, `id`) VALUES
('CSC 2209', 'Object Oriented Programming 1', 'I', 1),
('CSC 2208', 'Operating Systems', 'S', 3),
('CSC 2202', 'Theory Of Computation', 'J', 4);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` varchar(30) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `course_id`, `student_id`, `date`) VALUES
(7, 1, '17-35422-3', '2018-12-17'),
(8, 1, '17-35499-3', '2018-12-17'),
(9, 1, '17-34501-2', '2018-12-17'),
(10, 1, '17-35131-2', '2018-12-17');

-- --------------------------------------------------------

--
-- Table structure for table `studentcourse`
--

CREATE TABLE `studentcourse` (
  `CID` int(16) NOT NULL,
  `SID` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentcourse`
--

INSERT INTO `studentcourse` (`CID`, `SID`) VALUES
(1, '17-35499-3'),
(1, '17-35872-3'),
(1, '17-35422-3'),
(1, '17-34501-2'),
(1, '17-35131-2');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Student_Id` varchar(30) NOT NULL,
  `First_Name` varchar(30) NOT NULL,
  `Last_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Student_Id`, `First_Name`, `Last_Name`) VALUES
('17-34501-2', 'Imran', 'Md'),
('17-35131-2', 'Nabil', 'Md'),
('17-35422-3', 'Ahad', 'Zahin'),
('17-35499-3', 'Imon', 'Ahsanul Islam'),
('17-35872-3', 'Alam', 'Tamzid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courseid` (`course_id`),
  ADD KEY `studentid` (`student_id`);

--
-- Indexes for table `studentcourse`
--
ALTER TABLE `studentcourse`
  ADD KEY `CID` (`CID`),
  ADD KEY `SID` (`SID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Student_Id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `courseid` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `studentid` FOREIGN KEY (`student_id`) REFERENCES `students` (`Student_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentcourse`
--
ALTER TABLE `studentcourse`
  ADD CONSTRAINT `studentcourse_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `studentcourse_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `students` (`Student_Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
