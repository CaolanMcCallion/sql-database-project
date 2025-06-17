-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 17, 2025 at 05:07 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing_information`
--

CREATE TABLE `billing_information` (
  `billing_information_id` int NOT NULL,
  `card_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name_on_card` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `expiration_date` date NOT NULL,
  `primary_card` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `profile_id` int NOT NULL,
  `address_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `billing_information`
--

INSERT INTO `billing_information` (`billing_information_id`, `card_number`, `name_on_card`, `expiration_date`, `primary_card`, `profile_id`, `address_id`) VALUES
(1, '1234567890123456', 'John Doe', '2026-05-01', 'Yes', 1, 1),
(2, '9876543210987654', 'Jane Smith', '2027-07-15', 'No', 2, 2),
(3, '1111222233334444', 'Michael Johnson', '2025-11-30', 'Yes', 3, 3),
(4, '5555666677778888', 'Emily Davis', '2028-02-20', 'No', 4, 4),
(5, '4444333322221111', 'David Brown', '2029-09-09', 'Yes', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `card_details`
--

CREATE TABLE `card_details` (
  `card_details_id` int NOT NULL,
  `cardholder_name` varchar(255) NOT NULL,
  `card_long_number` varbinary(255) NOT NULL,
  `card_start_date` date NOT NULL,
  `card_end_date` date NOT NULL,
  `card_type` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `customer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `card_details`
--

INSERT INTO `card_details` (`card_details_id`, `cardholder_name`, `card_long_number`, `card_start_date`, `card_end_date`, `card_type`, `billing_address`, `customer_id`) VALUES
(1, 'John Doe', 0x34313131313131313131313131313131, '2024-01-01', '2027-01-01', 'Visa', '123 Main St, Belfast', 1),
(2, 'Jane Smith', 0x35313035313035313035313035313030, '2024-02-01', '2026-02-01', 'MasterCard', '456 Elm St, London', 2),
(3, 'Michael Johnson', 0x36303131353130363030303030303030, '2023-06-01', '2025-06-01', 'Discover', '789 Oak St, Cardiff', 3),
(4, 'Emily Davis', 0x34313131313131313131313131313132, '2024-03-01', '2027-03-01', 'Visa', '101 Pine St, Edinburgh', 4),
(5, 'David Wilson', 0x35313035313035313035313035313031, '2024-04-01', '2026-04-01', 'MasterCard', '202 Cedar St, Manchester', 5),
(15, 'Mr James Smith', 0x88779c62e571273fd6507d1a2ecf031055670b6826d9c65eae7eddcc68b0ef45, '2019-10-08', '2024-10-08', 'Visa', '123 Main St, Belfast', 1),
(16, 'Sarah Williams', 0x877e1c92256bf6234685b63ba78497660c64e42422250d3ee8ef073732034773, '2023-01-01', '2028-01-01', 'Visa', '123 Ravenhill Road, Belfast', 6);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `region_id` int NOT NULL,
  `country_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `region_id`, `country_id`) VALUES
(1, 'Belfast', 1, 1),
(2, 'London', 2, 2),
(3, 'Edinburgh', 3, 3),
(4, 'Cardiff', 4, 4),
(5, 'Liverpool', 5, 2),
(6, 'Manchester', 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'Northern Ireland'),
(2, 'England'),
(3, 'Scotland'),
(4, 'Wales');

-- --------------------------------------------------------

--
-- Table structure for table `customer_account`
--

CREATE TABLE `customer_account` (
  `customer_id` int NOT NULL,
  `customer_account_number` int NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `post_code` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `ticket_id` int NOT NULL,
  `favorite_events` varchar(255) NOT NULL,
  `alerts` tinyint NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `hashed_password` varbinary(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_account`
--

INSERT INTO `customer_account` (`customer_id`, `customer_account_number`, `last_name`, `first_name`, `customer_address`, `city`, `post_code`, `country`, `ticket_id`, `favorite_events`, `alerts`, `email_address`, `phone_number`, `hashed_password`) VALUES
(1, 10001, 'Doe', 'John', '123 Main St, Belfast', 'Belfast', 'BT1 1AA', 'Northern Ireland', 1, 'Rock Concert, Football Match', 1, 'johndoe@email.com', '07123456789', ''),
(2, 10002, 'Smith', 'Jane', '456 Elm St, London', 'London', 'E1 2AB', 'England', 2, 'Theater Play, Family Fun Day', 0, 'janesmith@email.com', '07234567890', ''),
(3, 10003, 'Johnson', 'Michael', '789 Oak St, Cardiff', 'Cardiff', 'CF10 1AD', 'Wales', 3, 'Jazz Concert, Football Match', 1, 'michaeljohnson@email.com', '07345678901', ''),
(4, 10004, 'Davis', 'Emily', '101 Pine St, Edinburgh', 'Edinburgh', 'EH1 3AA', 'Scotland', 4, 'Opera, Rock Concert', 0, 'emilydavis@email.com', '07456789012', ''),
(5, 10005, 'Brown', 'David', '202 Cedar St, Manchester', 'Manchester', 'M2 5BW', 'England', 5, 'Football Match, Theater Play', 1, 'davidwilson@email.com', '07567890123', ''),
(6, 10006, 'Williams', 'Sarah', '123 Ravenhill Road, Belfast', 'Belfast', 'B1 2AA', 'Northern Ireland', 1, 'Rock Concert, Theater Play', 1, 'sarahwilliams@email.com', '07654321098', 0x37363362376163613630343237306165656163326132333438353931353838663438383230393964);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `address_id` int NOT NULL,
  `building_num` varchar(255) NOT NULL,
  `building_name` varchar(255) NOT NULL,
  `address_line_1` varchar(500) NOT NULL,
  `city_id` int NOT NULL,
  `region_id` int NOT NULL,
  `country_id` int NOT NULL,
  `post_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`address_id`, `building_num`, `building_name`, `address_line_1`, `city_id`, `region_id`, `country_id`, `post_code`) VALUES
(1, '5', 'Sunny Apartments', '5 Queen Street', 2, 2, 2, 'W1F 8HF'),
(2, '10', 'Oakwood Residence', '10 Park Avenue', 6, 6, 2, 'M3 3AP'),
(3, '22', 'Seaside Cottage', '22 Ocean Drive', 1, 1, 1, 'BT15 3SD'),
(4, '77', 'Greenhill Apartments', '77 High Street', 4, 4, 4, 'CF10 1LP'),
(5, '3', 'River View Flats', '3 Bridge Road', 3, 3, 3, 'EH7 4AA');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discount_id` int NOT NULL,
  `discount_code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `discount_type` enum('percentage','fixed_amount') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `min_purchase_amount` decimal(10,2) NOT NULL,
  `max_purchase_amount` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `ticket_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discount_id`, `discount_code`, `description`, `discount_type`, `discount_value`, `start_date`, `end_date`, `min_purchase_amount`, `max_purchase_amount`, `is_active`, `created_at`, `updated_at`, `ticket_id`) VALUES
(1, 'DISCOUNT10', '10% off any ticket purchase', 'percentage', 10.00, '2024-01-01', '2024-12-31', 10.00, 100.00, 1, '2024-11-14 20:02:31', '2024-11-14 20:02:31', 1),
(2, 'SPRINGSALE', '15% off theater tickets', 'percentage', 15.00, '2024-03-01', '2024-05-31', 20.00, 300.00, 1, '2024-11-14 20:01:59', '2024-11-14 20:01:59', 2),
(3, 'SUMMERSALE', 'Flat £20 off any purchase over £100', 'fixed_amount', 20.00, '2024-06-01', '2024-08-31', 100.00, 500.00, 1, '2024-11-14 20:01:59', '2024-11-14 20:01:59', 3),
(4, 'WELCOME', '5% off your first purchase', 'percentage', 5.00, '2024-07-01', '2024-09-30', 10.00, 150.00, 1, '2024-11-14 20:01:59', '2024-11-14 20:01:59', 4),
(5, 'BLACKFRIDAY', '20% off all purchases', 'percentage', 20.00, '2024-11-01', '2024-11-30', 50.00, 1000.00, 1, '2024-11-14 20:01:59', '2024-11-14 20:01:59', 5);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int NOT NULL,
  `event_type_id` int NOT NULL,
  `event_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `date` date NOT NULL,
  `venue_id` int NOT NULL,
  `performer_id` int NOT NULL,
  `performer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ticket_price` decimal(10,2) NOT NULL,
  `availability` int NOT NULL,
  `seating_plan` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `age_restrictions` int NOT NULL,
  `promoter_information` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `covid19_guidelines` text NOT NULL,
  `help_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `event_description` text NOT NULL,
  `event_status` enum('Upcoming','Ongoing','Completed','Cancelled','Postponed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_type_id`, `event_name`, `date`, `venue_id`, `performer_id`, `performer`, `ticket_price`, `availability`, `seating_plan`, `age_restrictions`, `promoter_information`, `covid19_guidelines`, `help_id`, `policy_id`, `event_description`, `event_status`) VALUES
(1, 1, 'The Illmatic Tour', '2024-12-15', 1, 1, 'Nas', 75.00, 5000, 'Seating Plan A', 18, 'Promoter: XYZ Promotions', 'Face masks required', 1, 4, 'A live concert featuring the legendary Hip-Hop artist Nas', 'Upcoming'),
(2, 4, 'Family Fun Day', '2024-12-05', 2, 9, 'Various Family Performers', 25.00, 10000, 'Seating Plan D', 0, 'Promoter: Family Events Ltd.', 'No restrictions', 4, 5, 'A family-friendly event with performances and interactive activities for kids', 'Upcoming'),
(3, 1, 'The Ella & Louis Tour', '2024-11-18', 3, 5, 'Louis Armstrong Quartet', 100.00, 350, 'Seating Plan E', 16, 'Promoter: Jazz Lovers Inc.', 'Temperature checks at entrance', 5, 5, 'An evening of smooth jazz with the Ella Fitzgerald, Louis Armstrong & their Quartet band.', 'Completed'),
(4, 2, 'Liverpool FC vs Cardiff City', '2024-11-20', 2, 8, 'Liverpool FC & Cardiff City', 50.00, 74000, 'Seating Plan B', 0, 'Promoter: Sport Entertainment Ltd.', 'Social distancing measures in place', 2, 2, 'A high-stakes football match featuring Liverpool FC against Cardiff City', 'Ongoing'),
(5, 3, 'Theater Play', '2024-11-25', 4, 10, 'National Theatre', 40.00, 1200, 'Seating Plan C', 12, 'Promoter: Arts Theatre Co.', 'Masks optional', 1, 3, 'A classic play performance by the National Theatre', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `Event_type_id` int NOT NULL,
  `event_type_name` varchar(255) NOT NULL,
  `event_type_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`Event_type_id`, `event_type_name`, `event_type_description`) VALUES
(1, 'Music', 'A music event is a live performance or gathering where artists, musicians, or bands showcase their musical talents to an audience. These events can range from intimate acoustic sets to large-scale concerts featuring multiple performers or genres. Music events may include a variety of performances such as rock, pop, jazz, classical, electronic, hip-hop, and more, and are often held at venues like concert halls, stadiums, festivals, or outdoor arenas. The purpose of a music event is to bring people together to enjoy and celebrate the art of music in a communal setting, offering an unforgettable experience of rhythm, melody, and connection.'),
(2, 'Sports', 'A sports event is a live competition or exhibition where athletes or teams participate in a physical contest or game. These events can include a variety of sports such as football, basketball, tennis, golf, and more. Sports events are typically held in stadiums, arenas, or outdoor venues, and are often attended by fans who support their favorite teams or athletes. These events are often high-energy and can range from local matches to major international tournaments and championships.'),
(3, 'Arts, Theatre & Comedy', 'An arts, theatre, and comedy event is a live performance showcasing the creative expressions of actors, musicians, comedians, and artists. This category includes theatre plays, musicals, operas, stand-up comedy shows, improv, and other live entertainment forms that focus on the arts and performance. These events are usually held in theatres, comedy clubs, or smaller venues, offering a more intimate and artistic experience. Audiences attend to enjoy culture, entertainment, and creative expression through storytelling, humor, and performance art.'),
(4, 'Family & Attractions', 'A family & attractions event is designed to entertain all ages, particularly families, with activities, shows, and experiences suitable for children and adults alike. This can include theme parks, fairs, circuses, outdoor festivals, holiday events, and other activities that encourage family participation. These events often feature rides, games, performances, and interactive exhibits, making them a popular choice for family outings. The goal is to provide fun, engaging, and memorable experiences for people of all ages in a safe and enjoyable environment.');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int NOT NULL,
  `genre_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`, `description`) VALUES
(1, 'Hip-hop', 'Hip hop is a complex cultural movement that combines music, art, and dance. The music is often built around drum beats and includes rapping, beatboxing, and instrumental tracks.'),
(2, 'Pop', 'Pop is short for popular, and it\'s the most mainstream musical genre. Pop music is the most accessible of all genres, with its songs being easy to listen to and sing along with. This is why it\'s so popular among young people.'),
(3, 'Rock', 'Rock music is famous for having a strong backbeat, usually in 4/4 rhythm, although more progressive styles can employ trickier time signatures'),
(4, 'Jazz', 'Jazz is characterized by swing and blue notes, complex chords, call and response vocals, polyrhythms and improvisation.'),
(5, 'R&B', 'One of the oldest genres of American music, R&B blends influences from the sounds of blues, gospel, funk, boogie, ballads, and smooth melodies.'),
(6, 'Country', 'Country music is known for its simple form and harmony, and is often accompanied by acoustic or electric guitar, banjo, violin, and harmonica. Country singers often have a distinctive \"twangy\" style.');

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `help_id` int NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `help`
--

INSERT INTO `help` (`help_id`, `category_name`, `url`) VALUES
(1, 'Booking Tickets', 'https://help.ticketmaster.co.uk/hc/en-us/categories/18508117441809-Booking-Tickets'),
(2, 'My Tickets', 'https://help.ticketmaster.co.uk/hc/en-us/categories/360000577313-My-Tickets'),
(3, 'Resale', 'https://help.ticketmaster.co.uk/hc/en-us/categories/360003488338-Resale'),
(4, 'Refunds & Exchanges', 'https://help.ticketmaster.co.uk/hc/en-us/categories/360000277737-Refunds-and-Exchanges'),
(5, 'Accessibility', 'https://help.ticketmaster.co.uk/hc/en-us/categories/360001728734-Accessibility'),
(6, 'Cancelled & Altered Events', 'https://help.ticketmaster.co.uk/hc/en-us/categories/360000580174-Cancelled-and-Altered-Events'),
(7, 'Contact Us', 'https://help.ticketmaster.co.uk/hc/en-us/articles/360017761298-How-to-Contact-Us'),
(8, 'Transfer Tickets', 'https://help.ticketmaster.co.uk/hc/en-us/categories/18508121025681-Transfer-Tickets'),
(9, 'My Account', 'https://help.ticketmaster.co.uk/hc/en-us/categories/360000279298-My-Account'),
(10, 'Event Information', 'https://help.ticketmaster.co.uk/hc/en-us/categories/360000265778-Event-Information'),
(11, 'Ticket Delivery', 'https://help.ticketmaster.co.uk/hc/en-us/categories/360000577253-Ticket-Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `image_alt_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `image_url`, `image_alt_text`) VALUES
(1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Royal_Festival_Hall_%2837366103611%29.jpg/800px-Royal_Festival_Hall_%2837366103611%29.jpg', 'Photo of the Royal Concert Hall in London'),
(2, 'https://www.ssearenabelfast.com/venue-hire', 'Photo of the SSE Arena in Belfast.'),
(3, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/27/ee/69/the-boulevard-soho.jpg?w=900&h=500&s=1', 'Photo of the Jazz Lounge in Liverpool.'),
(4, 'https://s3.amazonaws.com/shecodesio-production/uploads/files/000/020/165/original/pic2.jpg?1635687264', 'Photo of The Grand Theatre in Edinburgh.'),
(5, 'https://visitwalesimages.thedms.co.uk/eandapics/MW/vlarge/1010944_121_1.jpg', 'Photo of the Principality Stadium in Cardiff.'),
(6, 'https://s1.ticketm.net/uk/tmimages/venue/maps/uk6/22973s.gif', 'Seating Plan for the SSE');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int NOT NULL,
  `venue_id` int NOT NULL,
  `street_line1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `street_line2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `post_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `county` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `country_id` int NOT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `parking_information` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `accessible_facilities` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `venue_id`, `street_line1`, `street_line2`, `city`, `post_code`, `county`, `country_id`, `latitude`, `longitude`, `phone_number`, `website`, `parking_information`, `accessible_facilities`) VALUES
(1, 1, '2 Queens Quay', 'Northern Ireland', 'Belfast', 'BT3 9QQ', 'Antrim', 1, '54.6028', '-5.9299', '028 9073 9074', 'https://www.ssearenabelfast.com', 'Parking available for 1,000 cars', 'Wheelchair accessible, ramps available'),
(2, 2, '1 Main Street', '', 'London', 'WC2N 5DN', 'Greater London', 2, '51.5074', '-0.1278', '020 7845 1500', 'https://www.royalconcert.com', 'Parking available for 300 cars', 'Accessible bathrooms, elevator access'),
(3, 3, 'Peninsula Square', '', 'London', 'SE10 0DX', 'Greater London', 2, '51.5033', '-0.0035', '020 8463 2000', 'https://www.theo2.co.uk', 'Parking available for 2,500 cars', 'Wheelchair accessible seating, ramps available'),
(4, 4, 'Westgate Street', '', 'Cardiff', 'CF10 1AD', 'Cardiff', 3, '51.4816', '-3.1791', '029 2082 2112', 'https://www.principalitystadium.wales', 'Parking available for 2,000 cars', 'Accessible seating, ramps for wheelchair users'),
(5, 5, 'Lothian Road', '', 'Edinburgh', 'EH1 2EA', 'Midlothian', 4, '55.9479', '-3.2022', '0131 228 1155', 'https://www.usherhall.co.uk', 'Street parking available', 'Wheelchair accessible entrance, disabled toilets');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `ticket_quantity` int NOT NULL,
  `date_placed` date NOT NULL,
  `payment_id` int NOT NULL,
  `order_status` enum('completed','pending','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `ticket_id`, `ticket_quantity`, `date_placed`, `payment_id`, `order_status`) VALUES
(1, 1, 1, 4, '2024-11-06', 1, 'completed'),
(2, 2, 2, 2, '2024-06-12', 2, 'completed'),
(3, 3, 3, 1, '2023-11-10', 3, 'pending'),
(4, 4, 4, 5, '2024-11-14', 4, 'pending'),
(5, 5, 5, 2, '2024-11-01', 5, 'cancelled'),
(8, 6, 3, 2, '2024-11-24', 2, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL,
  `order_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `ticket_id`, `quantity`, `price`) VALUES
(1, 1, 1, 4, 200.00),
(2, 2, 2, 2, 240.00),
(3, 3, 3, 1, 150.00),
(4, 4, 4, 5, 275.00),
(5, 5, 5, 2, 400.00),
(7, 8, 3, 2, 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `payment_option` varchar(255) NOT NULL,
  `promocodes` varchar(255) NOT NULL,
  `insurance` tinyint(1) NOT NULL,
  `facility_charge` int NOT NULL,
  `service_charge` int NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `ticket_id` int NOT NULL,
  `card_details_id` int NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_option`, `promocodes`, `insurance`, `facility_charge`, `service_charge`, `billing_address`, `ticket_id`, `card_details_id`, `payment_status`) VALUES
(1, 'Credit Card', 'DISCOUNT10', 1, 5, 2, '123 Main St, Belfast', 1, 1, 'completed'),
(2, 'PayPal', 'SPRINGSALE', 0, 3, 1, '456 Elm St, London', 2, 2, 'pending'),
(3, 'Debit Card', 'SUMMERSALE', 0, 4, 3, '789 Oak St, Cardiff', 3, 3, 'failed'),
(4, 'Credit Card', 'WELCOME', 1, 6, 2, '101 Pine St, Edinburgh', 4, 4, 'completed'),
(5, 'Bank Transfer', 'BLACKFRIDAY', 1, 0, 4, '202 Cedar St, Manchester', 5, 5, 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `performer`
--

CREATE TABLE `performer` (
  `performer_id` int NOT NULL,
  `performer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age_restriction` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `social_media_links` varchar(255) NOT NULL,
  `Event_type_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `performer`
--

INSERT INTO `performer` (`performer_id`, `performer_name`, `age_restriction`, `description`, `social_media_links`, `Event_type_id`) VALUES
(1, 'Nas', '18+', 'Nas (born September 14, 1973, Brooklyn, New York, U.S.) is an American rapper and songwriter who became a dominant voice in 1990s East Coast hip-hop. Nas built a reputation as an expressive chronicler of inner-city street life. Nasir Jones, the son of a jazz musician, grew up in public housing in Queens, New York', 'https://www.instagram.com/nas', 1),
(2, 'Jay-Z', '18+', 'JAY-Z (born December 4, 1969, Brooklyn, New York, U.S.) is an American rapper and entrepreneur, one of the most influential figures in hip-hop in the 1990s and early 21st century. Shawn Carter grew up in Brooklyn.', 'https://www.instagram.com/Jayz', 1),
(3, 'Michael Jackson', 'All ages (under 12\'s to be accompanied by an adult)', 'Michael Jackson is an American singer, songwriter, and dancer who was the most popular entertainer in the world in the early and mid-1980s. Even today he is widely regarded as the “King of Pop.”', 'https://www.instagram.com/michaeljackson/?hl=en', 1),
(4, 'The Beatles', '16+', 'The Beatles are an English pop/rock band, started in Liverpool, England in 1960. The members were John Lennon, Paul McCartney, George Harrison, and Ringo Starr. They are widely regarded as one of the most successful and influential bands in the history of popular music.', 'https://www.instagram.com/thebeatles/?hl=en\r\n\r\nhttps://www.facebook.com/thebeatles/?locale=en_GB', 1),
(5, 'Louis Armstrong', '12+', '​Louis Armstrong is rightly celebrated as a master jazz trumpeter, but his distinctive gravelly-voiced singing also had a huge influence on later artists. His vocal improvisations and the powerful feeling of swing that he brought to everything he sang loosened up the more formal style of his contemporaries.', 'https://twitter.com/armstronghouse?lang=en', 1),
(6, 'Rihanna', '18+', 'Rihanna is a Barbadian pop and rhythm-and-blues (R&B) singer who became a worldwide star in the early 21st century. She is known for her distinctive and versatile voice and for her fashionable appearance. She is also known for her beauty and fashion lines.', 'https://www.instagram.com/badgalriri/?hl=en\r\n\r\nhttps://twitter.com/rihanna', 1),
(7, 'Willie Nelson', '12+', 'William Hugh Nelson (born April 29, 1933) is an American singer, guitarist and songwriter. He was one of the main figures of the outlaw country subgenre that developed in the late 1960s as a reaction to the conservative restrictions of the Nashville sound.', 'https://www.facebook.com/WillieNelson/?locale=en_GB', 1),
(8, 'Liverpool FC & Cardiff City', 'All Ages', 'A football match contested between Liverpool FC & Cardiff City.', 'instragram.com/liverpoolfc\r\nx.com/cardiffcityfc', 2),
(9, 'Children Entertainers UK', 'All ages', 'A collection of chiildren\'s performers, available for bookings at various venues across the country.', 'https://www.facebook.com/groups/ChEntUK/?locale=en_GB', 4),
(10, 'Red Ladder Theatre Company', 'All Ages', 'Red Ladder is a radical theatre company with 50 years of history. The company is acknowledged as one of Britain’s leading national touring companies producing new theatre, contributing to social change and global justice. ', 'https://www.redladder.co.uk/', 3);

-- --------------------------------------------------------

--
-- Table structure for table `policy`
--

CREATE TABLE `policy` (
  `policy_id` int NOT NULL,
  `policy_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `policy`
--

INSERT INTO `policy` (`policy_id`, `policy_name`) VALUES
(1, 'Smoking Allowed'),
(2, 'No Smoking ALllowed'),
(3, 'Age Restriction 16+'),
(4, 'Age Restriction 18+'),
(5, 'Bag allowed'),
(6, 'Under 25\'s require ID to purchase alcohol');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `giftcard_balance` decimal(10,2) NOT NULL,
  `accessibility` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profile_id`, `payment_id`, `customer_id`, `giftcard_balance`, `accessibility`) VALUES
(1, 1, 1, 50.00, 1),
(2, 2, 2, 100.00, 0),
(3, 3, 3, 75.50, 1),
(4, 4, 4, 120.00, 0),
(5, 5, 5, 150.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int NOT NULL,
  `region_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `region_name`) VALUES
(1, 'Antrim'),
(2, 'Greater London'),
(3, 'Lothian'),
(4, 'Cardiff Capital'),
(5, 'Liverpool Metropolitan Area'),
(6, 'Greater Manchester');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `seat_id` int NOT NULL,
  `venue_id` int NOT NULL,
  `section` varchar(255) NOT NULL,
  `section_cost` varchar(255) NOT NULL,
  `accessible` tinyint(1) NOT NULL,
  `obscured_restriction` varchar(255) NOT NULL,
  `vip` tinyint(1) NOT NULL,
  `seat_name` varchar(11) NOT NULL,
  `row` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`seat_id`, `venue_id`, `section`, `section_cost`, `accessible`, `obscured_restriction`, `vip`, `seat_name`, `row`, `level`) VALUES
(1, 1, 'Front', '50.00', 1, 'No', 0, 'Seat 1A', 'A', 'Ground'),
(2, 1, 'Middle', '60.00', 0, 'No', 0, 'Seat 2B', 'B', 'Upper'),
(3, 2, 'VIP', '120.00', 1, 'Partial Obstruction', 1, 'Seat 3C', 'C', 'Lower'),
(4, 3, 'Standard', '40.00', 1, 'No', 0, 'Seat 4D', 'D', 'Ground'),
(5, 4, 'VIP', '150.00', 0, 'Completely Obstructed', 1, 'Seat 5E', 'E', 'Upper');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL,
  `ticket_number` bigint NOT NULL,
  `venue_id` int NOT NULL,
  `seat_id` int NOT NULL,
  `event_id` int NOT NULL,
  `ticket_type_id` int NOT NULL,
  `eticket` tinyint NOT NULL,
  `paper_ticket` tinyint NOT NULL,
  `delivery_method` varchar(255) NOT NULL,
  `ticket_limit` varchar(255) NOT NULL,
  `availability` int NOT NULL,
  `customer_id` int NOT NULL,
  `ticket_price_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `ticket_number`, `venue_id`, `seat_id`, `event_id`, `ticket_type_id`, `eticket`, `paper_ticket`, `delivery_method`, `ticket_limit`, `availability`, `customer_id`, `ticket_price_id`) VALUES
(1, 100001, 1, 1, 1, 1, 1, 0, 'Email', '5', 100, 1, 0),
(2, 100002, 2, 5, 2, 2, 1, 0, 'Courier', '2', 50, 2, 0),
(3, 100003, 3, 4, 3, 3, 1, 0, 'Email', '3', 75, 3, 0),
(4, 100004, 4, 2, 4, 5, 0, 1, 'Courier', '10', 250, 4, 0),
(5, 100005, 5, 3, 5, 4, 1, 0, 'Postal', '1', 30, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_type`
--

CREATE TABLE `ticket_type` (
  `ticket_type_id` int NOT NULL,
  `ticket_type` varchar(255) NOT NULL,
  `ticket_price` decimal(10,2) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ticket_type`
--

INSERT INTO `ticket_type` (`ticket_type_id`, `ticket_type`, `ticket_price`, `description`) VALUES
(1, 'Standard', 50.00, 'A standard ticket providing entry to the event. No assigned seating.'),
(2, 'VIP', 120.00, 'Includes premium seating, early access to the venue, and complimentary refreshments.'),
(3, 'Early Bird', 55.00, 'Discounted tickets for early purchases. Limited availability.'),
(4, 'Family Ticket', 200.00, 'Entry for two adults and two children. Includes access to the family zone.'),
(5, 'Student Ticket', 40.00, 'Discounted ticket for students with valid ID. General admission only.');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `transaction_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `transaction_date` datetime NOT NULL,
  `payment_method` enum('credit_card','debit_card','paypal','bank_transfer','cash','other') NOT NULL,
  `transaction_amount` decimal(10,2) DEFAULT NULL,
  `transaction_status` enum('completed','pending','cancelled') NOT NULL,
  `discount_applied` decimal(10,2) DEFAULT NULL,
  `transaction_type` enum('purchase','refund','adjustment') NOT NULL,
  `reference_code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`transaction_id`, `customer_id`, `order_id`, `transaction_date`, `payment_method`, `transaction_amount`, `transaction_status`, `discount_applied`, `transaction_type`, `reference_code`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-11-14 21:38:04', 'credit_card', 200.00, 'completed', 20.00, 'purchase', 'DISCOUNT10', '2024-11-14 21:39:01', '2024-11-14 21:39:01'),
(2, 2, 2, '2024-11-14 21:39:04', 'paypal', 240.00, 'completed', NULL, 'purchase', '', '2024-11-14 21:39:32', '2024-11-14 21:39:32'),
(3, 3, 3, '2024-11-14 21:39:33', 'debit_card', 150.00, 'pending', 30.00, 'purchase', 'BLACKFRIDAY', '2024-11-14 21:40:25', '2024-11-14 21:40:25'),
(4, 4, 4, '2024-11-14 21:40:26', 'paypal', 275.00, 'pending', NULL, 'purchase', '', '2024-11-14 21:40:49', '2024-11-14 21:40:49'),
(5, 5, 5, '2024-11-14 21:40:53', 'credit_card', 400.00, 'cancelled', 20.00, 'refund', 'WELCOME', '2024-11-14 21:41:29', '2024-11-14 21:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venue_id` int NOT NULL,
  `venue_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `type_of_venue` varchar(255) NOT NULL,
  `seating_plan` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  `accessibility` varchar(255) NOT NULL,
  `security_policies` varchar(255) NOT NULL,
  `parking_info` varchar(255) NOT NULL,
  `venue_website` varchar(255) NOT NULL,
  `location_map` varchar(255) NOT NULL,
  `image_id` int NOT NULL,
  `city_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venue_id`, `venue_name`, `address`, `type_of_venue`, `seating_plan`, `capacity`, `accessibility`, `security_policies`, `parking_info`, `venue_website`, `location_map`, `image_id`, `city_id`) VALUES
(1, 'Royal Concert Hall', '1 Main Street, London, UK', 'Concert Hall', 'Seating Plan A', 5000, '1', 'Bag checks at the entrance', 'Parking available for 300 cars', 'https://www.royalconcert.com', 'https://www.royalconcert.com/location-map', 1, 2),
(2, 'SSE Arena', '2 Queens Quay, Belfast, Northern Ireland', 'Arena', 'Seating Plan B', 10000, '1', 'Security checks and bag searches at the entrance', 'Parking available for 1,000 cars, including accessible parking spaces', 'https://www.ssearenabelfast.com', 'https://www.ssearenabelfast.com/plan', 2, 1),
(3, 'Jazz Lounge', '22 Music Blvd, Liverpool, UK', 'Club', 'Seating Plan E', 350, '1', 'ID check required for entry', 'Street parking only', 'https://www.jazzlounge.com', 'https://www.jazzlounge.com/map', 3, 5),
(4, 'Grand Theatre', '789 Broadway St, Edinburgh, UK', 'Theatre', 'Seating Plan D', 1200, '1', 'No food or drink inside', 'Valet parking available', 'https://www.grandtheatre.com', 'https://www.grandtheatre.com/location', 4, 3),
(5, 'Principality Stadium', 'Westgate Street, Cardiff, Wales', 'Stadium', 'Seating Plan C', 74000, '1', 'Metal detectors and bag searches at all entrances', 'Parking available for 2,000 cars, with additional parking near the stadium', 'https://www.principalitystadium.wales', 'https://www.principalitystadium.wales/location-map', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `venue_image`
--

CREATE TABLE `venue_image` (
  `venue_image_id` int NOT NULL,
  `venue_id` int NOT NULL,
  `image_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `venue_image`
--

INSERT INTO `venue_image` (`venue_image_id`, `venue_id`, `image_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing_information`
--
ALTER TABLE `billing_information`
  ADD PRIMARY KEY (`billing_information_id`),
  ADD KEY `FK_profile_profile_id` (`profile_id`),
  ADD KEY `FK_customer_address_address_id` (`address_id`);

--
-- Indexes for table `card_details`
--
ALTER TABLE `card_details`
  ADD PRIMARY KEY (`card_details_id`),
  ADD KEY `FK_customer_account_customer_id` (`customer_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `FK_country_country_id` (`country_id`),
  ADD KEY `FK_region_region_id` (`region_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `customer_account`
--
ALTER TABLE `customer_account`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `FK_ticket_ticket_id` (`ticket_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `FK_country_country_id2` (`country_id`),
  ADD KEY `FK_city_city_id` (`city_id`),
  ADD KEY `FK_region_region_id2` (`region_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`),
  ADD KEY `FK_ticket_ticket_id2` (`ticket_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_Event_event_type_id` (`event_type_id`),
  ADD KEY `FK_venue_venue_id2` (`venue_id`),
  ADD KEY `FK_help_help_id` (`help_id`),
  ADD KEY `fk_policy_policy_id` (`policy_id`),
  ADD KEY `FK_performer_performer_id` (`performer_id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`Event_type_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`help_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `FK_venue_venue_id3` (`venue_id`),
  ADD KEY `fk_country_country_id3` (`country_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FK_customer_customer_id2` (`customer_id`),
  ADD KEY `fk_ticket_ticket_id3` (`ticket_id`),
  ADD KEY `fk_payment_payment_id` (`payment_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `fk_order_order_id` (`order_id`),
  ADD KEY `fk_ticket_ticket_id5` (`ticket_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `FK_cars_details_car_details_id` (`card_details_id`),
  ADD KEY `fk_ticket_ticket_id4` (`ticket_id`);

--
-- Indexes for table `performer`
--
ALTER TABLE `performer`
  ADD PRIMARY KEY (`performer_id`),
  ADD KEY `fk_Event_event_type_id3` (`Event_type_id`);

--
-- Indexes for table `policy`
--
ALTER TABLE `policy`
  ADD PRIMARY KEY (`policy_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `fk_payment_payment_id2` (`payment_id`),
  ADD KEY `fk_customer_customer_id` (`customer_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `FK_venue_venue_id4` (`venue_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `FK_venue_venue_id5` (`venue_id`),
  ADD KEY `fk_seat_seat_id` (`seat_id`),
  ADD KEY `fk_event_event_id2` (`event_id`),
  ADD KEY `FK_customer_customer_id5` (`customer_id`),
  ADD KEY `FK_ticket_type_ticket_type_id` (`ticket_type_id`);

--
-- Indexes for table `ticket_type`
--
ALTER TABLE `ticket_type`
  ADD PRIMARY KEY (`ticket_type_id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `FK_customer_customer_id3` (`customer_id`),
  ADD KEY `FK_order_order_id2` (`order_id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venue_id`),
  ADD KEY `FK_image_image_id` (`image_id`),
  ADD KEY `FK_city_city_id4` (`city_id`);

--
-- Indexes for table `venue_image`
--
ALTER TABLE `venue_image`
  ADD PRIMARY KEY (`venue_image_id`),
  ADD KEY `FK_venue_venue_id` (`venue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_information`
--
ALTER TABLE `billing_information`
  MODIFY `billing_information_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `card_details`
--
ALTER TABLE `card_details`
  MODIFY `card_details_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_account`
--
ALTER TABLE `customer_account`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `address_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `Event_type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `help`
--
ALTER TABLE `help`
  MODIFY `help_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `performer`
--
ALTER TABLE `performer`
  MODIFY `performer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `policy`
--
ALTER TABLE `policy`
  MODIFY `policy_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `seat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ticket_type`
--
ALTER TABLE `ticket_type`
  MODIFY `ticket_type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `venue_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `venue_image`
--
ALTER TABLE `venue_image`
  MODIFY `venue_image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing_information`
--
ALTER TABLE `billing_information`
  ADD CONSTRAINT `FK_customer_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `customer_address` (`address_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_profile_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `card_details`
--
ALTER TABLE `card_details`
  ADD CONSTRAINT `FK_customer_account_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_account` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_country_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_region_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `customer_account`
--
ALTER TABLE `customer_account`
  ADD CONSTRAINT `FK_ticket_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `FK_city_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_country_country_id2` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_region_region_id2` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `FK_ticket_ticket_id2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_Event_event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`Event_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_help_help_id` FOREIGN KEY (`help_id`) REFERENCES `help` (`help_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_performer_performer_id` FOREIGN KEY (`performer_id`) REFERENCES `performer` (`performer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_policy_policy_id` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`policy_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_venue_venue_id2` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk_country_country_id3` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_venue_venue_id3` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_customer_customer_id2` FOREIGN KEY (`customer_id`) REFERENCES `customer_account` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_payment_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_ticket_ticket_id3` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_ticket_ticket_id5` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_cars_details_car_details_id` FOREIGN KEY (`card_details_id`) REFERENCES `card_details` (`card_details_id`),
  ADD CONSTRAINT `fk_ticket_ticket_id4` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `performer`
--
ALTER TABLE `performer`
  ADD CONSTRAINT `fk_Event_event_type_id3` FOREIGN KEY (`Event_type_id`) REFERENCES `event_type` (`Event_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_account` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_payment_payment_id2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `FK_venue_venue_id4` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_customer_customer_id5` FOREIGN KEY (`customer_id`) REFERENCES `customer_account` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_event_event_id2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_seat_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_ticket_type_ticket_type_id` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_type` (`ticket_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_venue_venue_id5` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD CONSTRAINT `FK_customer_customer_id3` FOREIGN KEY (`customer_id`) REFERENCES `customer_account` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_order_order_id2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `venue`
--
ALTER TABLE `venue`
  ADD CONSTRAINT `FK_city_city_id4` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_image_image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `venue_image`
--
ALTER TABLE `venue_image`
  ADD CONSTRAINT `FK_venue_venue_id` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
