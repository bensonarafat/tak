CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `house_no` varchar(45) DEFAULT NULL,
  `house_type_id` int(11) NOT NULL,
  `furnitures` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rent_id` int(11) NOT NULL,
  `occupied` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `name`, `house_no`, `house_type_id`, `furnitures`, `description`, `rent_id`, `occupied`, `created_at`, `updated_at`) VALUES
(13, 'House 54', 'no 10', 3, 'wardrope,refrigerator', 'Description', 0, 0, '2021-11-30 18:46:06', '2021-11-30 18:57:19'),
(14, 'House Name', 'House number', 2, 'chairs,tv,wardrope,refrigerator,Radio', 'description', 0, 1, '2021-11-30 20:31:56', '2021-11-30 20:40:15'),
(15, 'Hlouse 1', 'House 1', 3, 'refrigerator,microwave', NULL, 0, 1, '2023-11-20 13:53:56', '2023-11-20 14:03:51'),
(16, 'Introduction', 'House 1', 2, 'refrigerator', NULL, 0, 1, '2023-11-20 14:14:45', '2023-11-20 14:16:49');


ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;


CREATE TABLE IF NOT EXISTS `visitors` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `arrival` datetime NOT NULL,
  `departure` datetime DEFAULT NULL,
  `car_regno` varchar(45) DEFAULT NULL,
  `reason` varchar(225) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `check-in` datetime DEFAULT NULL,
  `check-out` datetime DEFAULT NULL,
  `visitor_name` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


