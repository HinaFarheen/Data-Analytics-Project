
--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;

CREATE TABLE `aircraft` (
  `AircraftID` varchar(255) NOT NULL,
  `Aircraft_Type` varchar(255) DEFAULT NULL,
  `Manufacturer` varchar(255) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Manufactured_Year` int DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`AircraftID`)
) 

-- Table structure for table `aircraft_configurations`
--

DROP TABLE IF EXISTS `aircraft_configurations`;

CREATE TABLE `aircraft_configurations` (
  `ConfigurationID` varchar(255) NOT NULL,
  `AircraftID` varchar(255) DEFAULT NULL,
  `Configuration_Name` varchar(255) DEFAULT NULL,
  `Seat_Layout` varchar(255) DEFAULT NULL,
  `Cabin_Class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ConfigurationID`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `aircraft_configurations_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`)
) 

-- Table structure for table `aircraft_insurance`
--

DROP TABLE IF EXISTS `aircraft_insurance`;

CREATE TABLE `aircraft_insurance` (
  `InsuranceID` varchar(255) NOT NULL,
  `AircraftID` varchar(255) DEFAULT NULL,
  `Provider` varchar(255) DEFAULT NULL,
  `Policy_No` varchar(255) DEFAULT NULL,
  `Coverage_Amount` int DEFAULT NULL,
  `Expiration_Date` date DEFAULT NULL,
  PRIMARY KEY (`InsuranceID`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `aircraft_insurance_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`)
)


-- Table structure for table `aircraft_maintenance_history`
--

DROP TABLE IF EXISTS `aircraft_maintenance_history`;

CREATE TABLE `aircraft_maintenance_history` (
  `MaintenanceID` varchar(255) NOT NULL,
  `AircraftID` varchar(255) DEFAULT NULL,
  `Maintenance_Type` varchar(255) DEFAULT NULL,
  `Maintenance_Date` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaintenanceID`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `aircraft_maintenance_history_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`)
) 


-- Table structure for table `aircraft_status`
--

DROP TABLE IF EXISTS `aircraft_status`;

CREATE TABLE `aircraft_status` (
  `StatusID` varchar(255) NOT NULL,
  `AircraftID` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Last_Maintenance_Date` date DEFAULT NULL,
  `Next_Maintenance_Date` date DEFAULT NULL,
  PRIMARY KEY (`StatusID`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `aircraft_status_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`)
) 


-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `AirportID` varchar(255) NOT NULL,
  `Airport_Name` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Latitude` decimal(10,8) DEFAULT NULL,
  `Longitude` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`AirportID`)
) 

-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;

CREATE TABLE `crew` (
  `CrewID` varchar(255) NOT NULL,
  `First_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `Base_AirportID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CrewID`),
  KEY `Base_AirportID` (`Base_AirportID`),
  CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`Base_AirportID`) REFERENCES `airport` (`AirportID`)
) 


-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;

CREATE TABLE `flight` (
  `FlightID` varchar(255) NOT NULL,
  `AircraftID` varchar(255) DEFAULT NULL,
  `DepartureAirportID` varchar(255) DEFAULT NULL,
  `ArrivalAirportID` varchar(255) DEFAULT NULL,
  `FlightDuration` decimal(10,2) DEFAULT NULL,
  `TicketPrice` int DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `DepartureDate` date DEFAULT NULL,
  `ArrivalDate` date DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `Over_Booked` int DEFAULT NULL,
  PRIMARY KEY (`FlightID`),
  KEY `AircraftID` (`AircraftID`),
  KEY `DepartureAirportID` (`DepartureAirportID`),
  KEY `ArrivalAirportID` (`ArrivalAirportID`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`DepartureAirportID`) REFERENCES `airport` (`AirportID`),
  CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`ArrivalAirportID`) REFERENCES `airport` (`AirportID`)
) 



-- Table structure for table `cancelled_flights`
--

DROP TABLE IF EXISTS `cancelled_flights`;

CREATE TABLE `cancelled_flights` (
  `CancellationID` varchar(255) NOT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Cancellation_Reason` varchar(255) DEFAULT NULL,
  `Cancellation_Date` date DEFAULT NULL,
  `Cancellation_Time` time DEFAULT NULL,
  PRIMARY KEY (`CancellationID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `cancelled_flights_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
) 



-- Table structure for table `crew_flight`
--

DROP TABLE IF EXISTS `crew_flight`;

CREATE TABLE `crew_flight` (
  `CrewFlightID` varchar(255) NOT NULL,
  `CrewID` varchar(255) DEFAULT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Duty_Date` date DEFAULT NULL,
  `Duty_Hours` int DEFAULT NULL,
  PRIMARY KEY (`CrewFlightID`),
  KEY `CrewID` (`CrewID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `crew_flight_ibfk_1` FOREIGN KEY (`CrewID`) REFERENCES `crew` (`CrewID`),
  CONSTRAINT `crew_flight_ibfk_2` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
) 



-- Table structure for table `delayed_flights`
--

DROP TABLE IF EXISTS `delayed_flights`;

CREATE TABLE `delayed_flights` (
  `DelayID` varchar(255) NOT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Delay_Reason` varchar(255) DEFAULT NULL,
  `Delay_Duration` time DEFAULT NULL,
  `Delay_DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`DelayID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `delayed_flights_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
) 




-- Table structure for table `flight_catering`
--

DROP TABLE IF EXISTS `flight_catering`;

CREATE TABLE `flight_catering` (
  `CateringID` varchar(255) NOT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Menu` varchar(255) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Special_Requests` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CateringID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `flight_catering_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
) 




-- Table structure for table `flight_documents`
--

DROP TABLE IF EXISTS `flight_documents`;

CREATE TABLE `flight_documents` (
  `DocumentID` varchar(255) NOT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Document_Type` varchar(255) DEFAULT NULL,
  `Document_Path` varchar(255) DEFAULT NULL,
  `Upload_DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`DocumentID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `flight_documents_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
)




-- Table structure for table `flightstatus`
--

DROP TABLE IF EXISTS `flightstatus`;

CREATE TABLE `flightstatus` (
  `StatusID` varchar(255) NOT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Update_DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`StatusID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `flightstatus_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
) 




-- Table structure for table `frequent_flyer_program`
--

DROP TABLE IF EXISTS `frequent_flyer_program`;

CREATE TABLE `frequent_flyer_program` (
  `ProgramID` varchar(255) NOT NULL,
  `Program_Name` varchar(255) DEFAULT NULL,
  `Benefits_Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProgramID`)
) 




-- Table structure for table `in_flight_entertainment`
--

DROP TABLE IF EXISTS `in_flight_entertainment`;

CREATE TABLE `in_flight_entertainment` (
  `EntertainmentID` varchar(255) NOT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EntertainmentID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `in_flight_entertainment_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
) 




-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;

CREATE TABLE `passenger` (
  `PassengerID` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` bigint DEFAULT NULL,
  PRIMARY KEY (`PassengerID`)
) 



-- Table structure for table `baggage`
--

DROP TABLE IF EXISTS `baggage`;

CREATE TABLE `baggage` (
  `BaggageID` varchar(255) NOT NULL,
  `PassengerID` varchar(255) DEFAULT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Weight` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`BaggageID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `baggage_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `baggage_ibfk_2` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
) 




-- Table structure for table `cancelled_flight_compensation`
--

DROP TABLE IF EXISTS `cancelled_flight_compensation`;

CREATE TABLE `cancelled_flight_compensation` (
  `CompensationID` varchar(255) NOT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `PassengerID` varchar(255) DEFAULT NULL,
  `Compensation_Amount` int DEFAULT NULL,
  `Compensation_Type` varchar(255) DEFAULT NULL,
  `Compensation_Date` date DEFAULT NULL,
  `Compensation_Time` time DEFAULT NULL,
  PRIMARY KEY (`CompensationID`),
  KEY `FlightID` (`FlightID`),
  KEY `PassengerID` (`PassengerID`),
  CONSTRAINT `cancelled_flight_compensation_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`),
  CONSTRAINT `cancelled_flight_compensation_ibfk_2` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`)
) 




-- Table structure for table `flight_feedback`
--

DROP TABLE IF EXISTS `flight_feedback`;

CREATE TABLE `flight_feedback` (
  `FeedbackID` varchar(255) NOT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `PassengerID` varchar(255) DEFAULT NULL,
  `FeedbackDate` date DEFAULT NULL,
  `FeedbackText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `FlightID` (`FlightID`),
  KEY `PassengerID` (`PassengerID`),
  CONSTRAINT `flight_feedback_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`),
  CONSTRAINT `flight_feedback_ibfk_2` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`)
)





-- Table structure for table `frequent_flyer_member`
--

DROP TABLE IF EXISTS `frequent_flyer_member`;

CREATE TABLE `frequent_flyer_member` (
  `MemberID` varchar(255) NOT NULL,
  `PassengerID` varchar(255) DEFAULT NULL,
  `ProgramID` varchar(255) DEFAULT NULL,
  `Membership_No` varchar(255) DEFAULT NULL,
  `Points` int DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `ProgramID` (`ProgramID`),
  CONSTRAINT `frequent_flyer_member_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `frequent_flyer_member_ibfk_2` FOREIGN KEY (`ProgramID`) REFERENCES `frequent_flyer_program` (`ProgramID`)
) 




-- Table structure for table `lost_found_items`
--

DROP TABLE IF EXISTS `lost_found_items`;

CREATE TABLE `lost_found_items` (
  `ItemID` varchar(255) NOT NULL,
  `PassengerID` varchar(255) DEFAULT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Found_Date` date DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `lost_found_items_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `lost_found_items_ibfk_2` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
) 





-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;

CREATE TABLE `payment_method` (
  `MethodID` varchar(255) NOT NULL,
  `Method_Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MethodID`)
) 




-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
  `ReservationID` varchar(255) NOT NULL,
  `PassengerID` varchar(255) DEFAULT NULL,
  `FlightID` varchar(255) DEFAULT NULL,
  `Seat_Number` varchar(50) DEFAULT NULL,
  `Reservation_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`)
) 




-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes` (
  `RouteID` varchar(50) NOT NULL,
  `Departure_AirportID` varchar(50) DEFAULT NULL,
  `Arrival_AirportID` varchar(50) DEFAULT NULL,
  `Distance` int DEFAULT NULL,
  PRIMARY KEY (`RouteID`)
) 




-- Table structure for table `weather_conditions`
--

DROP TABLE IF EXISTS `weather_conditions`;

CREATE TABLE `weather_conditions` (
  `ConditionID` varchar(255) NOT NULL,
  `AirportID` varchar(255) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  `Temperature` int DEFAULT NULL,
  `Wind_Speed` int DEFAULT NULL,
  `Precipitation` int DEFAULT NULL,
  PRIMARY KEY (`ConditionID`),
  KEY `AirportID` (`AirportID`),
  CONSTRAINT `weather_conditions_ibfk_1` FOREIGN KEY (`AirportID`) REFERENCES `airport` (`AirportID`)
) 




-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `TransactionID` varchar(255) NOT NULL,
  `ReservationID` varchar(255) DEFAULT NULL,
  `MethodID` varchar(255) DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `Transaction_Time` time DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `ReservationID` (`ReservationID`),
  KEY `MethodID` (`MethodID`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`MethodID`) REFERENCES `payment_method` (`MethodID`)
) 



-- Table structure for table `rescheduled_flights`
--

DROP TABLE IF EXISTS `rescheduled_flights`;

CREATE TABLE `rescheduled_flights` (
  `Rescheduled_FlightID` varchar(255) NOT NULL,
  `CancellationID` varchar(255) DEFAULT NULL,
  `ReImbursement_Fee` int DEFAULT NULL,
  `Airline` varchar(255) DEFAULT NULL,
  `Departure_Location` varchar(255) DEFAULT NULL,
  `Arrival_Location` varchar(255) DEFAULT NULL,
  `Departure_date` date DEFAULT NULL,
  `Departure_time` time DEFAULT NULL,
  `Arrival_time` time DEFAULT NULL,
  `Arrival_date` date DEFAULT NULL,
  PRIMARY KEY (`Rescheduled_FlightID`),
  KEY `CancellationID` (`CancellationID`),
  CONSTRAINT `rescheduled_flights_ibfk_1` FOREIGN KEY (`CancellationID`) REFERENCES `cancelled_flights` (`CancellationID`)
) 

