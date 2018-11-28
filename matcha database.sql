-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2018 at 03:48 AM
-- Server version: 5.7.23
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `camagru`
--
CREATE DATABASE IF NOT EXISTS `camagru` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `camagru`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `img_name` varchar(40) NOT NULL,
  `comment` varchar(400) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `img_name`, `comment`, `date`) VALUES
(1, 1, 'da64459604c4d7424f5d7fee6909e9b2.png', 'I am Admin', '2018-11-08 11:17:40'),
(2, 1, 'da64459604c4d7424f5d7fee6909e9b2.png', 'We are Us', '2018-11-08 11:19:30'),
(3, 1, 'd73c5d1060ffcb7cf8b997f85f5fc3f6.jpg', 'Space', '2018-11-08 11:21:01'),
(4, 1, 'd73c5d1060ffcb7cf8b997f85f5fc3f6.jpg', 'gest', '2018-11-08 11:25:00'),
(5, 2, '5db401ce155bf4552f7a54a3bdc629b3.jpg', 'This is a comment', '2018-11-09 06:37:42'),
(6, 2, '776c4fbea6af63d852e13ac6c2a0772e.jpg', 'comments', '2018-11-09 06:38:42'),
(8, 2, '776c4fbea6af63d852e13ac6c2a0772e.jpg', 'My comments\n', '2018-11-09 06:41:24'),
(12, 2, 'c1bcc6eb2f5ce5f7c2380dd37a7e4b0a.jpg', 'comments', '2018-11-09 06:43:52'),
(13, 2, '4709f2f52d18bee285efece84cc037f4.jpg', 'Comment', '2018-11-09 10:18:58'),
(19, 25, '3587e272e12292b0cff5623ad3f7f343.jpg', 'This is Sparta!', '2018-11-09 10:51:58'),
(21, 25, '1e3a0b92805dfeffb128021337e8194b.png', 'Witnes me bloodbag!', '2018-11-09 10:57:10'),
(24, 2, '4709f2f52d18bee285efece84cc037f4.jpg', 'asxdcf\'\n', '2018-11-12 10:02:39'),
(25, 27, '3587e272e12292b0cff5623ad3f7f343.jpg', 'hfthfhfhf', '2018-11-13 08:40:33'),
(26, 2, 'f350cc6f711977d3fe753b35ece26d89.png', '  <script type=\'text/javascript\'>alert(\'THE GAME\');</script>', '2018-11-13 08:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `img_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `img_name` varchar(40) NOT NULL,
  `edited` int(1) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`img_id`, `user_id`, `img_name`, `edited`, `date`) VALUES
(30, 1, '3587e272e12292b0cff5623ad3f7f343.jpg', 1, '2018-11-09 11:42:35'),
(31, 1, '4709f2f52d18bee285efece84cc037f4.jpg', 1, '2018-11-09 11:42:35'),
(32, 1, '5db401ce155bf4552f7a54a3bdc629b3.jpg', 1, '2018-11-09 11:42:35'),
(33, 1, '770e140cab2b1e9c8d1e17b86912cc9f.jpg', 1, '2018-11-09 11:42:35'),
(34, 1, '776c4fbea6af63d852e13ac6c2a0772e.jpg', 1, '2018-11-09 11:42:35'),
(35, 1, 'b6d35a326127c92dfaf26ef84e502161.png', 1, '2018-11-09 11:42:35'),
(36, 1, 'c1bcc6eb2f5ce5f7c2380dd37a7e4b0a.jpg', 1, '2018-11-09 11:42:35'),
(37, 1, 'e8beb8a677355dc397a11a0a82cc55ee.jpg', 1, '2018-11-09 11:42:35'),
(38, 1, 'c2d3b343becd315553cf3b5a80645113.png', 1, '2018-11-09 11:42:35'),
(39, 1, 'f37772a8ef9a2eedb720d258b3429b6b.jpg', 1, '2018-11-09 11:42:35'),
(41, 27, '9071ddd6283c3a2f67544d27631b7097.jpg', 0, '2018-11-13 08:41:49'),
(42, 27, 'f350cc6f711977d3fe753b35ece26d89.png', 1, '2018-11-13 08:42:27'),
(43, 28, '12df7bcc7a31bbf09fbafec8c96f22e0.png', 1, '2018-11-14 07:02:47'),
(44, 29, '530d667f29b3b787a2e0da13b78d91d5.jpg', 0, '2018-11-28 09:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `image_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `img_name` varchar(40) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`image_id`, `user_id`, `img_name`, `date`) VALUES
(17, 2, 'e8beb8a677355dc397a11a0a82cc55ee.jpg', '2018-11-07 10:37:29'),
(20, 2, 'b6d35a326127c92dfaf26ef84e502161.png', '2018-11-07 10:39:48'),
(21, 2, 'c2d3b343becd315553cf3b5a80645113.png', '2018-11-07 10:39:49'),
(22, 2, '5db401ce155bf4552f7a54a3bdc629b3.jpg', '2018-11-07 10:39:50'),
(23, 2, '770e140cab2b1e9c8d1e17b86912cc9f.jpg', '2018-11-07 10:39:51'),
(25, 2, '3587e272e12292b0cff5623ad3f7f343.jpg', '2018-11-07 11:34:19'),
(26, 2, 'da64459604c4d7424f5d7fee6909e9b2.png', '2018-11-07 12:00:24'),
(29, 23, 'd73c5d1060ffcb7cf8b997f85f5fc3f6.jpg', '2018-11-08 06:35:57'),
(30, 23, 'f37772a8ef9a2eedb720d258b3429b6b.jpg', '2018-11-08 06:40:03'),
(31, 23, '5db401ce155bf4552f7a54a3bdc629b3.jpg', '2018-11-08 06:40:05'),
(32, 23, 'e8beb8a677355dc397a11a0a82cc55ee.jpg', '2018-11-08 06:41:17'),
(33, 23, 'c2d3b343becd315553cf3b5a80645113.png', '2018-11-08 06:41:18'),
(34, 23, 'c1bcc6eb2f5ce5f7c2380dd37a7e4b0a.jpg', '2018-11-08 07:02:27'),
(35, 23, 'da64459604c4d7424f5d7fee6909e9b2.png', '2018-11-08 07:18:27'),
(36, 23, '4709f2f52d18bee285efece84cc037f4.jpg', '2018-11-08 07:18:28'),
(37, 2, 'f37772a8ef9a2eedb720d258b3429b6b.jpg', '2018-11-08 11:13:08'),
(38, 1, 'd73c5d1060ffcb7cf8b997f85f5fc3f6.jpg', '2018-11-08 11:17:33'),
(40, 1, '24f06ba626a24bfc0a2c8b830a4676fe.jpg', '2018-11-08 11:25:46'),
(41, 1, '4709f2f52d18bee285efece84cc037f4.jpg', '2018-11-08 11:25:47'),
(42, 1, '5db401ce155bf4552f7a54a3bdc629b3.jpg', '2018-11-08 11:25:48'),
(44, 1, '770e140cab2b1e9c8d1e17b86912cc9f.jpg', '2018-11-08 11:35:31'),
(45, 1, 'c1bcc6eb2f5ce5f7c2380dd37a7e4b0a.jpg', '2018-11-08 11:35:32'),
(46, 1, 'e8beb8a677355dc397a11a0a82cc55ee.jpg', '2018-11-08 11:35:33'),
(47, 1, 'c2d3b343becd315553cf3b5a80645113.png', '2018-11-08 11:35:35'),
(48, 1, 'b6d35a326127c92dfaf26ef84e502161.png', '2018-11-08 11:35:37'),
(49, 1, '776c4fbea6af63d852e13ac6c2a0772e.jpg', '2018-11-08 11:35:40'),
(50, 1, 'da64459604c4d7424f5d7fee6909e9b2.png', '2018-11-08 11:42:30'),
(52, 2, '24f06ba626a24bfc0a2c8b830a4676fe.jpg', '2018-11-09 06:17:33'),
(53, 2, 'd73c5d1060ffcb7cf8b997f85f5fc3f6.jpg', '2018-11-09 06:33:33'),
(54, 2, '4709f2f52d18bee285efece84cc037f4.jpg', '2018-11-09 10:20:41'),
(55, 24, '776c4fbea6af63d852e13ac6c2a0772e.jpg', '2018-11-09 10:24:07'),
(56, 24, 'b6d35a326127c92dfaf26ef84e502161.png', '2018-11-09 10:24:10'),
(57, 24, '770e140cab2b1e9c8d1e17b86912cc9f.jpg', '2018-11-09 10:24:13'),
(60, 24, 'f37772a8ef9a2eedb720d258b3429b6b.jpg', '2018-11-09 10:24:26'),
(62, 25, '3587e272e12292b0cff5623ad3f7f343.jpg', '2018-11-09 10:52:31'),
(64, 25, '776c4fbea6af63d852e13ac6c2a0772e.jpg', '2018-11-09 10:52:41'),
(65, 25, 'f37772a8ef9a2eedb720d258b3429b6b.jpg', '2018-11-09 10:55:14'),
(66, 2, 'c1bcc6eb2f5ce5f7c2380dd37a7e4b0a.jpg', '2018-11-09 11:43:37'),
(67, 2, 'b62ba94d09403ee2abade5916ba4cca7.png', '2018-11-09 12:07:04'),
(69, 26, 'b62ba94d09403ee2abade5916ba4cca7.png', '2018-11-12 09:12:14'),
(70, 26, '052c486de52588b2e67dbda1d763850a.png', '2018-11-12 09:12:18'),
(71, 26, '776c4fbea6af63d852e13ac6c2a0772e.jpg', '2018-11-12 09:12:22'),
(72, 27, 'b62ba94d09403ee2abade5916ba4cca7.png', '2018-11-13 08:40:10'),
(73, 27, '3587e272e12292b0cff5623ad3f7f343.jpg', '2018-11-13 08:40:13'),
(74, 27, '776c4fbea6af63d852e13ac6c2a0772e.jpg', '2018-11-13 08:41:31'),
(76, 27, '5db401ce155bf4552f7a54a3bdc629b3.jpg', '2018-11-13 08:42:35'),
(77, 27, 'f350cc6f711977d3fe753b35ece26d89.png', '2018-11-13 08:42:38'),
(78, 28, '776c4fbea6af63d852e13ac6c2a0772e.jpg', '2018-11-14 07:01:32');

-- --------------------------------------------------------

--
-- Table structure for table `stickers`
--

CREATE TABLE `stickers` (
  `img_name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stickers`
--

INSERT INTO `stickers` (`img_name`) VALUES
('kisspng-carbotanimations-wikia-heroes-of-the-storm-clip-ar-carbot-5b467d2de3a775.1946234415313462219325.png'),
('kisspng-clip-art-sticker-telegram-line-cartoon-telegram-sticker-002-from-collection-carbot-anima-5b63af1f1bc044.6695194315332595511137.png'),
('kisspng-drawing-clip-art-border-designs-cliparts-5a886d11bf10e3.6414439015188902577826.jpg'),
('kisspng-starcraft-animation-zerg-art-hydra-5aec479540b758.2335594915254342612651.png'),
('zergling_by_ashidaru-d85eifj.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verified` int(1) DEFAULT NULL,
  `admin` int(1) DEFAULT NULL,
  `profile` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `username`, `email`, `password`, `verified`, `admin`, `profile`) VALUES
(1, 'Kriss', 'Anime', 'KrissAdmin', 'krissultimatum@gmail.com', '075032d83abe521158993293ca4081627b04f65f32c6cf8cda9592d6d7f3807b3510269c0a43ea372ddd7e62d97afdbbf959babf911f61a94038a684744e51f5', 1, 1, NULL),
(2, 'user', 'test', 'user', 'user@setup.com', '3225295abf12b6b70f31d59694f4afa6c0f2ec9fca057384185b9bff6f9f610ba23584c690d2a1f463c32b7be70f4a8f36e38fc3e69d44deb36d94a9905bf616', 1, 0, 'da64459604c4d7424f5d7fee6909e9b2.png'),
(24, 'mpho', 'mat', 'krissultimatum@gmail.com', 'testmpho@mailinator.com', '400597142ddf527665234736542d04becbb3d7c6f321f35de79ee0b7f6506e89ff6046df6800dfee5cb9636d0b086410c8b2898e63d259476098700beab46f85', 0, 0, NULL),
(25, 'sfiso', 'wilson', 'sfiso', 'testsfiso@mailinator.com', '4e5f30b3a6dac836b3f3ae47c8a517462fc6775b63d953ea86b42f44dddcc0b9178de064add4487243f3013bea3666b2222669df751e0b6af09fa1dcb3ce910b', 1, 0, '48b4f868840312ada10df504f518c8b7.jpg'),
(26, 'sfiso', 'wilson', 'sfisotest', 'sfisotest@mailinator.com', 'd0d1c6e0559e1332ccd27fbfbb1bf97fd3757882d5ad3409d02dc30b092d5984e959311334868c50335c27e09419a3de12c18b1ce9bbd4df3de84097468dec5a', 1, 0, NULL),
(27, 'Mcebo', 'Xaba', 'mxaba', 'xaba@mailinator.com', '2c8e048d401bfa447273d2609d66a0e85641cd4faa592e865005f97f8c645f91dca3fe6f0b5036666e1d3bbb36bdf3594b1532189f75b8f28b2ccdcfdbb9a507', 1, 0, NULL),
(28, 'plit', 'sambo', 'psambo', 'krissultimatum2@gmail.com', '2ac54ce05f511029ebe4f0c99513b8a19f9f8c4932025140c15c8a7e64e1f95f2aee33c05ea38c960baaeaaf21a2e3a1baa7a15aa71ed38daee803ca0c049ec7', 1, 0, NULL),
(29, 'tits', 'mcgee', 'titsmcgee', 'pptest@mailinator.com', '59776d7f493c6a897242eaf40bb0f5add983c89101656194ca6fc66aa3402fdc388d6405ce53d8a46b3c1485f5aea770579054e8dbbef59a84c4ba1f50f54a96', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

CREATE TABLE `verification` (
  `email` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `verification`
--

INSERT INTO `verification` (`email`, `link`) VALUES
('jsnfsdjnfoak@gmail.com', '9f14311e37df8895d81af53a970dd5ea'),
('krissultimatum123@gmail.com', 'dc4eb14c9de2285a94ba96ed112f1668'),
('krissultimatum@gmail.com', 'f70a5035aa42f914a2d6ae74ec65abed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `stickers`
--
ALTER TABLE `stickers`
  ADD PRIMARY KEY (`img_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `verification`
--
ALTER TABLE `verification`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `img_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `image_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- Database: `matcha`
--
CREATE DATABASE IF NOT EXISTS `matcha` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `matcha`;

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `block_id` int(6) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `time_log` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`block_id`, `sender`, `receiver`, `status`, `time_log`) VALUES
(16, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', 0, '2018-11-27 11:30:41'),
(17, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', 'ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', 0, '2018-11-27 11:33:29'),
(18, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', 'ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', 0, '2018-11-27 11:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `unique_key` varchar(255) NOT NULL,
  `profile` varchar(60) DEFAULT 'NULL',
  `img_01` varchar(255) DEFAULT 'NULL',
  `img_02` varchar(255) DEFAULT 'NULL',
  `img_03` varchar(255) DEFAULT 'NULL',
  `img_04` varchar(255) DEFAULT 'NULL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`unique_key`, `profile`, `img_01`, `img_02`, `img_03`, `img_04`) VALUES
('08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', '006.jpg', '3458698-screen+shot+2018-11-02+at+11.38.39+am.png', '966229.jpg', 'evDvDJkrqqZVva7ACH4xjM.jpg', 'NULL'),
('2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', '005.jpg', '400734.jpg', '656539.jpg', 'nova-terra-art-blonde-ghost-starcraft-2.jpg', 'nova-terra.jpg'),
('2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', '001.jpg', '81190.jpg', 'Maya-and-Aya-Natsume-tenjho-tenge-2633282-1000-1241.jpg', 'Tenjo Tenge.jpg', 'NULL'),
('4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '002.jpg', '554305.jpg', '592539.jpg', '654345.jpg', '739745.png'),
('52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', '004.jpg', '7a249496375ed2573a820ebf6ce8d922.jpg', 'f83258d50f078eed583aa761fb72d68f.jpg', 'heroes+of+the+storm.jpeg', 'kerrigan-starcraft-2-wallpaper.jpg'),
('65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', '007.jpg', '554271.jpg', '605785.jpg', '655707.jpg', 'NULL'),
('6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', '003.jpg', '605790.jpg', '815421.png', '849972.jpg', 'NULL'),
('ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', '009.jpg', '72747.jpg', '785425.png', '815168.jpg', '958511.jpg'),
('ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', '008.jpg', '479713_jpg.jpg', 'erza_scarlet_wallpaper_2_by_fulkom-d51c3rb.jpg', 'fairy_tail___erza_scarlet_wallpaper_hd_by_fairytail666-d76jszf_jpg.jpg', 'thumb-1920-505304.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(6) NOT NULL,
  `instigator` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `choice` varchar(6) DEFAULT NULL,
  `time_log` datetime DEFAULT CURRENT_TIMESTAMP,
  `rating` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `instigator`, `receiver`, `choice`, `time_log`, `rating`) VALUES
(4, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', NULL, '2018-11-24 08:36:27', NULL),
(5, '08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', NULL, '2018-11-24 08:36:53', NULL),
(6, '2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', NULL, '2018-11-24 09:32:23', NULL),
(8, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', NULL, '2018-11-27 10:16:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messaging`
--

CREATE TABLE `messaging` (
  `message_log` int(10) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `time_log` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messaging`
--

INSERT INTO `messaging` (`message_log`, `sender`, `receiver`, `message`, `time_log`) VALUES
(1, '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', 'For the empire!', '2018-11-23 14:48:25'),
(2, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', 'I am the swarm!', '2018-11-23 14:48:25'),
(3, '2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', 'Hey Sarah, how\'s Jim?', '2018-11-23 15:39:40'),
(4, '08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', 'Would you like to join the Nexus?', '2018-11-23 15:39:40'),
(5, '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '......?', '2018-11-23 15:53:05'),
(6, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', '...What?', '2018-11-23 15:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notice_id` int(9) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `action` varchar(30) NOT NULL,
  `instigator` varchar(50) NOT NULL,
  `notify` varchar(300) NOT NULL,
  `time_log` datetime DEFAULT CURRENT_TIMESTAMP,
  `logged` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notice_id`, `user_name`, `action`, `instigator`, `notify`, `time_log`, `logged`) VALUES
(1, 'Ice Queen', 'Message', 'KrissAnime', 'You received a new message from ', '2018-11-22 13:49:09', 0),
(2, 'Ice Queen', 'Message', 'KrissAnime', 'You received a new message from ', '2018-11-22 13:49:09', 1),
(3, 'Ice Queen', 'Like', 'KrissAnime', 'You\'re profile was liked by user ', '2018-11-22 13:49:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `user_id` int(6) NOT NULL,
  `unique_key` varchar(255) NOT NULL,
  `profile` varchar(60) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `fame_rating` int(1) DEFAULT '0',
  `age` int(2) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `sexual_pref` int(1) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `bio` varchar(1500) DEFAULT NULL,
  `interests` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`user_id`, `unique_key`, `profile`, `first_name`, `last_name`, `user_name`, `fame_rating`, `age`, `gender`, `sexual_pref`, `location`, `bio`, `interests`) VALUES
(1, 'd9b2b954eb23b5bcb7a8bd5e1975f4e08f58330b8075c4c2c528b619e167cc1faef40e2cade52f6f86b2124aca8e1eb75398b7de6f37d9eb3a8c9c3374d66ab2', NULL, 'Kriss', 'Bester', 'new_user', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', '001.jpg', 'Crescendo', 'Bester', 'KrissAnime', 4, 23, 0, 0, NULL, 'I am the creator of the site', 'Coding, Gaming, Fanfiction, Eating'),
(3, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '002.jpg', 'General', 'Esdeath', 'Ice Queen', 5, 26, 1, 0, NULL, 'Esdeath was a sadist who lacked empathy for people of whom she deemed weak, since she lives by her father&#039;s philosophy (&#039;The strong survive and the weak die&#039;). \nShe enjoyed putting her enemies through great pain, both physically and emotionally. She had no qualms about killing innocent people to get what she wanted, and rationalized her behavior with her father&#039;s old creed.', 'Torture, War, Bloodshed, Sadism'),
(4, '6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', '003.jpg', 'Leone', 'Lionelle', 'Cat Girl', 5, 21, 1, 3, NULL, 'She has a very relaxed, upbeat, and cheerful personality, and tends to display a lack of ladylike manners, often seen shoving Tatsumi into her breasts, putting her feet on the table, or consuming large amounts of sake. \nShe serves as a sort of big sister figure to Tatsumi and younger members in Night Raid, often referring to herself as &#039;onee-san&#039;.\nDespite the morally dodgy nature that she sometimes displayed, Leone is not one to tolerate injustice, and can be especially vicious to those who commit the vilest of acts. She also enjoys fighting her enemies a lot, as said by Najenda who told her that she needs to change that habit.', 'Drinking, Fighting, Relaxing'),
(5, '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', '004.jpg', 'Sarah', 'Kerrigan', 'Queen of Blades', 5, 35, 1, 3, NULL, 'Sarah Louise Kerrigan was a psychic terran female. She began her career as a Confederate ghost and later became the second-in-command of the Sons of Korhal. Following Arcturus Mengsk&#039;s betrayal, she was captured and infested by the Zerg Swarm, ultimately becoming the self-proclaimed Queen of Blades (a.k.a. the Zerg Queen) and leader of the Swarm.At the Dominion Ghost Academy, ghosts in training are told the Confederacy allowed Kerrigan to &#039;defect&#039; to the zerg. Non-control zerg strains referred to her as &#039;the Kerrigan.&#039;', 'Ruling the Swarm, Killing Acturus'),
(6, '2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', '005.jpg', 'November', 'Terra', 'Nova', 4, 23, 1, 1, NULL, 'November &#039;Nova&#039; Terra was a member of the Terra family, one of the Terran Confederacy&#039;s rich and powerful &#039;Old Families&#039;.\nShe is the youngest child of Bella and Constantino Terra, and had two siblings -- Clara and Zeb.\nThe family lived in the Terra Skyscraper in Tarsonis City, Tarsonis. She possessed a degree of empathy that was generally lacking in the Old Families, a trait that did not go unnoticed.\nShe also believed strongly in the concept of fair play. She was regarded as the &#039;golden child&#039; of the family.', 'Covert Ops, Sniping, Hacking'),
(7, '08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', '006.jpg', 'Orphea', 'Raven', 'Raven Girl', 4, 18, 1, 1, NULL, 'Orphea&#039;s upbringing was lonely, but she found comfort and connection with ancestral magic. Orphea&#039;s mother left the family early in Orphea&#039;s life, fearing what would happen if her father Oberon, Raven Lord, tapped into the Dark Nexus.\nOberon promised Orphea not to tap into this power, but he broke this promise, pushing Orphea away. Later her father sends out Knights to find her.\nWhile Deckard Cain wanders around the forests of Dragon Shire, he is attacked by those knights. Orphea joins the clash and helps Cain defeating the knights. Deckard Cain and Orphea team up to find a solution for the Dark Nexus threat raised by the Raven Lord. They come to Raena the Lady of Thorns and Realm Lord of Dragon Shire, for help and warn her about the danger coming. Raena calls on her greatest allies from across the lands and marches with them forward to battle the Raven Lord and his champions in Alterac Pass.Later Orphea witnessed her father defeating the Lady of Thorns and causing the fall of King&#039;s Crest. Vowing to stop her father from hurting anyone else, she chose to rise up against him and become a hero in the Nexus.', 'Nexus Battles, Dragon Riding, Ancestral Magic, Commentating'),
(8, '65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', '007.jpg', 'Bulat', 'Incursio', 'Tyrant', 3, 27, 0, 2, NULL, 'Bulat had a calm, kind personality; although he referred to himself as passionate and hot-blooded, he never actually lost his cool in battle.\nHe was among the most compassionate members of the Night Raid and he taught Tatsumi to embrace these emotions but not to let them consume him.\nLeone informed Tatsumi that Bulat was gay, to which he replied, &#039;You don&#039;t want him to misunderstand, right?&#039;, but did not deny Leone&#039;s statement, while blushing heavily.\nBulat flirted with Tatsumi on occasion, which made the latter extremely nervous.', 'Exercise, Styling Hair, Tatsumi'),
(9, 'ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', '008.jpg', 'Erza', 'Scarlet', 'Titania', 4, 26, 1, 1, NULL, 'Erza is a very strict person, often criticizing the bad behavior and habits of the other guild members, causing most of them to apologize, fearing that they might invoke her wrath.\nShe is also very impatient, disliking people who don&#039;t answer her questions quickly enough.\n', 'Discipline, BDSM, Erotic Novels, Fighting'),
(10, 'ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', '009.jpg', 'Shirou', 'Emiya', 'Archer', 3, 28, 0, 1, NULL, 'While he is thoroughly cynical and nihilistic, he is at the same time devoted and protective, and even a little childish to the point that it makes him hard to hate.\nHe does not lie, but he does keep secrets and tell half truths.\nHe means well and is capable of being nice, but often ends up being sarcastic, especially so when he gives advice.', 'Housework, Archery, Tinkering');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_id` int(9) NOT NULL,
  `rator` varchar(255) NOT NULL,
  `rated` varchar(255) NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(3) NOT NULL,
  `tag_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`) VALUES
(1, 'Ancestral Magic'),
(2, 'Archery'),
(3, 'BDSM'),
(4, 'Bloodshed'),
(5, 'Commentating'),
(6, 'Dragon Riding'),
(7, 'Eating'),
(8, 'Erotic Novels'),
(9, 'Fanfiction'),
(10, 'Fighting'),
(11, 'Gaming'),
(12, 'Hacking'),
(13, 'Killing Acturus'),
(14, 'Relaxing'),
(15, 'Sadism'),
(16, 'Sniping'),
(17, 'Styling Hair'),
(18, 'Tatsumi'),
(19, 'Tinkering'),
(20, 'War'),
(21, 'Coding'),
(22, 'Covert Ops'),
(23, 'Discipline'),
(24, 'Drinking'),
(25, 'Exercise'),
(26, 'Housework'),
(27, 'Nexus Battles'),
(28, 'Ruling the Swarm');

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE `temp` (
  `yeah` varchar(300) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `temp`
--

INSERT INTO `temp` (`yeah`, `date`) VALUES
('test', '2018-11-22 13:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verified` int(1) DEFAULT NULL,
  `profile` varchar(60) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `password`, `verified`, `profile`, `date`) VALUES
(1, 'KrissAnime', 'krissultimatum@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '001.jpg', '2018-11-28 08:50:59'),
(2, 'Ice Queen', 'krissultimatum2+iceqeen@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '002.jpg', '2018-11-28 08:50:59'),
(3, 'Cat Girl', 'krissultimatum2+catgirl@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '003.jpg', '2018-11-28 08:50:59'),
(4, 'Queen of Blades', 'krissultimatum+bladequeen@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '004.jpg', '2018-11-28 08:50:59'),
(5, 'Nova', 'krissultimatum2+nova@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '005.jpg', '2018-11-28 08:50:59'),
(6, 'Raven Girl', 'krissultimatum+ravengirl@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '006.jpg', '2018-11-28 08:50:59'),
(7, 'Tyrant', 'krissultimatum+tyrant@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '007.jpg', '2018-11-28 08:50:59'),
(8, 'Titania', 'krissultimatum+titania@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '008.jpg', '2018-11-28 08:50:59'),
(9, 'Archer', 'krissultimatum+archer@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '009.jpg', '2018-11-28 08:50:59'),
(12, 'new_user', 'krissultimatum+new@gmail.com', '521b9ccefbcd14d179e7a1bb877752870a6d620938b28a66a107eac6e6805b9d0989f45b5730508041aa5e710847d439ea74cd312c9355f1f2dae08d40e41d50', 2, NULL, '2018-11-28 09:00:30'),
(13, 'KrissAnime', 'krissultimatum@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '001.jpg', '2018-11-28 10:21:08'),
(14, 'Ice Queen', 'krissultimatum2+iceqeen@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '002.jpg', '2018-11-28 10:21:08'),
(15, 'Cat Girl', 'krissultimatum2+catgirl@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '003.jpg', '2018-11-28 10:21:08'),
(16, 'Queen of Blades', 'krissultimatum+bladequeen@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '004.jpg', '2018-11-28 10:21:08'),
(17, 'Nova', 'krissultimatum2+nova@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '005.jpg', '2018-11-28 10:21:08'),
(18, 'Raven Girl', 'krissultimatum+ravengirl@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '006.jpg', '2018-11-28 10:21:08'),
(19, 'Tyrant', 'krissultimatum+tyrant@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '007.jpg', '2018-11-28 10:21:08'),
(20, 'Titania', 'krissultimatum+titania@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '008.jpg', '2018-11-28 10:21:08'),
(21, 'Archer', 'krissultimatum+archer@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '009.jpg', '2018-11-28 10:21:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_tags`
--

CREATE TABLE `user_tags` (
  `user_tag_id` int(8) NOT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  `tag_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

CREATE TABLE `verification` (
  `email` varchar(50) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`block_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`unique_key`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `messaging`
--
ALTER TABLE `messaging`
  ADD PRIMARY KEY (`message_log`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_tags`
--
ALTER TABLE `user_tags`
  ADD PRIMARY KEY (`user_tag_id`);

--
-- Indexes for table `verification`
--
ALTER TABLE `verification`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
  MODIFY `block_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `messaging`
--
ALTER TABLE `messaging`
  MODIFY `message_log` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notice_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_tags`
--
ALTER TABLE `user_tags`
  MODIFY `user_tag_id` int(8) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
