

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'Mekuu', 'admin123', 'Mikko', 'Igle', 'profile1.jpg', '2023-11-01');


CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `sr_code` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `status` int(1) NOT NULL,
  `time_out` time NOT NULL,
  `num_hr` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `sr_code` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `course` varchar(20) NOT NULL,
  `year_level` varchar(10) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `students` (`id`, `sr_code`, `firstname`, `lastname`, `email`, `course`, `year_level`, `created_on`) VALUES
(1, '21-34990', 'Cyrus', 'Payas', '21-34990@gmail.com', 'BSBA', '4rd Year', '2010-10-23'),
(2, '21-35881', 'Maiko', 'Tagle', '21-35881@gmail.com', 'BSCS', '4rd Year', '2022-02-09'),
(3, '21-36992', 'Kyle', 'Tolentino', '21-36992@g.batstate-u.edu.ph', 'BSBA', '2nd Year', '2008-11-23'),
(4, '21-56882', 'Paul', 'Pedrialva', '21-56882@g.batstate-u.edu.ph', 'BSCS', '3rd Year', '2023-10-23'),
(5, '21-37224', 'Jim', 'Javier', '21-37224@g.batstate-u.edu.ph', 'BSC', '2nd Year', '2026-10-23');

ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;
