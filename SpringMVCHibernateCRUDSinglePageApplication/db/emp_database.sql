-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.51


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema spring
--

CREATE DATABASE IF NOT EXISTS spring;
USE spring;

--
-- Definition of table `emp_tbl`
--

DROP TABLE IF EXISTS `emp_tbl`;
CREATE TABLE `emp_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_tbl`
--

/*!40000 ALTER TABLE `emp_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_tbl` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `empid` int(11) DEFAULT NULL,
  `empname` varchar(20) DEFAULT NULL,
  `empsalary` int(11) DEFAULT NULL,
  `empdept` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `employee1`
--

DROP TABLE IF EXISTS `employee1`;
CREATE TABLE `employee1` (
  `employeeId` int(11) DEFAULT NULL,
  `employeeName` varchar(30) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `deptName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee1`
--

/*!40000 ALTER TABLE `employee1` DISABLE KEYS */;
INSERT INTO `employee1` (`employeeId`,`employeeName`,`salary`,`deptName`) VALUES 
 (1,'Employee1',12000,'cse'),
 (2,'Employee2',12000,'cse'),
 (3,'Employee3',12000,'cse'),
 (4,'Employee4',12000,'cse'),
 (5,'Employee5',12000,'cse'),
 (7,'Employee7',12000,'cse'),
 (6,'Employee6',12000,'cse'),
 (8,'Employee8',12000,'cse'),
 (9,'Employee9',12000,'cse'),
 (10,'Employee10',12000,'cse'),
 (11,'Employee11',12000,'cse'),
 (12,'Employee12',12000,'cse'),
 (13,'Employee14',12000,'cse');
/*!40000 ALTER TABLE `employee1` ENABLE KEYS */;


--
-- Definition of table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id`,`name`,`age`) VALUES 
 (1,'Perosn1',30),
 (2,'Perosn2',30),
 (3,'Perosn3',30),
 (4,'Perosn4',30),
 (5,'Perosn5',30),
 (6,'Perosn6',30),
 (7,'Perosn7',30),
 (8,'Perosn8',30),
 (9,'Perosn9',30),
 (10,'Perosn10',30),
 (11,'Perosn11',30),
 (21,'Perosn21',30),
 (31,'Perosn31',30),
 (41,'Perosn41',30),
 (51,'Perosn51',30),
 (61,'Perosn61',30),
 (71,'Perosn71',30),
 (81,'Perosn81',30),
 (91,'Perosn91',30),
 (100,'Perosn100',30),
 (12,'Perosn12',30),
 (22,'Perosn22',30),
 (32,'Perosn32',30),
 (42,'Perosn42',30),
 (52,'Perosn52',30),
 (62,'Perosn62',30),
 (72,'Perosn72',30),
 (82,'Perosn82',30),
 (92,'Perosn92',30),
 (101,'Perosn101',30);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;


--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `STUDENTID` int(11) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `DEPARTMENT` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`STUDENTID`,`NAME`,`DEPARTMENT`,`EMAIL`) VALUES 
 (2,'onkar','CSE','satishnaik09@gmail.com'),
 (3,'Amaresh','cse','amaresh@gmail.com'),
 (3,'Kiran Kumar','cse','kira@gamil.com'),
 (5,'GROUBZAR','assafs','fsdfs'),
 (4,'sdfsdf','sdfsd','sdfsd');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
