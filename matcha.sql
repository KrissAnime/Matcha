-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 04, 2018 at 04:51 AM
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
(18, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', 'ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', 0, '2018-11-27 11:36:01'),
(19, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', 0, '2018-12-04 13:45:52');

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
('10951e478b338a34c76b4adea704632df92829bdd3cc347342ee1c0e501c6fbe6425e91f70089f4c37d628ff92ad73dc72538305a31996eda1a7a94e260dfd01', 'uploads-1543917914650.jpg', 'NULL', 'NULL', 'NULL', 'NULL'),
('2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', '005.jpg', '400734.jpg', '656539.jpg', 'nova-terra-art-blonde-ghost-starcraft-2.jpg', 'nova-terra.jpg'),
('2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', '001.jpg', '81190.jpg', 'Maya-and-Aya-Natsume-tenjho-tenge-2633282-1000-1241.jpg', 'uploads-1543915197198.jpg', '007.jpg\r\n'),
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
(14, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', NULL, '2018-12-04 13:52:45', NULL),
(15, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', NULL, '2018-12-04 14:01:08', NULL),
(16, '4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', NULL, '2018-12-04 14:05:04', NULL);

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
  `distance` int(10) DEFAULT '0',
  `bio` varchar(1500) DEFAULT NULL,
  `interests` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`unique_key`, `profile`, `first_name`, `last_name`, `user_name`, `fame_rating`, `age`, `gender`, `sexual_pref`, `location_lat`, `location_long`, `distance`, `bio`, `interests`) VALUES
('08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', '006.jpg', 'Orphea', 'Raven', 'Raven Girl', 4, 18, 'Female', 'Men', -29.484694, 31.238787, 0, 'Orphea&#039;s upbringing was lonely, but she found comfort and connection with ancestral magic. Orphea&#039;s mother left the family early in Orphea&#039;s life, fearing what would happen if her father Oberon, Raven Lord, tapped into the Dark Nexus.\nOberon promised Orphea not to tap into this power, but he broke this promise, pushing Orphea away. Later her father sends out Knights to find her.\nWhile Deckard Cain wanders around the forests of Dragon Shire, he is attacked by those knights. Orphea joins the clash and helps Cain defeating the knights. Deckard Cain and Orphea team up to find a solution for the Dark Nexus threat raised by the Raven Lord. They come to Raena the Lady of Thorns and Realm Lord of Dragon Shire, for help and warn her about the danger coming. Raena calls on her greatest allies from across the lands and marches with them forward to battle the Raven Lord and his champions in Alterac Pass.Later Orphea witnessed her father defeating the Lady of Thorns and causing the fall of King&#039;s Crest. Vowing to stop her father from hurting anyone else, she chose to rise up against him and become a hero in the Nexus.', 'Nexus Battles, Dragon Riding, Ancestral Magic, Commentating'),
('10951e478b338a34c76b4adea704632df92829bdd3cc347342ee1c0e501c6fbe6425e91f70089f4c37d628ff92ad73dc72538305a31996eda1a7a94e260dfd01', NULL, 'mpho', 'mathivha', 'mpho12', 0, 18, 'Male', 'Women', -26.205072, 28.040176, 0, NULL, 'BDSM,Bloodshed,Eating'),
('2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', '005.jpg', 'November', 'Terra', 'Nova', 4, 23, 'Female', 'Female', -26.016891, 28.014391, 0, 'November &#039;Nova&#039; Terra was a member of the Terra family, one of the Terran Confederacy&#039;s rich and powerful &#039;Old Families&#039;.\nShe is the youngest child of Bella and Constantino Terra, and had two siblings -- Clara and Zeb.\nThe family lived in the Terra Skyscraper in Tarsonis City, Tarsonis. She possessed a degree of empathy that was generally lacking in the Old Families, a trait that did not go unnoticed.\nShe also believed strongly in the concept of fair play. She was regarded as the &#039;golden child&#039; of the family.', 'Covert Ops, Sniping, Hacking'),
('2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', '001.jpg', 'Crescendo', 'Bester', 'KrissAnime', 4, 23, 'Male', 'Women', -25.747900, 28.229300, 0, 'I am the creator of the site', 'Coding, Gaming, Fanfiction, Eating'),
('4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', '002.jpg', 'General', 'Esdeath', 'Ice Queen', 5, 26, 'Female', 'Men', -29.858700, 31.021799, 0, 'Esdeath was a sadist who lacked empathy for people of whom she deemed weak, since she lives by her father&#039;s philosophy (&#039;The strong survive and the weak die&#039;). \nShe enjoyed putting her enemies through great pain, both physically and emotionally. She had no qualms about killing innocent people to get what she wanted, and rationalized her behavior with her father&#039;s old creed.', 'Torture, War, Bloodshed, Sadism'),
('52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', '004.jpg', 'Sarah', 'Kerrigan', 'Queen of Blades', 5, 35, 'Female', 'Both', -26.137964, 28.027521, 0, 'Sarah Louise Kerrigan was a psychic terran female. She began her career as a Confederate ghost and later became the second-in-command of the Sons of Korhal. Following Arcturus Mengsk&#039;s betrayal, she was captured and infested by the Zerg Swarm, ultimately becoming the self-proclaimed Queen of Blades (a.k.a. the Zerg Queen) and leader of the Swarm.At the Dominion Ghost Academy, ghosts in training are told the Confederacy allowed Kerrigan to &#039;defect&#039; to the zerg. Non-control zerg strains referred to her as &#039;the Kerrigan.&#039;', 'Ruling the Swarm, Killing Acturus'),
('65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', '007.jpg', 'Bulat', 'Incursio', 'Tyrant', 3, 27, 'Male', 'Male', -27.642900, 27.231298, 0, 'Bulat had a calm, kind personality; although he referred to himself as passionate and hot-blooded, he never actually lost his cool in battle.\nHe was among the most compassionate members of the Night Raid and he taught Tatsumi to embrace these emotions but not to let them consume him.\nLeone informed Tatsumi that Bulat was gay, to which he replied, &#039;You don&#039;t want him to misunderstand, right?&#039;, but did not deny Leone&#039;s statement, while blushing heavily.\nBulat flirted with Tatsumi on occasion, which made the latter extremely nervous.', 'Exercise, Styling Hair, Tatsumi'),
('6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', '003.jpg', 'Leone', 'Lionelle', 'Cat Girl', 5, 21, 'Female', 'Both', -26.143801, 27.995199, 0, 'She has a very relaxed, upbeat, and cheerful personality, and tends to display a lack of ladylike manners, often seen shoving Tatsumi into her breasts, putting her feet on the table, or consuming large amounts of sake. \nShe serves as a sort of big sister figure to Tatsumi and younger members in Night Raid, often referring to herself as &#039;onee-san&#039;.\nDespite the morally dodgy nature that she sometimes displayed, Leone is not one to tolerate injustice, and can be especially vicious to those who commit the vilest of acts. She also enjoys fighting her enemies a lot, as said by Najenda who told her that she needs to change that habit.', 'Drinking, Fighting, Relaxing'),
('ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', '009.jpg', 'Shirou', 'Emiya', 'Archer', 3, 28, 'Male', 'Both', -33.907288, 18.550812, 0, 'While he is thoroughly cynical and nihilistic, he is at the same time devoted and protective, and even a little childish to the point that it makes him hard to hate.\nHe does not lie, but he does keep secrets and tell half truths.\nHe means well and is capable of being nice, but often ends up being sarcastic, especially so when he gives advice.', 'Housework, Archery, Tinkering'),
('ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', '008.jpg', 'Erza', 'Scarlet', 'Titania', 4, 26, 'Female', 'Male', -33.889320, 18.504452, 0, 'Erza is a very strict person, often criticizing the bad behavior and habits of the other guild members, causing most of them to apologize, fearing that they might invoke her wrath.\nShe is also very impatient, disliking people who don&#039;t answer her questions quickly enough.\n', 'Discipline, BDSM, Erotic Novels, Fighting');

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
('08c7fa1853e392150b7e083a1b97964482fa040c2b30eab21b6fa571ffa3cba949d14c42506bac59a9675f26bd8bc3d6649c336d48e3e78569afcecde782af6e', 'Raven Girl', 'krissultimatum+ravengirl@gmail.com', '7bebc183e3698b17d7943fedaee41a6e5d6adf264409a61c6c8530383b8bad27d76c884f03be60d7f5c5f96de85470cf8a39c319ff7da1aef20dfe5a8821f2dc', 1, '006.jpg', '2018-12-04 08:31:21'),
('10951e478b338a34c76b4adea704632df92829bdd3cc347342ee1c0e501c6fbe6425e91f70089f4c37d628ff92ad73dc72538305a31996eda1a7a94e260dfd01', 'mpho12', 'testmpho@mailinator.com', '38f2b6ef275fdf7b1c208970a3067854d3fbe63c0ccbdbb272ff740e6781ac5522865375c58c91afee0eb86d23d83d1a8154dce782e97d78fabd5643fa876ba8', 1, 'uploads-1543917914650.jpg', '2018-12-04 11:44:12'),
('2534158ec0b4ab0c760a712b4af7d57d9e42d50beb709b631a6268e5d3b281348ded8309f278d0fb05e3d2a5963084ee25b624cee022a3d9b261d13926bd7c15', 'Nova', 'krissultimatum2+nova@gmail.com', '124faadf2c7ec1fa411003e47888af065f1797d2b93aa75c4636946941893347830213f5f3e08547942b11ab79ec10ed7085be1787abaa61676b770ed47c49ce', 1, '005.jpg', '2018-12-04 08:31:21'),
('2acb22afb8ba41040ece4d67f18f30914768b20601e7cb3b085879c4726ccbdefec6193ccfdd9e23b3f8836b5f23fbf0c520ce9116752b9e996a637a0fe09d64', 'KrissAnime', 'krissultimatum@gmail.com', '521b9ccefbcd14d179e7a1bb877752870a6d620938b28a66a107eac6e6805b9d0989f45b5730508041aa5e710847d439ea74cd312c9355f1f2dae08d40e41d50', 1, '001.jpg', '2018-12-04 08:41:00'),
('4a6d94e527577367729aa213fb7c86fa74ce59446e8fcb847f38e3f708bf6feff635f8b94acd3ee9d3613dcf41e0bc7437c69d2b06c289715adef8c409c20fbc', 'Ice Queen', 'krissultimatum2+iceqeen@gmail.com', 'acc1c3d84b0a6cdd3b58c592a94485c32d31f3b70c6359e38ffa43fb6000267d5d0c387f92e127a45685ee690a501c75dba761cbf5427ae25409079a68e44ff2', 1, '002.jpg', '2018-12-04 08:31:21'),
('52dd91651b659a0ed9ee485940d5b687c662bd1c0b627c2e1bc5b472b52302206470a9b27f4536e9265c8ffdcbe8c8e05f7f32bf6214e9d5dd4f072efa6b215a', 'Queen of Blades', 'krissultimatum+bladequeen@gmail.com', 'baf230f94b4089acb554a61339c688c943c09717be30415444859634fee7c1f27f29ae9ff35b3c63ff4ff8c1377c00d4e3e27484f8ef40f596b7cf6c806490cf', 1, '004.jpg', '2018-12-04 08:31:21'),
('65e7a902fa8bac138632ada3b88f132fa0ce16eba4e4f1a5ade4a1419f7113307245867683541b50c9e83d2e145c2c227ea722a31f47f921d261d7318e56c504', 'Tyrant', 'krissultimatum+tyrant@gmail.com', '53b51c6cf2171b2bcd067564563f9b21a3fa8d089fb3ead3266f6836be5eaa7e1f59ce5dd6e921ad39e4839bbae788c66d2ae5a9531cc213899e9e30f115735a', 1, '007.jpg', '2018-12-04 08:31:21'),
('6674af6f95c73c974105e8e69755ef5bfb49077d03053513708869481579c0758ef89cc5216e8a996371534714cbc3620cabebe98fe2392d425c89ad28b518fe', 'Cat Girl', 'krissultimatum2+catgirl@gmail.com', '8f68290700b0014b3130aecbff0c5c123981071594e0813d8ae03c1d6830bc66fda14dd39a35ae5560625f38a0566f8e35c52e6c55ce23aab0971017710eaef8', 1, '003.jpg', '2018-12-04 08:31:21'),
('ad8ae7d8c28cdeaf28929d28204345f40ab174a20939b77e5f71d87d1bb6700b09e5d800f175751bdd2a1ed605baad6e3caa23ba5c06a1cefa46510d0f518c52', 'Archer', 'krissultimatum+archer@gmail.com', '21b2dd5a93d2b05c2e66235408f1e827db854a69a0938d75fcac212411cdc5953c0d4fd2234cede4fe8a98da76317fe1c9efd34647381fd37ebb8b915874a940', 1, '009.jpg', '2018-12-04 08:31:21'),
('ea6844298925c5ef01b1762be1e51f662febca8306eed52e48e055be8b2809521debb8e6b2b439911a9e5a14c63d4ce8919036e7c522c8694cf2cdf59b0398c2', 'Titania', 'krissultimatum+titania@gmail.com', '4a845c6fb0303d2ad878cfe89366af2d4283e9748ee243be03a3ebe58cbb03fd9731ed6036d196492374b8364ff01753a38f1ed58250a682c8378564701f41f5', 1, '008.jpg', '2018-12-04 08:31:21');

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
  MODIFY `block_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
