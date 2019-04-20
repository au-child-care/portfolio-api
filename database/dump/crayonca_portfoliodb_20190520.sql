-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2019 at 06:39 AM
-- Server version: 10.3.14-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crayonca_portfoliodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `centre_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `centre_id`, `first_name`, `last_name`, `nickname`, `email`, `contact_number`, `password`, `active`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 1, 'Lilian', 'Diaz', 'Lilian', 'trabren@outlook.com', '93126407', 'abc123', b'1', b'0', '2019-04-17 00:00:00', '2019-04-17 00:00:00'),
(2, 2, 'Jane Doe', 'The Admin', 'Jane', 'test@crayoncamp.com', '04111111', 'abc123', b'1', b'0', '2019-04-17 00:00:00', '2019-04-17 00:00:00'),
(3, 1, 'Jane', 'Doe', '', 'jane@doe.net', '', 'abc123', b'1', b'0', '2019-04-18 21:08:32', '2019-04-20 14:38:17');

-- --------------------------------------------------------

--
-- Table structure for table `centres`
--

CREATE TABLE `centres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `centre_code` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact_name` varchar(150) DEFAULT NULL,
  `contact_email` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `centres`
--

INSERT INTO `centres` (`id`, `centre_code`, `name`, `address`, `contact_name`, `contact_email`, `contact_number`, `active`, `date_created`, `date_modified`) VALUES
(1, 'andersonroad', 'Anderson Road Child Care Centre', 'Anderson rd. Albion, Victoria, 3020', 'Lilian Diaz', 'trabren@outlook.com', '63-3126407', b'1', '2019-04-17 00:00:00', '2019-04-19 16:11:06'),
(2, 'unicorn', 'The Rainbow Unicorn Child Care Centre', 'Victoria, Australia', 'Jane Doe', 'test@crayoncamp.com', '0411111111', b'1', '2019-04-17 00:00:00', '2019-04-17 12:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `centre_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(150) DEFAULT NULL,
  `birthday` date NOT NULL,
  `group` varchar(50) DEFAULT NULL,
  `last_observation_activity` datetime DEFAULT NULL,
  `last_milestone_activity` datetime DEFAULT NULL,
  `last_teachingplan_activity` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`id`, `centre_id`, `first_name`, `last_name`, `nickname`, `birthday`, `group`, `last_observation_activity`, `last_milestone_activity`, `last_teachingplan_activity`, `active`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 2, 'Kiddie', 'Moo', 'Kiddie', '2017-06-01', 'Toddlers', NULL, '2019-03-08 00:00:00', NULL, b'0', b'0', '2019-04-18 20:02:25', '2019-04-18 20:02:25'),
(2, 1, 'Maria Sabrina', 'Sardez', 'Sabrina', '2016-02-27', 'Juniors', '2018-12-05 00:00:00', '2018-04-18 00:00:00', '2019-05-03 00:00:00', b'1', b'0', '2019-04-18 20:45:05', '2019-04-18 20:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `educators`
--

CREATE TABLE `educators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `centre_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `last_observation_activity` datetime DEFAULT NULL,
  `last_milestone_activity` datetime DEFAULT NULL,
  `last_teachingplan_activity` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educators`
--

INSERT INTO `educators` (`id`, `centre_id`, `first_name`, `last_name`, `nickname`, `email`, `contact_number`, `password`, `active`, `deleted`, `last_observation_activity`, `last_milestone_activity`, `last_teachingplan_activity`, `date_created`, `date_modified`) VALUES
(1, 2, 'Jane Doe', 'The Educator', 'Jane', 'test@crayoncamp.com', '', 'abc123', b'1', b'0', NULL, '2019-03-08 00:00:00', NULL, '2019-04-17 11:30:32', '2019-04-17 11:31:35'),
(2, 1, 'Fatima Mary', 'Tong', 'Fatima', 'fatima.mary.tong@hotmail.com', '', 'abc123', b'1', b'0', '2019-04-18 00:00:00', '2019-04-04 00:00:00', '2019-05-03 00:00:00', '2019-04-18 20:59:57', '2019-04-18 21:00:55'),
(3, 1, 'Jjoti', 'Bagga', 'Jjoti', 'jjoti.bagga@test.com', '', 'abc123', b'1', b'0', '2019-04-16 00:00:00', '2018-04-18 00:00:00', '2018-04-09 00:00:00', '2019-04-19 16:15:35', '2019-04-19 16:15:38'),
(4, 1, 'Huong', 'Huong', 'Huong', 'huong@test.com', '', 'abc123', b'1', b'0', '2018-05-14 00:00:00', NULL, '2018-10-31 00:00:00', '2019-04-19 16:18:22', '2019-04-19 16:20:02'),
(5, 1, 'Erica', 'Erica', 'Erica', 'erica@test.com', '', 'abc123', b'1', b'0', '2018-03-19 00:00:00', NULL, NULL, '2019-04-19 16:19:53', '2019-04-19 16:19:56');

-- --------------------------------------------------------

--
-- Table structure for table `educators_assignment`
--

CREATE TABLE `educators_assignment` (
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educators_assignment`
--

INSERT INTO `educators_assignment` (`educator_id`, `child_id`) VALUES
(2, 2),
(3, 2),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `feedback` text NOT NULL,
  `giver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `giver_role` varchar(50) DEFAULT NULL,
  `giver_name` varchar(250) DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `child_id`, `feedback`, `giver_id`, `giver_role`, `giver_name`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 2, 'Thank you Fatima for keeping Sabrina\'s portfolio up to date!', 1, 'ROLE_ADMIN', 'Lilian Diaz', b'0', '2019-04-18 21:31:46', '2019-04-18 21:31:46'),
(2, 2, 'Thank you, Lilian!', 2, 'ROLE_EDUCATOR', 'Fatima Mary Tong', b'0', '2019-04-18 22:03:20', '2019-04-18 22:03:20');

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `age_group` varchar(50) NOT NULL,
  `developmental_area` varchar(50) NOT NULL,
  `observation` varchar(200) NOT NULL,
  `outcome_id` smallint(5) UNSIGNED NOT NULL,
  `date_tracked` date NOT NULL,
  `educator_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`child_id`, `age_group`, `developmental_area`, `observation`, `outcome_id`, `date_tracked`, `educator_id`) VALUES
(1, '2 to 3 years', 'Physical', 'uses steps one at a time', 2, '2019-03-08', 1),
(1, '2 to 3 years', 'Physical', 'turns pages one at a time', 3, '2019-03-01', 1),
(2, '1 to 2 years', 'Physical', 'walks, climbs and runs', 1, '2018-03-05', 3),
(2, '1 to 2 years', 'Physical', 'dances in place to music', 1, '2018-04-09', 3),
(2, '1 to 2 years', 'Physical', 'climbs onto chair', 1, '2018-03-12', 3),
(2, '1 to 2 years', 'Physical', 'feeds themselves', 1, '2018-03-12', 3),
(2, '1 to 2 years', 'Physical', 'scribbles with pencil or crayon held in fist', 1, '2018-03-13', 3),
(2, '1 to 2 years', 'Physical', 'turns pages of book, two or three pages at a time', 1, '2018-03-13', 3),
(2, '1 to 2 years', 'Physical', 'rolls large ball, using both hands and arms', 1, '2018-03-05', 3),
(2, '1 to 2 years', 'Social', 'begins to cooperate when playing', 3, '2018-04-18', 3),
(2, '1 to 2 years', 'Social', 'curious and energetic, but depends on adult presence for reassurance', 3, '2018-03-12', 3),
(2, '1 to 2 years', 'Emotional', 'may show anxiety when separating from significant people in their lives', 1, '2018-03-05', 3),
(2, '1 to 2 years', 'Emotional', 'may ‘lose control’ of self when tired or frustrated', 3, '2018-03-12', 3),
(2, '1 to 2 years', 'Cognitive', 'knows some body parts', 4, '2018-03-13', 3),
(2, '1 to 2 years', 'Cognitive', 'points to body parts in a game', 4, '2018-03-13', 3),
(2, '1 to 2 years', 'Cognitive', 'recognises self in photo or mirror', 4, '2018-03-13', 3),
(2, '1 to 2 years', 'Cognitive', 'stacks and knocks over items', 4, '2018-03-26', 3),
(2, '1 to 2 years', 'Cognitive', 'selects games and puts them away', 4, '2018-03-26', 3),
(2, '1 to 2 years', 'Language', 'says many words (mostly naming words)', 5, '2018-04-02', 3),
(2, '1 to 2 years', 'Language', 'begins to use one to two word sentences, e.g. ”want milk”', 5, '2018-03-30', 3),
(2, '1 to 2 years', 'Language', 'enjoys rhymes and songs', 1, '2018-04-02', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notification_for` varchar(100) DEFAULT NULL,
  `target_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_name` varchar(250) DEFAULT NULL,
  `giver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `giver_role` varchar(50) DEFAULT NULL,
  `giver_name` varchar(250) DEFAULT NULL,
  `recipient_id` bigint(20) UNSIGNED DEFAULT NULL,
  `recipient_role` varchar(50) DEFAULT NULL,
  `marked_read` bit(1) DEFAULT b'0',
  `deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notification_for`, `target_id`, `child_id`, `child_name`, `giver_id`, `giver_role`, `giver_name`, `recipient_id`, `recipient_role`, `marked_read`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 'Feedback', 2, 2, 'Maria Sabrina', 1, 'ROLE_ADMIN', 'Lilian Diaz', 1, 'ROLE_PARENT_GUARDIAN', b'0', b'0', '2019-04-18 21:31:46', '2019-04-18 21:31:46'),
(2, 'Feedback', 2, 2, 'Maria Sabrina', 1, 'ROLE_ADMIN', 'Lilian Diaz', 2, 'ROLE_EDUCATOR', b'0', b'0', '2019-04-18 21:31:46', '2019-04-18 21:31:46'),
(3, 'Feedback', 2, 2, 'Maria Sabrina', 2, 'ROLE_EDUCATOR', 'Fatima Mary Tong', 1, 'ROLE_PARENT_GUARDIAN', b'0', b'0', '2019-04-18 22:03:20', '2019-04-18 22:03:20');

-- --------------------------------------------------------

--
-- Table structure for table `observations`
--

CREATE TABLE `observations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `observation` text NOT NULL,
  `outcome_id` smallint(5) UNSIGNED NOT NULL,
  `assessment` text NOT NULL,
  `follow_up` text DEFAULT NULL,
  `date_tracked` date NOT NULL,
  `published` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `observations`
--

INSERT INTO `observations` (`id`, `educator_id`, `child_id`, `observation`, `outcome_id`, `assessment`, `follow_up`, `date_tracked`, `published`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 2, 2, 'Earlier, during the Easter activities, Sabrina showed her interest and involvement by asking questions pertaining to the activity. Shen then demonstrated her artistic skills by painting her bunny hat with the design and colors of her choice. She then helped her classmates finish their hats and even suggested them which colors to use. Once the activity was done, she was very proud and talked to me and to her classmates about the designs she made.', 3, '-', NULL, '2019-04-18', b'1', b'0', '2019-04-18 22:19:19', '2019-04-18 22:20:20'),
(2, 3, 2, 'Sabrina showed great interest in painting. She user her right hand palms grasp and painted the lines on the paper. She dipped her brush every time when she need more materials.', 5, '-', NULL, '2018-03-20', b'1', b'0', '2019-04-19 16:37:21', '2019-04-19 16:37:44'),
(3, 3, 2, 'Sabrina joined in sand play with other children during indoor play. She spotted a shovel in her left hand and started digging the sand and filled the bucket with sand. \"Are you filling the sand in the bucket\"\", Jjoti asked. Sabrina looked at her educator and smiled. Sabrina again skillfully filled the shovel with sand and pour into the bucket. \"I like the way you hold the shovel and fill in the container\", I said. Sabrina repeated the word sand and looked at Jjoti. She filled the half bucket with the sand and afterwards, she poured the sand back into the trough. \"Did you empty your bucket\", I asked. She spent a lot of time at the sand play area and explore this experience with lots of interest and showed good hand eye coordination.', 1, '-', NULL, '2018-04-28', b'1', b'0', '2019-04-19 16:44:12', '2019-04-19 16:44:14'),
(4, 3, 2, 'Sabrina is showing great interest in different are activities such as crayon drawing, easel brush painting, cotton bud painting, and fly splatter painting.', 5, '-', NULL, '2018-04-16', b'1', b'0', '2019-04-19 16:47:07', '2019-04-19 16:48:12'),
(5, 3, 2, 'Sabrina has been showing her increasing confidence in initiating play with her peers at different play setting. She also has established and maintain respectful, trusting relationship with others and her familiar educators. She confidently expresses her needs and feeling to staff. Sabrina moves smoothly between transition periods and adjusts well to new situation. She participated in dramatic play taking on different roles such as feeding the baby, pretend washing and cooking. She also shows interest in other children and being a part of a group. ', 1, '-', NULL, '2018-06-27', b'1', b'0', '2019-04-19 16:52:51', '2019-04-19 16:52:56'),
(6, 3, 2, 'Demonstrate a sense of belonging and comfort in her environments as she enjoys in the group dynamics such as listening stories, reading books, and also participate in the centre\'s events. Sabrina show growing appreciation and care for natural and constructed environments such as she loves watering the plants during outdoor play and also helps her educators to keep the environment clean by throwing the rubbish into the bin. She uses play to investigate and explore new ideas. She is playful and responds positively to others reaching out for company and friendship.', 2, '-', NULL, '2018-06-27', b'1', b'0', '2019-04-19 16:56:45', '2019-04-19 16:56:52'),
(7, 3, 2, 'Sabrina shows enthusiasm for participating in physical play and negotiate play speces to ensure the safety and wellbeing of themselves and others as she climbs and slides equipment, pushing pram and participate in ball and running games during outdoor play. She engages in increasingly complex sensory motor skills such as she explores the play dough by squashing, squeezing and manipulating in different shapes using tools. She touches and feel the natural materials such as she enjoys water play and sand play. Sabrina is usually able to recognize and communicate her bodily needs (for example, thirst, hunger, rest, comfort, physical activity) in familiar and new situations such as she would say \"more\", \"no\", \"outside\", etc.', 3, '-', NULL, '2018-06-27', b'1', b'0', '2019-04-19 17:02:48', '2019-04-19 17:02:50'),
(8, 3, 2, 'Sabrina can express wonder and interest in her environment such as spontaneously creates her own play such as she put the doll on the floor and cover with scarfs to her to sleep. She listens and respond to sounds and stories of farm animals, She can solve more than four pieces of jigsaw puzzles and sort shapes as well.', 4, '-', NULL, '2018-06-27', b'1', b'0', '2019-04-19 17:05:59', '2019-04-19 17:06:02'),
(9, 3, 2, 'Sabrina responds verbally and non-verbally to what she see, hear touch, feel, and taste. She can call her educators and peers by their names. She is curious, alert in exploring his environment and can clearly verbalize her needs in one or two words to her educators and other children. She used the creative ares such as drawing and painting o express ideas and make meaning. She shows her interest in sing and chant rhymes, jingles and songs.', 5, '-', NULL, '2018-06-27', b'1', b'0', '2019-04-19 17:09:21', '2019-04-19 17:09:25'),
(10, 3, 2, 'When playing outside, Sabrina was showing her skills of jumping onto the shapes on the group. She jumped from one shape to another with bending herself down to help her to be a able to jump.\n\nSabrina was developing he physical skills by jumping onto the shapes when played outside.', 1, '-', NULL, '2018-05-15', b'1', b'0', '2019-04-19 17:35:27', '2019-04-19 17:56:04'),
(11, 4, 2, 'Sabrina arrived in the room, the educator asked her \"Sabrina, would you like to put your bag into the locker?\", she nodded her head and got help from the educator to put the bag into her locker, educator praised her \"good job Sabrina, how about taking off your jacket and hat too Sabrina?\" educator encouraged her, but she refused and said \"no\", educator said to her \"it\'s ok Sabrina if you don\'t want\". Then educator engaged her to the activities. At sleeping time, educator told her to take off her shoes to sleep but she didn\'t want and she slept with jacket, hat and shoes on.', 1, '-', NULL, '2018-05-14', b'1', b'0', '2019-04-19 17:46:02', '2019-04-19 17:46:05'),
(12, 5, 2, 'Sabrina confidently built the block tower without falling down.', 4, '-', NULL, '2018-03-19', b'1', b'0', '2019-04-19 17:48:54', '2019-04-19 17:48:56'),
(13, 5, 2, 'Sabrina made the block tower with Tran. She picked each block promptly using her left hand and stack on the top of each other. She was showing a great confidence and was able to more than five blocks without falling down.\n\nSabrina showed a good sense of wellbeing which enables her to cooperate with others, long attention span and develop her fine motor skills.', 3, '-', NULL, '2018-03-19', b'1', b'0', '2019-04-19 17:53:04', '2019-04-19 17:53:07'),
(14, 2, 2, 'Sabrina, Johnson, Eden and Molly were playing  game that required them to receive and pass the ball to the person next to them. The objective of this game was to foster children\'s social skills by promoting children to share and wait for their turn to have the ball. The first child to get the game tarted was Sabrina, the educator said to her, \"I like the way you are waiting nicely Sabrina, you may have the ball first\" To this Eden, Johnson and Molly sat on their bottoms. Sabrina stretched out her hand and received the ball gently. The educator praised and clapped their hands. \" Well done Sabrina you may now pass the ball to Johnson\". ', 2, 'Sabrina was excited to play this game, she waited for her turn and demonstrated her ability to be patient and gentle when she received and passed the ball. Sabrina was able to concentrate and observe the ball moved around in the circle as she waited for her turn, she recognized that everyone would have a turn which perhaps may have been the result of her sitting patiently.', 'We will plan to play more group games that allow children to focus on sharing, turn taking and waiting for their turn.', '2018-07-03', b'1', b'0', '2019-04-19 18:07:33', '2019-04-20 14:37:24'),
(15, 2, 2, 'We chose the song \"Waka Waka\" sang by Shakira as the song dance for the Zumba day. This song was among the favorite as children have positive reaction to the music and lyrics. The educator learnt the lyrics and actions and demonstrated to the children, we worked hard everyday learning and practicing the actions and lyrics. Molly, Marian, Sabrina, and Eliana showed great concentration and awareness of the song as they were able to sing the chorus and memorize the chorus action. The toddlers were ready and confident when Zumba day came, most of the children were dressed in active gear that displayed bright and happy colors to get them moving and dancing. Sabrina and her friend sat in one group as they watched the group performed their dance. She was happy and laughing as she watched and clapped her hands. She bopped her head and swayed her body to the upbeat music. The toddlers stood up and moved to the center of the room to perform their song.', 4, 'Sabrina was confident as she danced to the music, she watched the educators and followed their actions when they had finished the other children and educators gave them a big round of applause. The center ended the zumba performances by dancing together as a while center.', 'We will continue to provide and allow opportunities for Sabrina to engage in dancing and singing as she enjoys it.', '2018-09-17', b'1', b'0', '2019-04-19 18:16:02', '2019-04-20 14:36:25'),
(16, 2, 2, 'The educator gathered a few children into the garden to harvest the vegetables that they had planted a few months ago. The educator pointed out the stages and changes of identifying readiness in a plant. These include physical characteristics such as the colour, size, texture and time of when it was planted. Sabrina then practiced counting as she picked each vegetables that included spinach, cos lettuce, celery and potatoes. After harvesting the greeneries, Sabrina and the children worked together to prepare the soil for the next lot of baby plants to be planted by eliminating the weeds and raking the soil. After the had work was completed, Sabrina sat down to sample the vegetables. She described the different flavours, smells, texture and taste of each plant. Some using the words `bitter, sour, sweet, nice, and yuck`. The children have all played an important role in looking after our community as they have taken care of the vegetables that have matured from a baby plant to an adult one.', 1, 'Sabrina enjoyed intentional teaching experience with the educator and children as she was active in recognizing and harvesting plants. Sabrina had the opportunity to observe that before each planting the soil needed to be prepared.', 'We will encourage Sabrina to look after the vegetable garden by watering and monitoring its growth.', '2018-10-23', b'1', b'0', '2019-04-19 18:29:02', '2019-04-20 14:35:09'),
(17, 2, 2, 'The different types of recycled materials that were provided by educators and children\'s family were boxes, cardboard, milk bottles, magazines and newspaper. The educator sat down with Sabrina and went through the different resources that she could use to create her art work. Sabrina picked a paintbrush and dipped it into the purple paint, she painted the cardboard box in slow strokes, when she was satisfied Sabrina gathered some glitter from the container and sprinkled it on her artwork. ', 5, 'Sabrina used her imagination and inspirations to direct and craft her creation. As she became further involved in her participation, she developed creativity by using each material in her artwork. She is enhancing her fine moter skills as she participated n painting, colouring, pasting, cutting, ordering, and arranging, each task requires the control and movement of the hand and fingers over the subject (Learning)', 'We will encourage and foster Sabrina to talk about her work to build her confidence.', '2018-11-01', b'1', b'0', '2019-04-19 18:34:34', '2019-04-20 14:34:20'),
(18, 2, 2, 'Sabrina is a calm and quiet child who enjoys playing in all the learning experiences provided. She enjoys her own company but thrives when she is interacting with other children as she is more confident to speck and show her personality. She has an awareness of the children around her and will often reflect on what they say or do in her own practices. She is open to new challenges and tasks as she learnt to open her locker to get belongings such as her hat, bag and jacket without the educator\'s support. She is also a great helper to her friends as she will often get their belongings when they are struggling. Sabrina is developing her sense of belonging in the room as over the months she has gained more confidence to speak and show he emotions.', 1, 'It has been pleasure to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise and encouragement that we give her', 'We will plan to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise, and encouragement that we give her.', '2018-12-05', b'1', b'0', '2019-04-19 18:41:16', '2019-04-20 14:32:49'),
(19, 2, 2, 'Sabrina gets along with all the children in the toddler room because of her easy going personality and temperament. Sabrina is beginning to contribute to group discussions and duties such as watering the vegetable garden and helping to tidy up the room after play and mealtimes. She is playful and will join in group play where she feels comfortable and accepted by the children.', 2, 'It has been pleasure to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise and encouragement that we give her', 'We will plan to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise, and encouragement that we give her.', '2018-12-05', b'1', b'0', '2019-04-19 18:44:28', '2019-04-20 14:32:58'),
(20, 2, 2, 'Sabrina demonstrates that she is a consistent and quick learner as she is independently going to the toilet and developing her self-help skills such as putting on and taking off her shoes, applying sunscreen, feeding herself, washing her hands and packing her bag. Sabrina  is conscious of her likes and dislikes as he often selects the same type of food to eat and activities to engage in. She is devolving her fine motor and gross motor kills with the activities provided such using the scissors, play dough, ball games and obstacle course. Sabrina is able to regulate her own emotions when she is upset with the support of the educators, rarely does she is will share, wait and take turns with toys.', 3, 'It has been pleasure to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise and encouragement that we give her', 'We will plan to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise, and encouragement that we give her.', '2018-12-05', b'1', b'0', '2019-04-19 18:49:39', '2019-04-20 14:33:07'),
(21, 2, 2, 'Sabrina is an active learner that shows interest in all different types of play such as dramatic, sensory and construction just to name a few. She is able to occupy and facilitate in her own play without the educator or children\'s support. She is very fond of arts and crafts and enjoys painting and pasting, she takes her time to complete her artwork and tasks. Sabrina is able to concentrate and pay attention to certain learning or experience that is taking place without getting distracted from her other peers, for example, when some children are talking to each other when the educator is reading a story, Sabrina continues to listen and pay attention to the educator.', 4, 'It has been pleasure to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise and encouragement that we give her', 'We will plan to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise, and encouragement that we give her.', '2018-12-05', b'1', b'0', '2019-04-19 18:54:04', '2019-04-20 14:33:15'),
(22, 2, 2, 'Sabrina is a shy child who needs to be prompted and encouraged to speak sometimes as she will hesitate and takes her time to respond, but when this happens, she will often respond physically by smiling, nodding, or shaking her head. But through the experiences and educators spending more time with Sabrina, she has gained more confidence to speak and express her emotions when she is happy or excited. She will often seek out the educator when she is proud of something that she has just achieved e.g. \"I went to the toilet Bapima\" \"I put on my shoes\".', 5, 'It has been pleasure to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise and encouragement that we give her', 'We will plan to support and foster Sabrina to build her confidence and self-esteem with the interaction, praise, and encouragement that we give her.', '2018-12-05', b'1', b'0', '2019-04-19 18:59:35', '2019-04-20 14:33:23');

-- --------------------------------------------------------

--
-- Table structure for table `parents_guardians`
--

CREATE TABLE `parents_guardians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `centre_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `type` varchar(15) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents_guardians`
--

INSERT INTO `parents_guardians` (`id`, `centre_id`, `first_name`, `last_name`, `nickname`, `email`, `contact_number`, `password`, `type`, `active`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 1, 'Angelito Jr', 'Sardez', 'Jojo', 'aosardez@up.edu.ph', '', 'abc123', 'Parent', b'1', b'0', '2019-04-18 20:51:14', '2019-04-18 20:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `parents_guardians_assignment`
--

CREATE TABLE `parents_guardians_assignment` (
  `parentguardian_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents_guardians_assignment`
--

INSERT INTO `parents_guardians_assignment` (`parentguardian_id`, `child_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stats_all`
--

CREATE TABLE `stats_all` (
  `centre_id` bigint(20) UNSIGNED NOT NULL,
  `total_milestones` int(11) NOT NULL DEFAULT 0,
  `total_observations` int(11) NOT NULL DEFAULT 0,
  `total_itps` int(11) NOT NULL DEFAULT 0,
  `total_itps_open` int(11) NOT NULL DEFAULT 0,
  `total_parents_guardians` int(11) NOT NULL DEFAULT 0,
  `total_parents` int(11) NOT NULL DEFAULT 0,
  `total_guardians` int(11) NOT NULL DEFAULT 0,
  `total_children` int(11) NOT NULL DEFAULT 0,
  `total_babies` int(11) NOT NULL DEFAULT 0,
  `total_senior_babies` int(11) NOT NULL DEFAULT 0,
  `total_toddlers` int(11) NOT NULL DEFAULT 0,
  `total_juniors` int(11) NOT NULL DEFAULT 0,
  `total_kinders` int(11) NOT NULL DEFAULT 0,
  `total_educators` int(11) NOT NULL DEFAULT 0,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_all`
--

INSERT INTO `stats_all` (`centre_id`, `total_milestones`, `total_observations`, `total_itps`, `total_itps_open`, `total_parents_guardians`, `total_parents`, `total_guardians`, `total_children`, `total_babies`, `total_senior_babies`, `total_toddlers`, `total_juniors`, `total_kinders`, `total_educators`, `last_update_mode`, `date_modified`) VALUES
(1, 19, 22, 4, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 4, 'Event', '2019-04-20 14:37:24'),
(2, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 'FullUpdate', '2019-04-20 04:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `stats_children`
--

CREATE TABLE `stats_children` (
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `total_milestones` int(11) NOT NULL DEFAULT 0,
  `total_observations` int(11) NOT NULL DEFAULT 0,
  `total_itps` int(11) NOT NULL DEFAULT 0,
  `total_itps_open` int(11) NOT NULL DEFAULT 0,
  `total_milestones_physical` int(11) NOT NULL DEFAULT 0,
  `total_milestones_social` int(11) NOT NULL DEFAULT 0,
  `total_milestones_emotional` int(11) NOT NULL DEFAULT 0,
  `total_milestones_cognitive` int(11) NOT NULL DEFAULT 0,
  `total_milestones_language` int(11) NOT NULL DEFAULT 0,
  `total_milestones_seek_advice` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome1` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome2` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome3` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome4` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome5` int(11) NOT NULL DEFAULT 0,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_children`
--

INSERT INTO `stats_children` (`child_id`, `total_milestones`, `total_observations`, `total_itps`, `total_itps_open`, `total_milestones_physical`, `total_milestones_social`, `total_milestones_emotional`, `total_milestones_cognitive`, `total_milestones_language`, `total_milestones_seek_advice`, `total_observations_outcome1`, `total_observations_outcome2`, `total_observations_outcome3`, `total_observations_outcome4`, `total_observations_outcome5`, `last_update_mode`, `date_modified`) VALUES
(1, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'FullUpdate', '2019-04-20 04:35:01'),
(2, 19, 22, 4, 1, 7, 2, 2, 5, 3, 0, 6, 3, 4, 4, 5, 'Event', '2019-04-20 14:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `stats_children_milestones_pending`
--

CREATE TABLE `stats_children_milestones_pending` (
  `child_id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `current_group` varchar(50) NOT NULL,
  `current_age_group` varchar(50) NOT NULL,
  `pending_milestones` text NOT NULL,
  `total` int(11) NOT NULL,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_children_milestones_pending`
--

INSERT INTO `stats_children_milestones_pending` (`child_id`, `name`, `current_group`, `current_age_group`, `pending_milestones`, `total`, `last_update_mode`, `date_modified`) VALUES
(2, 'Maria Sabrina Sardez', 'Juniors', '3 to 5 years', 'Physical: 17, Social: 5, Emotional: 7, Cognitive: 17, Language: 10', 56, 'FullUpdate', '2019-04-20 04:35:01'),
(1, 'Kiddie Moo', 'Toddlers', '1 to 2 years', 'Physical: 17, Social: 3, Emotional: 5, Cognitive: 12, Language: 6', 43, 'FullUpdate', '2019-04-20 04:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `stats_children_observations_due`
--

CREATE TABLE `stats_children_observations_due` (
  `child_id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `group` varchar(50) NOT NULL,
  `last_observation` date DEFAULT NULL,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_children_observations_due`
--

INSERT INTO `stats_children_observations_due` (`child_id`, `name`, `group`, `last_observation`, `last_update_mode`, `date_modified`) VALUES
(2, 'Maria Sabrina Sardez', 'Juniors', '2018-12-05', 'FullUpdate', '2019-04-20 04:35:01'),
(1, 'Kiddie Moo', 'Toddlers', NULL, 'FullUpdate', '2019-04-20 04:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `stats_children_seek_advice`
--

CREATE TABLE `stats_children_seek_advice` (
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `current_group` varchar(50) NOT NULL,
  `milestone_age_group` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stats_educators`
--

CREATE TABLE `stats_educators` (
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `total_milestones` int(11) NOT NULL DEFAULT 0,
  `total_observations` int(11) NOT NULL DEFAULT 0,
  `total_observations_unpublished` int(11) NOT NULL DEFAULT 0,
  `total_itps` int(11) NOT NULL DEFAULT 0,
  `total_itps_open` int(11) NOT NULL DEFAULT 0,
  `total_children` int(11) NOT NULL DEFAULT 0,
  `total_milestones_physical` int(11) NOT NULL DEFAULT 0,
  `total_milestones_social` int(11) NOT NULL DEFAULT 0,
  `total_milestones_emotional` int(11) NOT NULL DEFAULT 0,
  `total_milestones_cognitive` int(11) NOT NULL DEFAULT 0,
  `total_milestones_language` int(11) NOT NULL DEFAULT 0,
  `total_milestones_seek_advice` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome1` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome2` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome3` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome4` int(11) NOT NULL DEFAULT 0,
  `total_observations_outcome5` int(11) NOT NULL DEFAULT 0,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_educators`
--

INSERT INTO `stats_educators` (`educator_id`, `total_milestones`, `total_observations`, `total_observations_unpublished`, `total_itps`, `total_itps_open`, `total_children`, `total_milestones_physical`, `total_milestones_social`, `total_milestones_emotional`, `total_milestones_cognitive`, `total_milestones_language`, `total_milestones_seek_advice`, `total_observations_outcome1`, `total_observations_outcome2`, `total_observations_outcome3`, `total_observations_outcome4`, `total_observations_outcome5`, `last_update_mode`, `date_modified`) VALUES
(1, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'FullUpdate', '2019-04-20 04:35:01'),
(2, 0, 10, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 'Event', '2019-04-20 14:37:24'),
(3, 19, 9, 0, 1, 0, 1, 7, 2, 2, 5, 3, 0, 0, 0, 0, 0, 0, 'FullUpdate', '2019-04-20 04:35:01'),
(4, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'FullUpdate', '2019-04-20 04:35:01'),
(5, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'FullUpdate', '2019-04-20 04:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `stats_educators_tracking`
--

CREATE TABLE `stats_educators_tracking` (
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `groups_handled` varchar(250) NOT NULL,
  `total_children` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_children_seeking_advice` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_children_milestones_pending` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_children_observations_due` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_milestones` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_observations` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_itps` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_update_mode` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats_educators_tracking`
--

INSERT INTO `stats_educators_tracking` (`educator_id`, `name`, `groups_handled`, `total_children`, `total_children_seeking_advice`, `total_children_milestones_pending`, `total_children_observations_due`, `total_milestones`, `total_observations`, `total_itps`, `last_update_mode`, `date_modified`) VALUES
(1, 'Jane Doe The Educator', '', 0, 0, 0, 0, 2, 0, 0, 'FullUpdate', '2019-04-20 04:35:01'),
(2, 'Fatima Mary Tong', 'Juniors', 1, 0, 1, 1, 0, 10, 1, 'FullUpdate', '2019-04-20 04:35:01'),
(3, 'Jjoti Bagga', 'Juniors', 1, 0, 1, 1, 19, 9, 1, 'FullUpdate', '2019-04-20 04:35:01'),
(4, 'Huong Huong', 'Juniors', 1, 0, 1, 1, 0, 1, 2, 'FullUpdate', '2019-04-20 04:35:01'),
(5, 'Erica Erica', 'Juniors', 1, 0, 1, 1, 0, 2, 0, 'FullUpdate', '2019-04-20 04:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `teaching_plans`
--

CREATE TABLE `teaching_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `educator_id` bigint(20) UNSIGNED NOT NULL,
  `child_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `target_outcome_id` smallint(5) UNSIGNED DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `done` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaching_plans`
--

INSERT INTO `teaching_plans` (`id`, `educator_id`, `child_id`, `title`, `details`, `target_outcome_id`, `target_date`, `done`, `deleted`, `date_created`, `date_modified`) VALUES
(1, 2, 2, 'Favorite book sharing ', 'I will task Sabrina to bring her favorite book and talk about it in front of her classmates. We will also read the book and and ask the children about which part of the story did they like the most.', 4, '2019-05-03', b'0', b'0', '2019-04-18 22:32:55', '2019-04-18 22:32:55'),
(2, 3, 2, 'Future planning - Initiate and join in play', 'To extend on this experience, I will provide more opportunities to explore with sand such as making the sand castles and show the difference between empty and full container.', 5, '2018-04-09', b'1', b'0', '2019-04-19 17:13:23', '2019-04-19 17:13:26'),
(3, 4, 2, 'For Sabrina to play with other children in the small groups', 'Educators will invite Sabrina to join in the small group experiences such as singing songs, bubbles, group building blocks, etc.', 2, '2018-10-31', b'1', b'0', '2019-04-19 17:38:59', '2019-04-19 17:39:01'),
(4, 4, 2, 'For Sabrina to develop her independence skills', 'Educators will encourage Sabrina to scarf the food after finished, take off shoes / socks before sleeping or pack up the toys after played.', 3, '2018-10-31', b'1', b'0', '2019-04-19 17:40:23', '2019-04-19 17:40:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrators_active_idx` (`active`,`deleted`) USING BTREE,
  ADD KEY `administrators_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE,
  ADD KEY `administrators_email_idx` (`email`) USING BTREE;

--
-- Indexes for table `centres`
--
ALTER TABLE `centres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`id`),
  ADD KEY `children_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE,
  ADD KEY `children_last_activity_idx` (`group`,`active`,`deleted`,`birthday`) USING BTREE;

--
-- Indexes for table `educators`
--
ALTER TABLE `educators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `educators_active_idx` (`active`,`deleted`) USING BTREE,
  ADD KEY `educators_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE,
  ADD KEY `educators_email_idx` (`email`) USING BTREE;

--
-- Indexes for table `educators_assignment`
--
ALTER TABLE `educators_assignment`
  ADD PRIMARY KEY (`educator_id`,`child_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_child_id_idx` (`child_id`,`deleted`) USING BTREE;

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD KEY `milestone_educator_id_idx` (`educator_id`,`child_id`,`date_tracked`) USING BTREE,
  ADD KEY `milestone_age_group_idx` (`age_group`,`developmental_area`,`observation`,`outcome_id`) USING BTREE;

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_recipient_idx` (`recipient_id`,`recipient_role`,`deleted`) USING BTREE;

--
-- Indexes for table `observations`
--
ALTER TABLE `observations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `observations_educator_id_idx` (`educator_id`,`child_id`,`outcome_id`,`date_tracked`,`published`,`deleted`) USING BTREE;

--
-- Indexes for table `parents_guardians`
--
ALTER TABLE `parents_guardians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parents_guardians_active_idx` (`active`,`deleted`,`type`) USING BTREE,
  ADD KEY `parents_guardians_first_name_idx` (`first_name`,`last_name`,`nickname`) USING BTREE,
  ADD KEY `parents_guardians_index` (`email`) USING BTREE;

--
-- Indexes for table `parents_guardians_assignment`
--
ALTER TABLE `parents_guardians_assignment`
  ADD PRIMARY KEY (`parentguardian_id`,`child_id`);

--
-- Indexes for table `stats_all`
--
ALTER TABLE `stats_all`
  ADD PRIMARY KEY (`centre_id`);

--
-- Indexes for table `stats_children`
--
ALTER TABLE `stats_children`
  ADD PRIMARY KEY (`child_id`);

--
-- Indexes for table `stats_educators`
--
ALTER TABLE `stats_educators`
  ADD PRIMARY KEY (`educator_id`);

--
-- Indexes for table `stats_educators_tracking`
--
ALTER TABLE `stats_educators_tracking`
  ADD PRIMARY KEY (`educator_id`);

--
-- Indexes for table `teaching_plans`
--
ALTER TABLE `teaching_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teaching_plans_child_id_idx` (`child_id`,`educator_id`,`target_outcome_id`,`target_date`,`deleted`,`done`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `centres`
--
ALTER TABLE `centres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `educators`
--
ALTER TABLE `educators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `observations`
--
ALTER TABLE `observations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `parents_guardians`
--
ALTER TABLE `parents_guardians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teaching_plans`
--
ALTER TABLE `teaching_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
