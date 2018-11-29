-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 29, 2018 at 03:46 AM
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
-- Database: `matcha`
--

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
  `unique_key` varchar(255) NOT NULL,
  `profile` varchar(60) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `fame_rating` int(1) DEFAULT '0',
  `age` int(2) DEFAULT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `sexual_pref` varchar(10) DEFAULT NULL,
  `location_lat` float(10,6) DEFAULT NULL,
  `location_long` float(10,6) DEFAULT NULL,
  `bio` varchar(1500) DEFAULT NULL,
  `interests` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`unique_key`, `profile`, `first_name`, `last_name`, `user_name`, `fame_rating`, `age`, `gender`, `sexual_pref`, `location_lat`, `location_long`, `bio`, `interests`) VALUES
('08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', '006.jpg', 'Orphea', 'Raven', 'Raven Girl', 4, 18, 'Female', '1', 33.684601, -117.826500, 'Orphea&#039;s upbringing was lonely, but she found comfort and connection with ancestral magic. Orphea&#039;s mother left the family early in Orphea&#039;s life, fearing what would happen if her father Oberon, Raven Lord, tapped into the Dark Nexus.\nOberon promised Orphea not to tap into this power, but he broke this promise, pushing Orphea away. Later her father sends out Knights to find her.\nWhile Deckard Cain wanders around the forests of Dragon Shire, he is attacked by those knights. Orphea joins the clash and helps Cain defeating the knights. Deckard Cain and Orphea team up to find a solution for the Dark Nexus threat raised by the Raven Lord. They come to Raena the Lady of Thorns and Realm Lord of Dragon Shire, for help and warn her about the danger coming. Raena calls on her greatest allies from across the lands and marches with them forward to battle the Raven Lord and his champions in Alterac Pass.Later Orphea witnessed her father defeating the Lady of Thorns and causing the fall of King&#039;s Crest. Vowing to stop her father from hurting anyone else, she chose to rise up against him and become a hero in the Nexus.', 'Nexus Battles, Dragon Riding, Ancestral Magic, Commentating'),
('2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', '005.jpg', 'November', 'Terra', 'Nova', 4, 23, '1', '1', 34.052200, -118.243698, 'November &#039;Nova&#039; Terra was a member of the Terra family, one of the Terran Confederacy&#039;s rich and powerful &#039;Old Families&#039;.\nShe is the youngest child of Bella and Constantino Terra, and had two siblings -- Clara and Zeb.\nThe family lived in the Terra Skyscraper in Tarsonis City, Tarsonis. She possessed a degree of empathy that was generally lacking in the Old Families, a trait that did not go unnoticed.\nShe also believed strongly in the concept of fair play. She was regarded as the &#039;golden child&#039; of the family.', 'Covert Ops, Sniping, Hacking'),
('2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', '001.jpg', 'Crescendo', 'Bester', 'KrissAnime', 4, 23, '0', '0', -33.924900, 18.424101, 'I am the creator of the site', 'Coding, Gaming, Fanfiction, Eating'),
('4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '002.jpg', 'General', 'Esdeath', 'Ice Queen', 5, 26, '1', '0', 58.301899, -134.419693, 'Esdeath was a sadist who lacked empathy for people of whom she deemed weak, since she lives by her father&#039;s philosophy (&#039;The strong survive and the weak die&#039;). \nShe enjoyed putting her enemies through great pain, both physically and emotionally. She had no qualms about killing innocent people to get what she wanted, and rationalized her behavior with her father&#039;s old creed.', 'Torture, War, Bloodshed, Sadism'),
('52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', '004.jpg', 'Sarah', 'Kerrigan', 'Queen of Blades', 5, 35, '1', '3', 48.856602, 2.352200, 'Sarah Louise Kerrigan was a psychic terran female. She began her career as a Confederate ghost and later became the second-in-command of the Sons of Korhal. Following Arcturus Mengsk&#039;s betrayal, she was captured and infested by the Zerg Swarm, ultimately becoming the self-proclaimed Queen of Blades (a.k.a. the Zerg Queen) and leader of the Swarm.At the Dominion Ghost Academy, ghosts in training are told the Confederacy allowed Kerrigan to &#039;defect&#039; to the zerg. Non-control zerg strains referred to her as &#039;the Kerrigan.&#039;', 'Ruling the Swarm, Killing Acturus'),
('65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', '007.jpg', 'Bulat', 'Incursio', 'Tyrant', 3, 27, '0', '2', 51.507401, -0.127800, 'Bulat had a calm, kind personality; although he referred to himself as passionate and hot-blooded, he never actually lost his cool in battle.\nHe was among the most compassionate members of the Night Raid and he taught Tatsumi to embrace these emotions but not to let them consume him.\nLeone informed Tatsumi that Bulat was gay, to which he replied, &#039;You don&#039;t want him to misunderstand, right?&#039;, but did not deny Leone&#039;s statement, while blushing heavily.\nBulat flirted with Tatsumi on occasion, which made the latter extremely nervous.', 'Exercise, Styling Hair, Tatsumi'),
('6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', '003.jpg', 'Leone', 'Lionelle', 'Cat Girl', 5, 21, '1', '3', 55.755798, 37.617298, 'She has a very relaxed, upbeat, and cheerful personality, and tends to display a lack of ladylike manners, often seen shoving Tatsumi into her breasts, putting her feet on the table, or consuming large amounts of sake. \nShe serves as a sort of big sister figure to Tatsumi and younger members in Night Raid, often referring to herself as &#039;onee-san&#039;.\nDespite the morally dodgy nature that she sometimes displayed, Leone is not one to tolerate injustice, and can be especially vicious to those who commit the vilest of acts. She also enjoys fighting her enemies a lot, as said by Najenda who told her that she needs to change that habit.', 'Drinking, Fighting, Relaxing'),
('ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', '009.jpg', 'Shirou', 'Emiya', 'Archer', 3, 28, '0', '1', 40.712799, -74.005997, 'While he is thoroughly cynical and nihilistic, he is at the same time devoted and protective, and even a little childish to the point that it makes him hard to hate.\nHe does not lie, but he does keep secrets and tell half truths.\nHe means well and is capable of being nice, but often ends up being sarcastic, especially so when he gives advice.', 'Housework, Archery, Tinkering'),
('d9b2b954eb23b5bcb7a8bd5e1975f4e08f58330b8075c4c2c528b619e167cc1faef40e2cade52f6f86b2124aca8e1eb75398b7de6f37d9eb3a8c9c3374d66ab2', NULL, 'Kriss', 'Bester', 'new_user', 0, 24, 'Male', 'Straight', -25.747868, 28.229271, NULL, 'Ancestral Magic,Nexus Battles,Fanfiction'),
('ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', '008.jpg', 'Erza', 'Scarlet', 'Titania', 4, 26, '1', '1', 35.689499, 139.691696, 'Erza is a very strict person, often criticizing the bad behavior and habits of the other guild members, causing most of them to apologize, fearing that they might invoke her wrath.\nShe is also very impatient, disliking people who don&#039;t answer her questions quickly enough.\n', 'Discipline, BDSM, Erotic Novels, Fighting');

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `unique_key` varchar(255) NOT NULL,
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

INSERT INTO `users` (`unique_key`, `user_name`, `email`, `password`, `verified`, `profile`, `date`) VALUES
('08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', 'Raven Girl', 'krissultimatum+ravengirl@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '006.jpg', '2018-11-29 11:25:49'),
('2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', 'Nova', 'krissultimatum2+nova@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '005.jpg', '2018-11-29 11:25:49'),
('2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', 'KrissAnime', 'krissultimatum@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '001.jpg', '2018-11-29 11:25:49'),
('4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', 'Ice Queen', 'krissultimatum2+iceqeen@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '002.jpg', '2018-11-29 11:25:49'),
('52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', 'Queen of Blades', 'krissultimatum+bladequeen@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '004.jpg', '2018-11-29 11:25:49'),
('65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', 'Tyrant', 'krissultimatum+tyrant@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '007.jpg', '2018-11-29 11:25:49'),
('6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', 'Cat Girl', 'krissultimatum2+catgirl@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '003.jpg', '2018-11-29 11:25:49'),
('ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', 'Archer', 'krissultimatum+archer@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '009.jpg', '2018-11-29 11:25:49'),
('d9b2b954eb23b5bcb7a8bd5e1975f4e08f58330b8075c4c2c528b619e167cc1faef40e2cade52f6f86b2124aca8e1eb75398b7de6f37d9eb3a8c9c3374d66ab2', 'new_user', 'krissultimatum+new@gmail.com', 'd9b2b954eb23b5bcb7a8bd5e1975f4e08f58330b8075c4c2c528b619e167cc1faef40e2cade52f6f86b2124aca8e1eb75398b7de6f37d9eb3a8c9c3374d66ab2', 1, NULL, '2018-11-29 11:34:43'),
('ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', 'Titania', 'krissultimatum+titania@gmail.com', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 1, '008.jpg', '2018-11-29 11:25:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_tags`
--

CREATE TABLE `user_tags` (
  `user_tag_id` int(8) NOT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  `tag_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_tags`
--

INSERT INTO `user_tags` (`user_tag_id`, `unique_key`, `tag_name`) VALUES
(1, '08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', 'Nexus Battles'),
(2, '08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', ' Dragon Riding'),
(3, '08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', ' Ancestral Magic'),
(4, '08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', ' Commentating'),
(5, '2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', 'Covert Ops'),
(6, '2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', ' Sniping'),
(7, '2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', ' Hacking'),
(8, '2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', 'Coding'),
(9, '2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', ' Gaming'),
(10, '2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', ' Fanfiction'),
(11, '2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', ' Eating'),
(12, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', 'Torture'),
(13, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', ' War'),
(14, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', ' Bloodshed'),
(15, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', ' Sadism'),
(16, '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', 'Ruling the Swarm'),
(17, '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', ' Killing Acturus'),
(18, '65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', 'Exercise'),
(19, '65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', ' Styling Hair'),
(20, '65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', ' Tatsumi'),
(21, '6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', 'Drinking'),
(22, '6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', ' Fighting'),
(23, '6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', ' Relaxing'),
(24, 'ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', 'Housework'),
(25, 'ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', ' Archery'),
(26, 'ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', ' Tinkering'),
(27, 'ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', 'Discipline'),
(28, 'ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', ' BDSM'),
(29, 'ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', ' Erotic Novels'),
(30, 'ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', ' Fighting');

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
  ADD PRIMARY KEY (`unique_key`);

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
  ADD PRIMARY KEY (`unique_key`);

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
-- AUTO_INCREMENT for table `user_tags`
--
ALTER TABLE `user_tags`
  MODIFY `user_tag_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
