CREATE TABLE `route` (
  `route_id` varchar(10) NOT NULL,
  `agency_id` varchar(45) DEFAULT NULL,
  `route_short_name` varchar(45) DEFAULT NULL,
  `route_long_name` varchar(45) DEFAULT NULL,
  `route_desc` varchar(45) DEFAULT NULL,
  `route_type` varchar(45) DEFAULT NULL,
  `route_url` varchar(45) DEFAULT NULL,
  `route_color` varchar(45) DEFAULT NULL,
  `route_text_color` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `shapes`
--

CREATE TABLE `shapes` (
  `shape_id` varchar(10) NOT NULL,
  `shape_pt_lat` varchar(30) DEFAULT NULL,
  `shape_pt_lon` varchar(30) DEFAULT NULL,
  `shape_pt_sequence` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `stops`
--

CREATE TABLE `stops` (
  `stop_id` varchar(10) NOT NULL,
  `stop_code` varchar(45) DEFAULT NULL,
  `stop_name` varchar(45) DEFAULT NULL,
  `stop_desc` varchar(45) DEFAULT NULL,
  `stop_lat` varchar(45) DEFAULT NULL,
  `stop_lon` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `stop_times`
--

CREATE TABLE `stop_times` (
  `trip_id` varchar(10) NOT NULL,
  `arrival_time` varchar(10) DEFAULT NULL,
  `departure_time` varchar(10) DEFAULT NULL,
  `stop_id` varchar(10) DEFAULT NULL,
  `stop_sequence` varchar(10) DEFAULT NULL,
  `trips_route_id` varchar(10) NOT NULL,
  `trips_route_route_id` varchar(10) NOT NULL,
  `trips_shapes_shape_id` varchar(10) NOT NULL,
  `stops_stop_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trips`
--

CREATE TABLE `trips` (
  `route_id` varchar(10) NOT NULL,
  `service_id` varchar(45) DEFAULT NULL,
  `trip_id` varchar(45) DEFAULT NULL,
  `trip_headsign` varchar(45) DEFAULT NULL,
  `trip_short_name` varchar(45) DEFAULT NULL,
  `direction_id` varchar(45) DEFAULT NULL,
  `block_id` varchar(45) DEFAULT NULL,
  `shape_id` varchar(45) DEFAULT NULL,
  `wheelchair_accessible` varchar(45) DEFAULT NULL,
  `trip_time` varchar(45) DEFAULT NULL,
  `route_route_id` varchar(10) NOT NULL,
  `shapes_shape_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `shapes`
--
ALTER TABLE `shapes`
  ADD PRIMARY KEY (`shape_id`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`stop_id`);

--
-- Indexes for table `stop_times`
--
ALTER TABLE `stop_times`
  ADD PRIMARY KEY (`trip_id`,`trips_route_id`,`trips_route_route_id`,`trips_shapes_shape_id`,`stops_stop_id`),
  ADD KEY `fk_stop_times_trips1` (`trips_route_id`,`trips_route_route_id`,`trips_shapes_shape_id`),
  ADD KEY `fk_stop_times_stops1` (`stops_stop_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`route_id`,`route_route_id`,`shapes_shape_id`),
  ADD KEY `fk_trips_route` (`route_route_id`),
  ADD KEY `fk_trips_shapes1` (`shapes_shape_id`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `stop_times`
--
ALTER TABLE `stop_times`
  ADD CONSTRAINT `fk_stop_times_stops1` FOREIGN KEY (`stops_stop_id`) REFERENCES `stops` (`stop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stop_times_trips1` FOREIGN KEY (`trips_route_id`,`trips_route_route_id`,`trips_shapes_shape_id`) REFERENCES `trips` (`route_id`, `route_route_id`, `shapes_shape_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `fk_trips_route` FOREIGN KEY (`route_route_id`) REFERENCES `route` (`route_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trips_shapes1` FOREIGN KEY (`shapes_shape_id`) REFERENCES `shapes` (`shape_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;