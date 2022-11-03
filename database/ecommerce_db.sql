-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 04, 2022 lúc 12:20 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_aboutus`
--

CREATE TABLE `ecommerce_aboutus` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `title_vn` varchar(255) DEFAULT NULL,
  `link` varchar(150) NOT NULL,
  `label` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `json_pictures` text NOT NULL,
  `content` text NOT NULL,
  `content_vn` text DEFAULT NULL,
  `area` tinyint(4) NOT NULL DEFAULT 1,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `email_support` varchar(50) NOT NULL,
  `email_sales` varchar(50) NOT NULL,
  `email_other` varchar(50) NOT NULL,
  `phone_support` varchar(25) NOT NULL,
  `phone_sales` varchar(25) NOT NULL,
  `phone_other` varchar(25) NOT NULL,
  `fax_1` varchar(25) NOT NULL,
  `fax_2` varchar(25) NOT NULL,
  `map` text NOT NULL,
  `is_publish` tinyint(4) NOT NULL DEFAULT 0,
  `user_create` char(50) NOT NULL,
  `time_create` datetime DEFAULT NULL,
  `user_update` char(50) NOT NULL,
  `time_update` datetime DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_aboutus`
--

INSERT INTO `ecommerce_aboutus` (`id`, `title`, `title_vn`, `link`, `label`, `picture`, `json_pictures`, `content`, `content_vn`, `area`, `address`, `city`, `state`, `zip_code`, `country`, `email_support`, `email_sales`, `email_other`, `phone_support`, `phone_sales`, `phone_other`, `fax_1`, `fax_2`, `map`, `is_publish`, `user_create`, `time_create`, `user_update`, `time_update`, `is_delete`) VALUES
(4, 'MON to FRI 9AM - 6PM SAT 9AM - 2PM', 'Từ thứ 2 đến thứ 7 9:00 đến 14:00 Chủ nhật 9:00 đến 14:00', '', '', 'blog-1.jpg', '', '<p>Euismod phasellus ac lectus fusce parturient cubilia a nisi blandit sem cras nec tempor adipiscing rcu ullamcorper ligula. BBBBBBBBBBBBBBBBBBBBBBB</p>', '<p>Euismod phasellus ac lectus fusce parturient cubilia a nisi blandit sem cras nec tempor adipiscing rcu ullamcorper ligula.</p>', 1, '97845 Baker st. 567 Los Angeles - US1', '', '', '', '', 'aaaa@gmail.com', 'shoes@gmail.com', '', '0287.1097.338', '0287.1097.111', '', '', '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d31339.577701771967!2d106.88482425435237!3d10.929551589159436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1632883929730!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 1, '1', '2020-04-05 09:44:16', '1', '2022-06-02 16:53:14', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_admin_users`
--

CREATE TABLE `ecommerce_admin_users` (
  `id` int(10) NOT NULL,
  `groupid` int(10) DEFAULT NULL,
  `username` char(50) DEFAULT NULL,
  `password` char(100) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` char(50) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT 0,
  `usercreate` char(70) DEFAULT NULL,
  `datecreate` datetime DEFAULT '0000-00-00 00:00:00',
  `dateupdate` datetime DEFAULT '0000-00-00 00:00:00',
  `userupdate` char(70) DEFAULT NULL,
  `ipcreate` char(25) DEFAULT NULL,
  `ipupdate` char(25) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0,
  `birthday` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_admin_users`
--

INSERT INTO `ecommerce_admin_users` (`id`, `groupid`, `username`, `password`, `fullname`, `address`, `mobile`, `email`, `department`, `image`, `gender`, `usercreate`, `datecreate`, `dateupdate`, `userupdate`, `ipcreate`, `ipupdate`, `lastlogin`, `isdelete`, `birthday`) VALUES
(1, 1, 'root', 'ab838e5b7d0468819b7ba8eb19165f99', 'Root', '56, An Bình, Biên Hòa, Đồng Nai', '0355935685', 'vuanhtuan3113@gmail.com', 0, 'Untitled.png', 1, 'tuanvu', '2012-12-05 11:24:56', '2022-06-01 17:02:48', 'root', NULL, '::1', '2015-10-05 15:31:00', 0, '1993-01-31 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_comments`
--

CREATE TABLE `ecommerce_comments` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT -1,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `submit_date` datetime NOT NULL DEFAULT current_timestamp(),
  `isdelete` tinyint(1) DEFAULT 0,
  `is_approve` tinyint(1) DEFAULT 0,
  `is_notify` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_comments`
--

INSERT INTO `ecommerce_comments` (`id`, `page_id`, `parent_id`, `name`, `content`, `submit_date`, `isdelete`, `is_approve`, `is_notify`) VALUES
(1, 33, -1, 'tuanva', 'Thank you for taking the time to write this article, I really enjoyed reading it!\r\n\r\nThank you, David!', '2020-07-22 14:35:15', 0, 1, 0),
(2, 33, 1, 'tuanva', 'It\'s good to hear that you enjoyed this article.', '2020-07-22 14:36:19', 0, 1, 0),
(3, 33, -1, 'tuanva', 'I appreciate the time and effort you spent writing this article, good job!', '2020-07-22 14:37:43', 0, 1, 0),
(4, 33, 2, 'tuanva', 'I appreciate the time and effort you spent writing this article, good job!', '2020-07-22 14:37:43', 0, 1, 0),
(5, 33, 3, 'tuanva', 'I appreciate the time and effort you spent writing this article, good job!', '2020-07-22 14:37:43', 0, 1, 0),
(6, 33, 2, 'tuanva', 'I appreciate the time and effort you spent writing this article, good job!', '2020-07-22 14:37:43', 0, 1, 0),
(7, 33, 3, 'hanva', 'Thằng này hài lắm.', '2022-04-25 15:48:52', 0, 1, 0),
(8, 33, 7, 'hanva', 'Kệ nó đi bạn', '2022-04-25 15:49:34', 0, 1, 0),
(10, 33, -1, 'hanva', 'Alo 123', '2022-04-25 15:53:58', 0, 1, 0),
(11, 33, 6, 'hanva', 'hay', '2022-04-25 16:14:50', 0, 1, 0),
(12, 33, 11, 'tuanva', 'Tôi cũng thấy hay =]]', '2022-04-25 16:18:47', 0, 1, 0),
(13, 33, 12, 'tuanva', 'Bạn thì sao?', '2022-04-25 16:19:00', 0, 1, 0),
(14, 33, 13, 'tuanva', 'Good', '2022-04-25 16:19:11', 0, 1, 0),
(15, 33, 14, 'hanva', 'Hay mày', '2022-04-25 16:22:03', 0, 1, 0),
(16, 33, -1, 'tuanva', 'Aloo 12340987', '2022-04-25 16:22:18', 0, 1, 0),
(17, 33, 16, 'hanva', 'Bố thằng hâm', '2022-04-25 16:23:20', 0, 1, 0),
(18, 33, 17, 'tuanva', 'Sao lại chửi tôi?', '2022-04-25 16:23:40', 0, 1, 0),
(19, 33, 18, 'hanva', 'Thích mày', '2022-04-25 16:23:50', 0, 1, 0),
(20, 33, 19, 'tuanva', 'OK', '2022-04-25 16:24:11', 0, 1, 0),
(21, 33, 15, 'hanva', 'cuì mía', '2022-04-25 17:07:50', 0, 1, 0),
(22, 33, -1, 'hanva', 'test01', '2022-04-25 17:08:13', 0, 1, 0),
(23, 29, -1, 'hanva', 'Test', '2022-04-29 12:53:12', 0, 1, 0),
(24, 29, -1, 'hanva', 'Test01', '2022-04-29 12:53:18', 0, 1, 0),
(25, 29, -1, 'hanva', 'Test02', '2022-04-29 12:53:23', 0, 1, 0),
(26, 29, -1, 'hanva', 'Test03\n', '2022-04-29 12:53:26', 0, 1, 0),
(27, 29, 25, 'hanva', 'Hay', '2022-04-29 12:53:41', 0, 1, 0),
(28, 29, 27, 'hanva', 'Hay01', '2022-04-29 12:53:47', 0, 1, 0),
(29, 33, 22, 'tuanva', 'Truất', '2022-04-29 16:31:37', 0, 1, 0),
(30, 34, -1, 'hanva', 'asas', '2022-05-25 14:30:18', 0, 1, 0),
(31, 34, 30, 'hanva', '1111', '2022-05-25 14:30:23', 0, 1, 0),
(32, 34, -1, 'tuanva', 'hài vãi chưởng', '2022-05-30 21:37:14', 0, 1, 0),
(33, 33, -1, 'hanva', '1212', '2022-06-01 15:56:34', 0, 1, 0),
(34, 34, -1, 'hanva', 'aaaa', '2022-08-01 10:11:08', 0, 0, 0),
(35, 34, -1, 'hanva', '33', '2022-08-01 10:11:52', 0, 1, 0),
(36, 34, -1, 'hanva', '12', '2022-08-01 10:11:56', 0, 0, 0),
(37, 34, -1, 'hanva', '12', '2022-08-01 10:11:59', 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_config_vat`
--

CREATE TABLE `ecommerce_config_vat` (
  `id` int(11) NOT NULL,
  `vat` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_config_vat`
--

INSERT INTO `ecommerce_config_vat` (`id`, `vat`) VALUES
(1, '10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_contact`
--

CREATE TABLE `ecommerce_contact` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `cellphone` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `isdelete` int(2) DEFAULT 0,
  `reply_content` text DEFAULT NULL,
  `reply_date` datetime DEFAULT NULL,
  `is_notify` tinyint(1) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_contact`
--

INSERT INTO `ecommerce_contact` (`id`, `fullname`, `company`, `cellphone`, `email`, `content`, `datecreated`, `type`, `isdelete`, `reply_content`, `reply_date`, `is_notify`) VALUES
(397, 'tuanva', NULL, NULL, '123tuanva@gmail.com', '123 test', '2022-04-16 14:31:35', NULL, 0, NULL, NULL, 0),
(396, 'tuanva', NULL, NULL, '123tuanva@gmail.com', '123 test', '2022-04-16 14:31:22', NULL, 0, NULL, NULL, 0),
(398, 'tuanva', NULL, NULL, '123tuanva@gmail.com', '123 test', '2022-04-16 14:31:41', NULL, 0, NULL, NULL, 0),
(402, 'hanva', NULL, NULL, 'vuanhtuan3113@gmail.com', 'có thì sao?', '2022-05-30 13:12:17', NULL, 0, '<p>OK</p>\n', '2022-06-03 15:06:13', 0),
(399, 'tuanva', NULL, NULL, '123@gmail.com', 'test123', '2022-04-16 14:32:49', NULL, 0, NULL, NULL, 0),
(395, 'tuanva', NULL, NULL, '123tuanva@gmail.com', '123 test', '2022-04-16 14:31:05', NULL, 0, NULL, NULL, 0),
(450, '121', NULL, NULL, '12@gmail.com', '121212', '2022-08-01 09:49:57', NULL, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_email_newsletter`
--

CREATE TABLE `ecommerce_email_newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_email_newsletter`
--

INSERT INTO `ecommerce_email_newsletter` (`id`, `email`, `date_create`) VALUES
(32, 'hanva@gmail.com', '2022-04-27 13:31:20'),
(33, 'test@gmail.com', '2022-04-27 13:31:57'),
(34, 'vuanhtuan3113@gmail.com', '2022-04-29 16:19:49'),
(35, 'tat20012@gmail.com', '2022-05-23 13:42:57'),
(36, '12@gmail.com', '2022-08-01 10:10:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_events`
--

CREATE TABLE `ecommerce_events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `color_tag` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0,
  `is_notify` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_file_manager`
--

CREATE TABLE `ecommerce_file_manager` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `name_file` varchar(45) DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `size_file` varchar(45) DEFAULT NULL,
  `extension_file` varchar(45) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `user_create` varchar(45) DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  `user_update` varchar(45) DEFAULT NULL,
  `is_starred` tinyint(1) DEFAULT 0,
  `is_delete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_google_users`
--

CREATE TABLE `ecommerce_google_users` (
  `google_id` decimal(21,0) NOT NULL,
  `google_name` varchar(60) NOT NULL,
  `google_email` varchar(60) NOT NULL,
  `google_link` varchar(60) NOT NULL,
  `google_picture_link` varchar(200) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_google_users`
--

INSERT INTO `ecommerce_google_users` (`google_id`, `google_name`, `google_email`, `google_link`, `google_picture_link`, `name`, `last_name`, `address`, `mobile`) VALUES
('105582891398523551577', 'Anh Tuấn Vũ', 'vuanhtuan3113@gmail.com', '', 'https://lh3.googleusercontent.com/a-/AOh14GhkKsBbAZWpwR2uFugg8brsgl9-nL06OqssuSvv6w=s96-c', 'Anh Tuấn', 'Vũ', '123 tuan', '0123456789'),
('111002322210329550883', 'Tuan Vu Anh', 'tuanva@greystonevn.com', '', 'https://lh3.googleusercontent.com/a/AATXAJxezuyJBFZHIOYKamHzCSMBUdREKTtEo_K4LDtP=s96-c', 'Tuan', 'Vu Anh', 'test01', '0321654987');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_groups`
--

CREATE TABLE `ecommerce_groups` (
  `id` int(11) NOT NULL,
  `groupname` varchar(100) NOT NULL,
  `params` varchar(5000) DEFAULT NULL,
  `isadmin` tinyint(1) DEFAULT 0,
  `grouptype` tinyint(1) DEFAULT NULL,
  `datecreate` datetime NOT NULL,
  `usercreate` char(50) NOT NULL,
  `userupdate` char(50) DEFAULT NULL,
  `dateupdate` datetime DEFAULT NULL,
  `isdelete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_groups`
--

INSERT INTO `ecommerce_groups` (`id`, `groupname`, `params`, `isadmin`, `grouptype`, `datecreate`, `usercreate`, `userupdate`, `dateupdate`, `isdelete`) VALUES
(1, 'Root', '{\"86\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"21\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"right\":\"\",\"delete\":\"\"},\"22\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"right\":\"\",\"delete\":\"\"},\"66\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"84\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"85\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"95\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"101\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"81\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"82\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"68\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"91\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\",\"import\":\"\"},\"89\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"90\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"92\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"93\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"94\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"87\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"97\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\",\"import\":\"\"},\"98\":{\"view\":\"\",\"add\":\"\"},\"100\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\",\"upload\":\"\"},\"12\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"11\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"right\":\"\",\"delete\":\"\"}}', 1, 0, '2013-07-01 08:57:48', 'root', 'root', '2022-06-28 15:35:23', 0),
(2, 'Staff', '{\"21\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"right\":\"\",\"delete\":\"\"},\"22\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"right\":\"\",\"delete\":\"\"},\"66\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"68\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"71\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"72\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"73\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"51\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"52\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"}}', 0, 0, '2015-12-20 20:11:21', 'root', 'root', '2022-06-02 10:21:45', 1),
(3, 'Editor', '{\"86\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"21\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"right\":\"\",\"delete\":\"\"},\"22\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"right\":\"\",\"delete\":\"\"},\"66\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"84\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"85\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"81\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"82\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"89\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"68\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"90\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"91\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"92\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"93\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"94\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"95\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"87\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"12\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"},\"11\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"right\":\"\",\"delete\":\"\"}}', 0, 0, '2022-01-18 10:49:36', 'root', 'root', '2022-06-02 10:21:54', 1),
(4, 'editot', '{\"86\":{\"view\":\"\"},\"66\":{\"view\":\"\",\"add\":\"\",\"edit\":\"\",\"delete\":\"\"}}', 0, 0, '2022-08-15 14:00:36', 'root', NULL, '2022-08-15 14:00:42', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_home`
--

CREATE TABLE `ecommerce_home` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `title_vn` varchar(255) DEFAULT NULL,
  `link` varchar(150) NOT NULL,
  `label` varchar(150) NOT NULL,
  `label_vn` varchar(155) DEFAULT NULL,
  `picture` varchar(150) NOT NULL,
  `picture_mobile` varchar(100) NOT NULL,
  `json_pictures` text NOT NULL,
  `content` text NOT NULL,
  `content_vn` text DEFAULT NULL,
  `area` tinyint(4) NOT NULL DEFAULT 1,
  `is_publish` tinyint(4) NOT NULL DEFAULT 0,
  `user_create` char(50) NOT NULL,
  `time_create` datetime DEFAULT NULL,
  `user_update` char(50) NOT NULL,
  `time_update` datetime DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_home`
--

INSERT INTO `ecommerce_home` (`id`, `title`, `title_vn`, `link`, `label`, `label_vn`, `picture`, `picture_mobile`, `json_pictures`, `content`, `content_vn`, `area`, `is_publish`, `user_create`, `time_create`, `user_update`, `time_update`, `is_delete`) VALUES
(8, 'Hình ảnh slide', 'Hình ảnh slide', 'home', 'home', 'home', 'slide_home_1.jpg', 'slide_home_1.jpg', '[{\"name\":\"slide_home_3.jpg\",\"label\":\"Attack Air Max 720 Sage Low\",\"link\":\"slides1\",\"display\":1},{\"name\":\"slide_home_2.jpg\",\"label\":\"Attack Air VaporMax Flyknit 3\",\"link\":\"slides1\",\"display\":1},{\"name\":\"slide_home_1.jpg\",\"label\":\"Attack Air Monarch IV SE\",\"link\":\"slides1\",\"display\":1},{\"name\":\"banner_3.jpg\",\"label\":\"Men Collection-1\",\"link\":\"slides2\",\"display\":1},{\"name\":\"banner_2.jpg\",\"label\":\"Womens Collection-3\",\"link\":\"slides2\",\"display\":1},{\"name\":\"banner_1.jpg\",\"label\":\"Kids Collection-7\",\"link\":\"slides2\",\"display\":1}]', '<p>H&igrave;nh ảnh slide</p>', '<p>H&igrave;nh ảnh slide</p>', 2, 1, '1', '2022-06-02 14:00:54', '1', '2022-06-02 14:40:22', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_language`
--

CREATE TABLE `ecommerce_language` (
  `id` int(11) NOT NULL,
  `language` char(3) DEFAULT 'vn',
  `langpage` char(50) DEFAULT 'public',
  `keyword` char(50) DEFAULT NULL,
  `translation` varchar(250) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_language`
--

INSERT INTO `ecommerce_language` (`id`, `language`, `langpage`, `keyword`, `translation`, `isdelete`) VALUES
(1, 'vn', 'all', 'search', 'Tìm kiếm', 0),
(2, 'vn', 'all', 'refresh', 'Làm mới', 0),
(4, 'vn', 'all', 'edit', 'Sửa', 0),
(5, 'vn', 'all', 'delete', 'Xóa', 0),
(6, 'vn', 'group', 'group_name', 'Nhóm quyền', 0),
(7, 'vn', 'group', 'group_type', 'Loại quyền', 0),
(8, 'vn', 'group', 'select_group_type', 'Chọn loại quyền', 0),
(9, 'vn', 'all', 'school', 'Trường', 0),
(10, 'vn', 'all', 'select_school', 'Chọn trường', 0),
(11, 'vn', 'all', 'stt', 'STT', 0),
(12, 'vn', 'group', 'right', 'Phân quyền', 0),
(13, 'vn', 'group', 'group-empty', 'Nhóm quyền không được trống.', 0),
(14, 'vn', 'all', 'edit-fail', 'Sửa không thành công.', 0),
(15, 'us', 'group', 'group-exists', 'Group existed', 0),
(16, 'us', 'group', 'delete-group', 'Are you sure you want to delete?', 0),
(27, 'us', 'all', 'add_failed', 'Add failed', 0),
(28, 'us', 'all', 'edit_failed', 'Edited unsuccessfuly', 0),
(29, 'us', 'user', 'username', 'Username', 0),
(30, 'us', 'user', 'password', 'Password', 0),
(31, 'us', 'user', 'fullname', 'Fullname', 0),
(32, 'us', 'all', 'avatar', 'Avatar', 0),
(33, 'us', 'group', 'select_group', 'Select group', 0),
(34, 'us', 'user', 'username_empty', 'User name does not empty', 0),
(35, 'us', 'user', 'fullname_empty', 'Full name does not empty', 0),
(36, 'us', 'user', 'password_empty', 'Password does not empty', 0),
(37, 'us', 'all', 'phone-valid', 'Phone number invalid', 0),
(38, 'us', 'user', 'user_exits', 'Username existed', 0),
(39, 'us', 'all', 'email-valid', 'Email invalid', 0),
(40, 'us', 'all', 'empty', ' does not empty', 0),
(43, 'us', 'all', 'exist', 'existed', 0),
(60, 'us', 'all', 'order', 'Order', 0),
(113, 'us', 'all', 'add_success', 'Added successfully', 0),
(116, 'vn', 'all', 'edit_failed', 'Sửa thất bại', 0),
(117, 'us', 'all', 'edit_success', 'Edited successfully', 0),
(118, 'us', 'all', 'print', 'Print', 0),
(119, 'us', 'all', 'date', 'Date', 0),
(120, 'vn', 'products', 'product_name', 'Tên sản phẩm', 0),
(121, 'us', 'all', 'title', 'Title', 0),
(123, 'us', 'all', 'images', 'Image', 0),
(124, 'us', 'all', 'alias', 'Alias', 0),
(125, 'us', 'all', 'permission_denied', 'Permission denied', 0),
(126, 'vn', 'all', 'error_unknow', 'Lỗi không xác đinh. Liên hệ nhà phát triển để sửa.', 0),
(127, 'us', 'all', 'error_unknow', 'Unknow error. Please contact developer to fix.', 0),
(128, 'us', 'products', 'product_exist', 'Product existed', 0),
(129, 'us', 'all', 'error_select_empty', 'You need select at least only object', 0),
(130, 'us', 'all', 'back', 'Back', 0),
(131, 'us', 'all', 'delete_confirm', 'Are you sure you want to delete?', 0),
(132, 'us', 'all', 'content', 'Content', 0),
(133, 'us', 'all', 'priority', 'Priority', 0),
(134, 'us', 'all', 'summary', 'Summary', 0),
(137, 'us', 'all', 'save', 'Save', 0),
(138, 'us', 'products', 'product_name', 'Product name', 0),
(139, 'us', 'all', 'company', 'Company', 0),
(140, 'us', 'all', 'email', 'Email', 0),
(141, 'us', 'all', 'phone', 'Phone', 0),
(142, 'us', 'all', 'type', 'Type', 0),
(143, 'us', 'contact', 'reply', 'Reply', 0),
(145, 'us', 'all', 'content_empty', 'Content does not empty', 0),
(146, 'us', 'all', 'send_error', 'Send error', 0),
(147, 'us', 'contact', 'replied', 'Replied', 0),
(150, 'us', 'profile', 'current_pass', 'Current password', 0),
(151, 'us', 'profile', 'new_pass', 'New password', 0),
(152, 'us', 'profile', 'new_pass_confirm', 'Confirm new password', 0),
(153, 'us', 'profile', 'wrong_pass', 'Wrong pass', 0),
(158, 'us', 'all', 'images_large', 'Large image', 0),
(161, 'us', 'all', 'get_image_size_error', 'Can not get image size', 0),
(162, 'us', 'all', 'image_size_error', 'Size of image should be', 0),
(163, 'us', 'all', 'image_large_size_error', 'Size of large image should be', 0),
(164, 'us', 'all', 'search', 'Search', 0),
(165, 'us', 'all', 'refresh', 'Refresh', 0),
(167, 'us', 'all', 'edit', 'Edit', 0),
(168, 'us', 'all', 'delete', 'Delete', 0),
(169, 'us', 'group', 'group_name', 'Group name', 0),
(170, 'us', 'group', 'group_type', 'Group type', 0),
(171, 'us', 'group', 'select_group_type', 'Select group type', 0),
(172, 'us', 'all', 'school', 'Field', 0),
(173, 'us', 'all', 'select_school', 'Select field', 0),
(174, 'us', 'group', 'right', 'Permission', 0),
(175, 'us', 'group', 'group-empty', 'Group does not empty', 0),
(176, 'us', 'all', 'edit-fail', 'Edit fail', 0),
(177, 'us', 'all', 'stt', 'No.', 0),
(178, 'vn', 'all', 'images_large', 'Hình ảnh lớn', 0),
(179, 'vn', 'all', 'get_image_size_error', 'Không thể lấy kích cỡ của hình', 0),
(180, 'vn', 'all', 'image_size_error', 'Kích thước hình ảnh phải là', 0),
(181, 'vn', 'all', 'image_large_size_error', 'Kích thước hình ảnh lớn phải là', 0),
(182, 'us', 'all', 'text_align', 'Text align', 0),
(183, 'us', 'all', 'publish', 'Publish', 0),
(184, 'us', 'menu', 'quan-tri', 'Admin', 0),
(185, 'vn', 'menu', 'quan-tri', 'Quản trị', 0),
(186, 'us', 'menu', 'trang-chu', 'Home', 0),
(187, 'vn', 'menu', 'trang-chu', 'Trang chủ', 0),
(190, 'us', 'menu', 'cong-ty', 'Company', 0),
(191, 'vn', 'menu', 'cong-ty', 'Công ty', 0),
(192, 'us', 'menu', 'lien-he', 'Contact US', 0),
(193, 'vn', 'menu', 'lien-he', 'Liên hệ', 0),
(194, 'us', 'menu', 'tro-giup', 'Help', 0),
(195, 'vn', 'menu', 'tro-giup', 'Trợ giúp', 0),
(196, 'us', 'menu', 'nhom-quyen', 'Groups Permission', 0),
(197, 'vn', 'menu', 'nhom-quyen', 'Nhóm quyền', 0),
(198, 'us', 'menu', 'nguoi-dung', 'Users', 0),
(199, 'vn', 'menu', 'nguoi-dung', 'Người dùng', 0),
(210, 'us', 'menu', 'danh-sach-lien-he', 'Contact List', 0),
(211, 'vn', 'menu', 'danh-sach-lien-he', 'Danh sách liên hệ', 0),
(212, 'us', 'menu', 'thong-tin-lien-he', 'Contact Information', 0),
(213, 'vn', 'menu', 'thong-tin-lien-he', 'Thông tin liên hệ', 0),
(214, 'us', 'menu', 'tai-lieu', 'Documents', 0),
(215, 'vn', 'menu', 'tai-lieu', 'Tài liệu', 0),
(220, 'us', 'menu', 'news', 'News', 0),
(221, 'vn', 'menu', 'news', 'Tin tức', 0),
(222, 'us', 'menu', 'san-pham', 'Products', 0),
(223, 'vn', 'menu', 'san-pham', 'Sản phẩm', 0),
(224, 'vn', 'user', 'username', 'Tên tài khoản', 0),
(225, 'vn', 'user', 'password', 'Mật khẩu', 0),
(226, 'vn', 'user', 'fullname', 'Họ và tên', 0),
(227, 'vn', 'user', 'username_empty', 'Tài khoản không được bỏ trống', 0),
(228, 'vn', 'user', 'fullname_empty', 'Họ và tên không được bỏ trống', 0),
(229, 'vn', 'user', 'password_empty', 'Mật khẩu không được bỏ trống', 0),
(230, 'vn', 'user', 'user_exits', 'Tài khoản đã tồn tại', 0),
(231, 'vn', 'all', 'phone', 'Điện thoại', 0),
(232, 'us', 'all', 'tim-thay', 'Found', 0),
(233, 'vn', 'all', 'tim-thay', 'Tìm thấy', 0),
(234, 'us', 'all', 'ket-qua', 'results', 0),
(235, 'vn', 'all', 'ket-qua', 'kết quả', 0),
(236, 'vn', 'all', 'email', 'Email', 0),
(237, 'vn', 'all', 'email-valid', 'Email không hợp lệ', 0),
(238, 'vn', 'all', 'avatar', 'Ảnh đại diện', 0),
(239, 'us', 'all', 'chon-file', 'Choose file', 0),
(240, 'vn', 'all', 'chon-file', 'Chọn file', 0),
(241, 'vn', 'all', 'phone-valid', 'Số điện thoại không hợp lệ', 0),
(242, 'vn', 'all', 'add_failed', 'Thêm mới không thành công', 0),
(243, 'us', 'all', 'chon-nguoi-dung', 'Please choose at least one user', 0),
(244, 'vn', 'all', 'chon-nguoi-dung', 'Vui lòng chọn 1 người dùng', 0),
(245, 'vn', 'all', 'delete_confirm', 'Bạn có chắc chắn muốn xóa?', 0),
(246, 'us', 'all', 'xoa-khong-thanh-cong', 'Delete unsuccessfuly', 0),
(247, 'vn', 'all', 'xoa-khong-thanh-cong', 'Xóa không thành công', 0),
(248, 'vn', 'all', 'save', 'Lưu', 0),
(251, 'vn', 'all', 'title', 'Tiêu đề', 0),
(252, 'us', 'all', 'solution', 'Solution', 0),
(253, 'vn', 'all', 'solution', 'Phương thức', 0),
(254, 'us', 'all', 'vui-long-chon', '-- Please chosse --', 0),
(255, 'vn', 'all', 'vui-long-chon', '-- Vui lòng chọn --', 0),
(256, 'vn', 'all', 'error_select_empty', 'Bạn cần chọn ít nhất một đối tượng', 0),
(257, 'us', 'all', 'save_error', 'Saved unsuccessfully', 0),
(258, 'vn', 'all', 'save_error', 'Lưu không thành công', 0),
(259, 'us', 'all', 'label', 'Label', 0),
(260, 'vn', 'all', 'label', 'Nhãn', 0),
(261, 'us', 'all', 'content', 'Content', 0),
(262, 'vn', 'all', 'content', 'Nội dung', 0),
(264, 'vn', 'all', 'publish', 'Công khai', 0),
(265, 'us', 'all', 'images', 'Images', 0),
(266, 'vn', 'all', 'images', 'Hình ảnh', 0),
(268, 'vn', 'all', 'type', 'Loại', 0),
(269, 'us', 'all', 'config-information', 'Config information', 0),
(270, 'vn', 'all', 'config-information', 'Thông tin cấu hình', 0),
(271, 'us', 'all', 'btn_home', 'Button Home', 0),
(272, 'vn', 'all', 'btn_home', 'Nút trang chủ', 0),
(273, 'us', 'all', 'btn_greystonevn', 'Button Greystonevn', 0),
(274, 'vn', 'all', 'btn_greystonevn', 'Nút Greystonevn', 0),
(275, 'us', 'all', 'btn_solution', 'Button Solution', 0),
(276, 'vn', 'all', 'btn_solution', 'Nút phương thức', 0),
(277, 'us', 'all', 'btn_detail', 'Button Detail', 0),
(278, 'vn', 'all', 'btn_detail', 'Nút chi tiết', 0),
(279, 'us', 'all', 'btn_company', 'Button company', 0),
(280, 'vn', 'all', 'btn_company', 'Nút công ty', 0),
(281, 'us', 'all', 'view-number', 'View number', 0),
(282, 'vn', 'all', 'view-number', 'Xem số', 0),
(283, 'vn', 'all', 'date', 'Ngày', 0),
(284, 'us', 'all', 'popular', 'Popular', 0),
(285, 'vn', 'all', 'popular', 'Phổ biến', 0),
(286, 'us', 'all', 'show', 'Show', 0),
(287, 'vn', 'all', 'show', 'Hiển thị', 0),
(288, 'us', 'all', 'image-popular', 'Image popular', 0),
(289, 'vn', 'all', 'image-popular', 'Hình ảnh phố biến', 0),
(290, 'us', 'all', 'permision_denied', 'Permision denied', 0),
(291, 'vn', 'all', 'permision_denied', 'Quyền của bạn bị giới hạn', 0),
(292, 'us', 'all', 'author', 'Author', 0),
(293, 'vn', 'all', 'author', 'Tác giả', 0),
(294, 'us', 'all', 'enable', 'Enable', 0),
(295, 'vn', 'all', 'enable', 'Cho phép', 0),
(296, 'us', 'all', 'disable', 'Disable', 0),
(297, 'vn', 'all', 'disable', 'Không cho phép', 0),
(298, 'us', 'all', 'background-img', 'Background img', 0),
(299, 'vn', 'all', 'background-img', 'Hình nền', 0),
(300, 'us', 'all', 'select-images', 'Select Images', 0),
(301, 'vn', 'all', 'select-images', 'Chọn hình ảnh', 0),
(302, 'us', 'all', 'upload-images', 'Upload Images', 0),
(303, 'vn', 'all', 'upload-images', 'Tải hình ảnh', 0),
(304, 'us', 'all', 'picture', 'Picture', 0),
(305, 'vn', 'all', 'picture', 'Hình ảnh', 0),
(306, 'us', 'all', 'link', 'Link', 0),
(307, 'vn', 'all', 'link', 'Đường dẫn', 0),
(308, 'us', 'all', 'function', 'Fuction', 0),
(309, 'vn', 'all', 'function', 'Chức năng', 0),
(310, 'vn', 'all', 'back', 'Quay lại', 0),
(311, 'us', 'all', 'title-is-not-empty', 'Title is not empty', 0),
(312, 'vn', 'all', 'title-is-not-empty', 'Tiêu đề không được bỏ trống', 0),
(313, 'us', 'all', 'picture-not-empty-or-size-not-incorrect', 'The picture has not been selected or size mismatch (1340x1006)', 0),
(314, 'vn', 'all', 'picture-not-empty-or-size-not-incorrect', 'Hình ảnh chưa được chọn hoặc kích thước không khớp (1340x1006)', 0),
(315, 'us', 'all', 'content-not-empty', 'Content is not empty', 0),
(316, 'vn', 'all', 'content-not-empty', 'Nội dung không được bỏ trống', 0),
(317, 'us', 'all', 'item_exist', 'Item Exist', 0),
(318, 'vn', 'all', 'item_exist', 'Thư mục đã tồn tại', 0),
(320, 'vn', 'products', 'product_exist', 'Sản phẩm đã tồn tại', 0),
(321, 'us', 'all', 'remove', 'Remove', 0),
(322, 'vn', 'all', 'remove', 'Xóa', 0),
(323, 'vn', 'all', 'order', 'Thứ tự', 0),
(324, 'vn', 'all', 'text_align', 'Canh chỉnh', 0),
(325, 'us', 'all', 'icon', 'Icon', 0),
(326, 'vn', 'all', 'icon', 'Biểu tượng', 0),
(327, 'us', 'all', 'color-text', 'Color text', 0),
(328, 'vn', 'all', 'color-text', 'Màu chữ', 0),
(329, 'us', 'all', 'text', 'Text', 0),
(330, 'vn', 'all', 'text', 'Văn bản', 0),
(331, 'us', 'all', 'background-mobile', 'Background Mobile', 0),
(332, 'vn', 'all', 'background-mobile', 'Hình nền điện thoại', 0),
(333, 'us', 'all', 'link-not-empty', 'Link is not empty', 0),
(334, 'vn', 'all', 'link-not-empty', 'Đường dẫn không được trống', 0),
(335, 'us', 'all', 'label-not-empty', 'Label is not empty', 0),
(336, 'vn', 'all', 'label-not-empty', 'Nhãn không được trống', 0),
(337, 'us', 'all', 'icon-not-empty', 'Icon is not empty', 0),
(338, 'vn', 'all', 'icon-not-empty', 'Biểu tượng không được trống', 0),
(339, 'us', 'all', 'color-not-empty', 'Color is not empty', 0),
(340, 'vn', 'all', 'color-not-empty', 'Màu không được trống', 0),
(341, 'us', 'all', 'content-not-empty', 'Content is not empty', 0),
(342, 'vn', 'all', 'content-not-empty', 'Nội dung không được trống', 0),
(343, 'us', 'all', 'list-image-not-empty', 'List image is not empty', 0),
(344, 'vn', 'all', 'list-image-not-empty', 'Danh sách hình ảnh không được trống', 0),
(345, 'us', 'all', 'left', 'Left', 0),
(346, 'vn', 'all', 'left', 'Trái', 0),
(347, 'us', 'all', 'right', 'Right', 0),
(348, 'vn', 'all', 'right', 'Phải', 0),
(349, 'us', 'all', 'center', 'Center', 0),
(350, 'vn', 'all', 'center', 'Chính giữa', 0),
(351, 'us', 'all', 'single-picture', 'Single Picture', 0),
(352, 'vn', 'all', 'single-picture', 'Ảnh đơn', 0),
(353, 'us', 'all', 'multi-picture', 'Multi picture', 0),
(354, 'vn', 'all', 'multi-picture', 'Nhiều hình ảnh', 0),
(355, 'us', 'all', 'slide', 'Slide', 0),
(356, 'vn', 'all', 'slide', 'Trình chiếu', 0),
(357, 'us', 'all', 'top', 'Top', 0),
(358, 'vn', 'all', 'top', 'Phái trên', 0),
(359, 'us', 'all', 'align-picture', 'Align picture', 0),
(360, 'vn', 'all', 'align-picture', 'Canh chỉnh hình', 0),
(361, 'us', 'all', 'certificate-footer', 'Certificate footer', 0),
(362, 'vn', 'all', 'certificate-footer', 'Chứng nhận chân trang', 0),
(363, 'us', 'all', 'no', 'No', 0),
(364, 'vn', 'all', 'no', 'Không đồng ý', 0),
(365, 'us', 'all', 'yes', 'Yes', 0),
(366, 'vn', 'all', 'yes', 'Đồng ý', 0),
(367, 'us', 'all', 'title-picture', 'Title picture', 0),
(368, 'vn', 'all', 'title-picture', 'Tiêu đề hình ảnh', 0),
(369, 'us', 'all', 'text-picture', 'Text picture', 0),
(370, 'vn', 'all', 'text-picture', 'Văn bản hình ảnh', 0),
(371, 'us', 'all', 'solution-not-selected', 'Solution is not selected', 0),
(372, 'vn', 'all', 'solution-not-selected', 'Giải pháp không được chọn', 0),
(373, 'us', 'all', 'author-not-empty', 'Author is not empty', 0),
(374, 'vn', 'all', 'author-not-empty', 'Tác giả không được để trống', 0),
(375, 'vn', 'all', 'Top-Left', 'Phía trên-Bên trái', 0),
(376, 'vn', 'all', 'Top-Right', 'Phía trên-Bên phải', 0),
(377, 'vn', 'all', 'Top-Center', 'Phía trên-Chính giữa', 0),
(378, 'vn', 'all', 'Bottom-Left', 'Phía dưới-Bên trái', 0),
(379, 'vn', 'all', 'Bottom-Right', 'Phía dưới-Bên phải', 0),
(380, 'vn', 'all', 'Bottom-Center', 'Phía dưới-Chính giữa', 0),
(381, 'vn', 'all', 'Center-Left', 'Chính giữa-Bên trái', 0),
(382, 'vn', 'all', 'Center-Right', 'Chính giữa-Bên phải', 0),
(383, 'vn', 'all', 'Center-Center', 'Chính giữa- Chính giữa', 0),
(384, 'us', 'all', 'Top-Left', 'Top-Left', 0),
(385, 'us', 'all', 'Top-Right', 'Top-Right', 0),
(386, 'us', 'all', 'Top-Center', 'Top-Center', 0),
(387, 'us', 'all', 'Bottom-Left', 'Bottom-Left', 0),
(388, 'us', 'all', 'Bottom-Right', 'Bottom-Right', 0),
(389, 'us', 'all', 'Bottom-Center', 'Bottom-Center', 0),
(390, 'us', 'all', 'Center-Left', 'Center-Left', 0),
(391, 'us', 'all', 'Center-Right', 'Center-Right', 0),
(392, 'us', 'all', 'Center-Center', 'Center-Center', 0),
(393, 'us', 'all', 'file-features', 'File features', 0),
(394, 'vn', 'all', 'file-features', 'Tính năng của file', 0),
(398, 'us', 'all', 'parent', 'Parent', 0),
(399, 'vn', 'all', 'parent', 'Thư mục cha', 0),
(402, 'us', 'menu', 'thanh-vien', 'Member', 0),
(403, 'vn', 'menu', 'thanh-vien', 'Thành viên', 0),
(404, 'us', 'menu', 've-chung-toi', 'About Us', 0),
(405, 'vn', 'menu', 've-chung-toi', 'Về chúng tôi', 0),
(406, 'us', 'all', 'luu-thanh-cong', 'Saved successfully', 0),
(408, 'us', 'all', 'learn-more', 'Lern more', 0),
(409, 'vn', 'all', 'learn-more', 'Đọc thêm', 0),
(410, 'vn', 'profile', 'current_pass', 'Mật khẩu hiện tại', 0),
(411, 'vn', 'profile', 'new_pass', 'Mật khẩu mới', 0),
(412, 'vn', 'profile', 'new_pass_confirm', 'Nhập lại mật khẩu mới', 0),
(413, 'us', 'all', 'my-profile', 'My Profile', 0),
(414, 'vn', 'all', 'my-profile', 'Thông tin của tôi', 0),
(415, 'us', 'all', 'log-out', 'Log out', 0),
(416, 'vn', 'all', 'log-out', 'Thoát', 0),
(417, 'us', 'menu', 'home_image', 'Home Image', 0),
(418, 'vn', 'menu', 'home_image', 'Hình ảnh trang chủ', 0),
(419, 'us', 'menu', 'home_public', 'Home public', 0),
(420, 'vn', 'menu', 'home_public', 'Thông tin trang chủ', 0),
(422, 'us', 'all', 'address', 'Address', 0),
(423, 'vn', 'all', 'address', 'Địa chỉ', 0),
(424, 'us', 'all', 'city', 'City', 0),
(425, 'vn', 'all', 'city', 'Thành phố', 0),
(426, 'us', 'all', 'state', 'State', 0),
(427, 'vn', 'all', 'state', 'Tiểu bang', 0),
(428, 'us', 'all', 'zip-code', 'Zip code', 0),
(429, 'vn', 'all', 'zip-code', 'Mã bưu điện', 0),
(430, 'us', 'all', 'country', 'Country', 0),
(431, 'vn', 'all', 'country', 'Quốc gia', 0),
(432, 'us', 'all', 'email-support', 'Email support', 0),
(433, 'vn', 'all', 'email-support', 'Email hổ trợ', 0),
(434, 'us', 'all', 'email-sales', 'Email sales', 0),
(435, 'vn', 'all', 'email-sales', 'Email bán hàng', 0),
(436, 'us', 'all', 'phone-support', 'Phone support', 0),
(437, 'vn', 'all', 'phone-support', 'Điện thoại hổ trợ', 0),
(438, 'us', 'all', 'phone-sales', 'Phone sales', 0),
(439, 'vn', 'all', 'phone-sales', 'Điện thoại bán hàng', 0),
(440, 'us', 'all', 'full-name', 'Full name', 0),
(441, 'vn', 'all', 'full-name', 'Họ và tên', 0),
(442, 'vn', 'all', 'company', 'Công ty', 0),
(443, 'us', 'all', 'your-message', 'Your message', 0),
(444, 'vn', 'all', 'your-message', 'Tin nhắn của bạn', 0),
(445, 'us', 'all', 'send-message', 'Send Message', 0),
(446, 'vn', 'all', 'send-message', 'Gửi tin nhắn', 0),
(447, 'us', 'all', 'technology', 'Technology', 0),
(448, 'vn', 'all', 'technology', 'Công nghệ', 0),
(449, 'vn', 'all', 'luu-thanh-cong', 'Lưu thành công', 0),
(450, 'vn', 'all', 'summary', 'Tóm tắt', 0),
(451, 'us', 'all', 'summary-not-empty', 'Summary is not empty', 0),
(452, 'vn', 'all', 'summary-not-empty', 'Tóm tắt không được để trống', 0),
(453, 'us', 'public', 'search-over', 'Search over 10.000 products', 0),
(454, 'vn', 'public', 'search-over', 'Tìm kiếm hơn 10.000 sản phẩm', 0),
(455, 'us', 'public', 'need-help', 'Need Help?', 0),
(456, 'vn', 'public', 'need-help', 'Cần giúp đỡ', 0),
(457, 'us', 'public', 'top-selling', 'Top Selling', 0),
(458, 'vn', 'public', 'top-selling', 'Bán chạy nhất', 0),
(459, 'us', 'public', 'products', 'Product', 0),
(460, 'vn', 'public', 'products', 'Sản phẩm', 0),
(461, 'us', 'public', 'featured', 'Featured', 0),
(462, 'vn', 'public', 'featured', 'Nổi bật', 0),
(463, 'us', 'public', 'latest-news', 'Latest News', 0),
(464, 'vn', 'public', 'latest-news', 'Tin mới nhất', 0),
(465, 'us', 'public', 'keep-contact', 'Keep Contact', 0),
(466, 'vn', 'public', 'keep-contact', 'Nhận thông báo', 0),
(467, 'us', 'public', 'follow-us', 'Follow Us', 0),
(468, 'vn', 'public', 'follow-us', 'Theo dõi chúng tội', 0),
(469, 'us', 'public', 'terms-conditions', 'Accept Terms and conditions', 0),
(470, 'vn', 'public', 'terms-conditions', 'Chấp nhận các điều khoản và điều kiện', 0),
(471, 'us', 'public', 'sologan-product', 'Just Do It', 0),
(472, 'vn', 'public', 'sologan-product', 'Hãy thực hiện', 0),
(473, 'us', 'public', 'list-of-product', 'List of product', 0),
(474, 'vn', 'public', 'list-of-product', 'Danh sách sản phẩm', 0),
(475, 'us', 'public', 'sort-by-newness', 'Sort by newness', 0),
(476, 'vn', 'public', 'sort-by-newness', 'Sắp xếp theo mới nhất', 0),
(477, 'us', 'public', 'sort-by-popularity', 'Sort by popularity', 0),
(478, 'vn', 'public', 'sort-by-popularity', 'Sắp xếp theo mức độ phổ biến', 0),
(479, 'us', 'public', 'sort-by-average-rating', 'Sort by average rating', 0),
(480, 'vn', 'public', 'sort-by-average-rating', 'Sắp xếp theo xếp hạng', 0),
(481, 'us', 'public', 'sort-by-price-asc', 'Sort by price: low to high', 0),
(482, 'vn', 'public', 'sort-by-price-asc', 'Sắp xếp theo gia từ thấp tới cao', 0),
(483, 'us', 'public', 'sort-by-price-desc', 'Sort by price: high to low', 0),
(484, 'vn', 'public', 'sort-by-price-desc', 'Sắp xếp theo gia từ cao tới thấp', 0),
(485, 'us', 'public', 'filter', 'Filter', 0),
(486, 'vn', 'public', 'filter', 'Lọc', 0),
(487, 'us', 'public', 'reset', 'Reset', 0),
(488, 'vn', 'public', 'reset', 'Làm mới', 0),
(489, 'us', 'public', 'latest-post', 'Latest Post', 0),
(490, 'vn', 'public', 'latest-post', 'Bài đăng mới nhất', 0),
(491, 'us', 'public', 'popular-tags', 'Popular Tags', 0),
(492, 'vn', 'public', 'popular-tags', 'Thẻ phổ biến', 0),
(493, 'us', 'public', 'categories', 'Categories', 0),
(494, 'vn', 'public', 'categories', 'Thể loại', 0),
(495, 'us', 'public', 'your-email', 'Your email', 0),
(496, 'vn', 'public', 'your-email', 'Email của bạn', 0),
(497, 'us', 'public', 'drop-us', 'Drop Us a Line', 0),
(498, 'vn', 'public', 'drop-us', 'Gửi cho chúng tôi', 0),
(499, 'us', 'public', 'name', 'Name', 0),
(500, 'vn', 'public', 'name', 'Tên', 0),
(501, 'us', 'public', 'message', 'Message', 0),
(502, 'vn', 'public', 'message', 'Tin nhắn', 0),
(503, 'us', 'public', 'help-center', 'Help Center', 0),
(504, 'vn', 'public', 'help-center', 'Trung tâm trợ giúp', 0),
(505, 'us', 'public', 'orders', 'Orders', 0),
(506, 'vn', 'public', 'orders', 'Thông tin bán hàng', 0),
(507, 'us', 'public', 'showroom', 'Showroom', 0),
(508, 'vn', 'public', 'showroom', 'Cửa hàng', 0),
(509, 'us', 'public', 'send', 'Send', 0),
(510, 'vn', 'public', 'send', 'Gửi', 0),
(511, 'us', 'public', 'color', 'Color', 0),
(512, 'vn', 'public', 'color', 'Màu sắc', 0),
(513, 'us', 'public', 'size', 'Size', 0),
(514, 'vn', 'public', 'size', 'Kích thước', 0),
(515, 'us', 'public', 'quantity', 'Quantity', 0),
(516, 'vn', 'public', 'quantity', 'Số lượng', 0),
(517, 'us', 'public', 'add-cart', 'Add to Cart', 0),
(518, 'vn', 'public', 'add-cart', 'Thêm vào giỏ hàng', 0),
(519, 'us', 'public', 'add-wishlist', 'Add to Wishlist', 0),
(520, 'vn', 'public', 'add-wishlist', 'Thêm vào danh sách yêu thích', 0),
(521, 'us', 'public', 'related', 'Related', 0),
(522, 'vn', 'public', 'related', 'Sản phẩm liên quan', 0),
(525, 'us', 'public', 'reviews', 'Reviews', 0),
(526, 'vn', 'public', 'reviews', 'Đánh giá', 0),
(527, 'us', 'public', 'free-shipping', 'Free Shipping', 0),
(528, 'vn', 'public', 'free-shipping', 'Miễn phí vận chuyển', 0),
(529, 'us', 'public', 'secure-payment', 'Secure Payment', 0),
(530, 'vn', 'public', 'secure-payment', 'Thanh toán an toàn', 0),
(531, 'us', 'public', '24-7-support', '24/7 Support', 0),
(532, 'vn', 'public', '24-7-support', 'Hỗ trợ 24/7', 0),
(533, 'us', 'public', 'for-all-oders', 'For all oders over', 0),
(534, 'vn', 'public', 'for-all-oders', 'Dành cho tất cả những người đi trên', 0),
(535, 'us', 'public', '100-secure-payment', '100% secure payment', 0),
(536, 'vn', 'public', '100-secure-payment', '100% Thanh tóan an toàn', 0),
(537, 'us', 'public', 'online-top-support', 'Online top support', 0),
(538, 'vn', 'public', 'online-top-support', 'Hỗ trợ trực tuyến hàng đầu', 0),
(539, 'us', 'public', 'sign-in-up', 'Sign In or Sign Up', 0),
(540, 'vn', 'public', 'sign-in-up', 'Đăng ký hoặc đăng nhập', 0),
(541, 'us', 'public', 'help-faq', 'Help and Faq', 0),
(542, 'vn', 'public', 'help-faq', 'Hỗ trợ và câu hỏi thường gặp', 0),
(543, 'us', 'public', 'shipping', 'Shipping', 0),
(544, 'vn', 'public', 'shipping', 'Vận chuyển', 0),
(545, 'us', 'public', 'cancellation', 'Cancellation', 0),
(546, 'vn', 'public', 'cancellation', 'Hủy', 0),
(547, 'us', 'public', 'popular-articles', 'Popular articles', 0),
(548, 'vn', 'public', 'popular-articles', 'Các bài viết phổ biến', 0),
(549, 'us', 'public', 'sign-in-create-account', 'Sign In or Create an Account', 0),
(550, 'vn', 'public', 'sign-in-create-account', 'Đăng nhập hoặc tạo một tài khoản', 0),
(551, 'us', 'public', 'remember-me', 'Remember me', 0),
(552, 'vn', 'public', 'remember-me', 'Ghi nhớ tôi trên thiết bị này', 0),
(553, 'us', 'public', 'verification-codes', 'Verification codes', 0),
(554, 'vn', 'public', 'verification-codes', 'Mã xác thực', 0),
(555, 'us', 'public', 'or', 'Or', 0),
(556, 'vn', 'public', 'or', 'Hoặc', 0),
(557, 'us', 'public', 'log-in', 'Log In', 0),
(558, 'vn', 'public', 'log-in', 'Đăng nhập', 0),
(559, 'us', 'public', 'already-client', 'Already Client', 0),
(560, 'vn', 'public', 'already-client', 'Đã là khách hàng', 0),
(561, 'us', 'public', 'new-client', 'New Client', 0),
(562, 'vn', 'public', 'new-client', 'Khách hàng mới', 0),
(563, 'us', 'public', 'required-fields', 'Required Fields', 0),
(564, 'vn', 'public', 'required-fields', 'Thông tin bắt buộc', 0),
(565, 'us', 'public', 'register', 'Register', 0),
(566, 'vn', 'public', 'register', 'Đăng ký', 0),
(567, 'us', 'public', 'track-order', 'Track your Order', 0),
(568, 'vn', 'public', 'track-order', 'Theo dõi đơn hàng của bạn', 0),
(569, 'us', 'public', 'my-order', 'My Orders', 0),
(570, 'vn', 'public', 'my-order', 'Đơn hàng của tôi', 0),
(571, 'us', 'public', 'logout', 'Log out', 0),
(572, 'vn', 'public', 'logout', 'Đăng xuất', 0),
(575, 'us', 'public', 'list-product-compare', 'List product compare', 0),
(576, 'vn', 'public', 'list-product-compare', 'Danh sách sản phẩm so sánh', 0),
(577, 'us', 'public', 'product-info', 'Product Info', 0),
(578, 'vn', 'public', 'product-info', 'Thông tin sản phẩm', 0),
(579, 'us', 'public', 'discount', 'Discount', 0),
(580, 'vn', 'public', 'discount', 'Giảm giá', 0),
(581, 'us', 'public', 'price', 'Price', 0),
(582, 'vn', 'public', 'price', 'Giá', 0),
(583, 'us', 'public', 'availability', 'Availability', 0),
(584, 'vn', 'public', 'availability', 'Tồn kho', 0),
(585, 'us', 'public', 'in-stock', 'In stock', 0),
(586, 'vn', 'public', 'in-stock', 'Trong kho', 0),
(587, 'us', 'public', 'weight', 'Weight', 0),
(588, 'vn', 'public', 'weight', 'Cân nặng', 0),
(589, 'us', 'public', 'brand', 'Brand', 0),
(590, 'vn', 'public', 'brand', 'Nhãn hiệu', 0),
(591, 'us', 'public', 'remove', 'Remove', 0),
(592, 'vn', 'public', 'remove', 'Xóa', 0),
(593, 'us', 'public', 'total', 'Total', 0),
(594, 'vn', 'public', 'total', 'Tổng', 0),
(595, 'us', 'public', 'view-cart', 'View cart', 0),
(596, 'vn', 'public', 'view-cart', 'Xem giỏ hàng', 0),
(597, 'us', 'public', 'checkout', 'Checkout', 0),
(598, 'vn', 'public', 'checkout', 'Thanh toán', 0),
(599, 'us', 'public', 'update-cart', 'Update Cart', 0),
(600, 'vn', 'public', 'update-cart', 'Cập nhật giỏ hàng', 0),
(601, 'us', 'public', 'subtotal', 'Subtotal', 0),
(602, 'vn', 'public', 'subtotal', 'Tổng tiền thanh toán', 0),
(603, 'us', 'public', 'proceed-checkout', 'Proceed to Checkout', 0),
(604, 'vn', 'public', 'proceed-checkout', 'Tiến hành kiểm tra', 0),
(605, 'us', 'public', 'user-info-address', 'User Info and Billing address', 0),
(606, 'vn', 'public', 'user-info-address', 'Thông tin người dùng và địa chỉ thanh toán', 0),
(607, 'us', 'public', 'payment-shipping', 'Payment and Shipping', 0),
(608, 'vn', 'public', 'payment-shipping', 'Thanh toán và Vận chuyển', 0),
(609, 'us', 'public', 'order-summary', 'Order Summary', 0),
(610, 'vn', 'public', 'order-summary', 'Tóm tắt đơn hàng', 0),
(611, 'us', 'public', 'register-newsletter', 'Register to the Newsletter', 0),
(612, 'vn', 'public', 'register-newsletter', 'Đăng ký nhận tin mới', 0),
(613, 'us', 'public', 'confirm-pay', 'Confirm and Pay', 0),
(614, 'vn', 'public', 'confirm-pay', 'Xác nhận và thanh toán', 0),
(615, 'us', 'public', 'order-completed', 'Order completed', 0),
(616, 'vn', 'public', 'order-completed', 'Thanh toán thành công', 0),
(617, 'us', 'public', 'receive-confirmation-email', 'You will receive a confirmation email soon', 0),
(618, 'vn', 'public', 'receive-confirmation-email', 'Bạn sẽ nhận được một email xác nhận', 0),
(619, 'us', 'public', 'apply-coupon', 'Apply Coupon', 0),
(620, 'vn', 'public', 'apply-coupon', 'Áp dụng phiếu giảm giá', 0),
(621, 'us', 'public', 'promo-code', 'Promo code', 0),
(622, 'vn', 'public', 'promo-code', 'Mã khuyến mãi', 0),
(623, 'us', 'public', 'my-profile', 'My Profile', 0),
(624, 'vn', 'public', 'my-profile', 'Thông tin của tôi', 0),
(625, 'us', 'public', 'update', 'Update', 0),
(626, 'vn', 'public', 'update', 'Cập nhật', 0),
(627, 'us', 'public', 'shop-now', 'Shop Now', 0),
(628, 'vn', 'public', 'shop-now', 'Mua sắm', 0),
(629, 'us', 'public', 'add-compare', 'Add to compare', 0),
(630, 'vn', 'public', 'add-compare', 'Thêm vào để so sánh', 0),
(631, 'us', 'public', 'add-favorites', 'Add to favorites', 0),
(632, 'vn', 'public', 'add-favorites', 'Thêm vào mục yêu thích', 0),
(633, 'us', 'public', 'by', 'by', 0),
(634, 'vn', 'public', 'by', 'bởi', 0),
(635, 'us', 'public', 'search', 'Search', 0),
(636, 'vn', 'public', 'search', 'Tìm kiếm', 0),
(637, 'us', 'public', 'account', 'Account', 0),
(638, 'vn', 'public', 'account', 'Tài khoản', 0),
(639, 'us', 'public', 'compare', 'Compare', 0),
(640, 'vn', 'public', 'compare', 'So sánh', 0),
(641, 'us', 'public', 'wishlist', 'Wishlist', 0),
(642, 'vn', 'public', 'wishlist', 'Danh sách yêu thích', 0),
(643, 'us', 'public', 'shipping-method', 'Shipping Method', 0),
(644, 'vn', 'public', 'shipping-method', 'Phương thức vận chuyển', 0),
(645, 'us', 'public', 'cash-delivery', 'Cash on delivery', 0),
(646, 'vn', 'public', 'cash-delivery', 'Thanh toán khi giao hàng', 0),
(647, 'us', 'public', 'login-on', 'Login on', 0),
(648, 'vn', 'public', 'login-on', 'Đăng nhập bằng', 0),
(649, 'us', 'public', 'last-name', 'Last Name', 0),
(650, 'vn', 'public', 'last-name', 'Họ', 0),
(651, 'us', 'public', 'telephone', 'Telephone', 0),
(652, 'vn', 'public', 'telephone', 'Số điện thoại', 0),
(653, 'us', 'public', 'standard-shipping', 'Standard shipping', 0),
(654, 'vn', 'public', 'standard-shipping', 'Vận chuyển tiêu chuẩn', 0),
(655, 'us', 'public', 'express-shipping', 'Express shipping', 0),
(656, 'vn', 'public', 'express-shipping', 'Vận chuyển nhanh', 0),
(657, 'us', 'public', 'comments', 'Comments', 0),
(658, 'vn', 'public', 'comments', 'Bình luận', 0),
(659, 'us', 'public', 'read-more', 'Read More', 0),
(660, 'vn', 'public', 'read-more', 'Xem thêm', 0),
(661, 'us', 'public', 'leave-comment', 'Leave a comment', 0),
(662, 'vn', 'public', 'leave-comment', 'Để lại bình luận', 0),
(663, 'us', 'public', 'submit-comment', 'Post a comment', 0),
(664, 'vn', 'public', 'submit-comment', 'Đăng bình luận', 0),
(665, 'us', 'public', 'read-less', 'Read Less', 0),
(666, 'vn', 'public', 'read-less', 'Thu gọn', 0),
(667, 'vn', 'contact', 'reply', 'Trả lời', 0),
(668, 'us', 'public', 'write-comment', 'Write your comment here', 0),
(669, 'vn', 'public', 'write-comment', 'Viết bình luận của bạn ở đây', 0),
(670, 'us', 'public', 'submit-contact', 'Send', 0),
(671, 'vn', 'public', 'submit-contact', 'Gửi', 0),
(672, 'us', 'public', 'specifications', 'Specifications', 0),
(673, 'vn', 'public', 'specifications', 'Thông số kĩ thuật', 0),
(674, 'us', 'public', 'search-question', 'Search question or article', 0),
(675, 'vn', 'public', 'search-question', 'Tìm kiếm câu hỏi hoặc tài liệu', 0),
(676, 'us', 'public', 'payments', 'Payments', 0),
(677, 'vn', 'public', 'payments', 'Thanh toán', 0),
(678, 'us', 'public', 'general-help', 'General help', 0),
(679, 'vn', 'public', 'general-help', 'Trợ giúp chung', 0),
(680, 'us', 'public', 'warranty', 'Warranty', 0),
(681, 'vn', 'public', 'warranty', 'Đảm bảo', 0),
(682, 'us', 'public', 'refund', 'Refund', 0),
(683, 'vn', 'public', 'refund', 'Đền bù', 0),
(684, 'us', 'public', 'cart', 'Cart', 0),
(685, 'vn', 'public', 'cart', 'Giỏ hàng', 0),
(686, 'us', 'public', 'check-out', 'Check out', 0),
(687, 'vn', 'public', 'check-out', 'Thủ tục thanh toán', 0),
(688, 'us', 'public', 'order-history', 'Order History', 0),
(689, 'vn', 'public', 'order-history', 'Lịch sử đơn hàng', 0),
(692, 'us', 'public', 'status', 'Status', 0),
(693, 'vn', 'public', 'status', 'Trạng thái', 0),
(694, 'us', 'public', 'date-added', 'Date Added', 0),
(695, 'vn', 'public', 'date-added', 'Ngaỳ đặt hàng', 0),
(697, 'us', 'public', 'order-details', 'Order Details', 0),
(698, 'vn', 'public', 'order-details', 'Chi tiết đơn hàng', 0),
(699, 'us', 'public', 'order-infomation', 'Order Infomation', 0),
(700, 'vn', 'public', 'order-infomation', 'Thông tin đặt hàng', 0),
(701, 'us', 'public', 'payment-method', 'Payment Method', 0),
(702, 'vn', 'public', 'payment-method', 'Phương thức thanh toán', 0),
(705, 'us', 'public', 'shipping-method', 'Shipping Method', 0),
(706, 'vn', 'public', 'shipping-method', 'Phương pháp vận chuyển', 0),
(707, 'us', 'public', 'payment-address', 'Payment Address', 0),
(708, 'vn', 'public', 'payment-address', 'Địa chỉ thanh toán', 0),
(709, 'us', 'public', 'shipping-address', 'Shipping Address', 0),
(710, 'vn', 'public', 'shipping-address', 'Địa chỉ giao hàng', 0),
(711, 'us', 'public', 'order-success', 'Order Success', 0),
(712, 'vn', 'public', 'order-success', 'Đặt hàng thành công', 0),
(713, 'us', 'public', 'checking', 'Checking', 0),
(714, 'vn', 'public', 'checking', 'Đang kiểm tra', 0),
(715, 'us', 'public', 'delivery-progress', 'Delivery in progress', 0),
(716, 'vn', 'public', 'delivery-progress', 'Đang giao hàng', 0),
(717, 'us', 'public', 'deliveryd-sudccessful', 'Delivery successfully', 0),
(718, 'vn', 'public', 'deliveryd-sudccessful', 'Giao hàng thành công', 0),
(719, 'us', 'public', 'cancel-order', 'Cancel order', 0),
(720, 'vn', 'public', 'cancel-order', 'Hủy đơn hàng', 0),
(721, 'vn', 'all', 'print', 'In đơn hàng', 0),
(722, 'us', 'public', 'quick-tracking-order', 'Quick Tracking Order', 0),
(723, 'vn', 'public', 'quick-tracking-order', 'Theo dõi nhanh đơn hàng', 0),
(724, 'us', 'public', 'estimated-delivery-time', 'Estimated Delivery time', 0),
(725, 'vn', 'public', 'estimated-delivery-time', 'Thời gian dự tính giao hàng', 0),
(726, 'us', 'public', 'shipping-by', 'Shipping BY', 0),
(727, 'vn', 'public', 'shipping-by', 'Vận chuyển BẰNG', 0),
(728, 'us', 'public', 'picked-courier', 'Picked by the courier', 0),
(729, 'vn', 'public', 'picked-courier', 'Khách hàng lựa chọn', 0),
(730, 'us', 'public', 'write-review', 'Write a review', 0),
(731, 'vn', 'public', 'write-review', 'Viết nhận xét', 0),
(732, 'us', 'public', 'overall-rating', 'Overall rating', 0),
(733, 'vn', 'public', 'overall-rating', 'Đánh giá tổng thể', 0),
(734, 'us', 'public', 'title-review', 'Title of your review', 0),
(735, 'vn', 'public', 'title-review', 'Tiêu đề bài đánh giá của bạn', 0),
(736, 'us', 'public', 'your-review', 'Your review', 0),
(737, 'vn', 'public', 'your-review', 'Đánh giá của bạn', 0),
(738, 'us', 'public', 'submit-review', 'Submit review', 0),
(739, 'vn', 'public', 'submit-review', 'Gửi đánh giá', 0),
(740, 'vn', 'public', 'content-length-500', 'Độ dài nội dung vượt quá 500 ký tự', 0),
(741, 'us', 'public', 'content-length-500', 'Content length exceeds 500 characters', 0),
(742, 'us', 'public', 'page404', 'The page you are looking is not founded', 0),
(743, 'vn', 'public', 'page404', 'Trang bạn đang tìm vẫn chưa được thành lập', 0),
(744, 'vn', 'public', 'picked-courier', 'Khách hàng lựa chọn', 0),
(745, 'us', 'public', 'order-completed', 'Order completed', 0),
(746, 'vn', 'public', 'order-completed', 'Thanh toán thành công', 0),
(747, 'us', 'public', 'confirmation-email', 'You will receive a confirmation email', 0),
(748, 'vn', 'public', 'confirmation-email', 'Bạn sẽ nhận được một email xác nhận', 0),
(749, 'us', 'public', 'captcha-empty', 'Captcha does not empty', 0),
(750, 'vn', 'public', 'captcha-empty', 'Captcha không được trống', 0),
(751, 'us', 'public', 'invalid-user-pass', 'Invalid Username, password or captcha', 0),
(752, 'vn', 'public', 'invalid-user-pass', 'Username, password hoặc verification không hợp lệ', 0),
(753, 'us', 'user', 'name_empty', 'Name does not empty', 0),
(754, 'vn', 'user', 'name_empty', 'Tên không được bỏ trống', 0),
(755, 'us', 'public', 'address_empty', 'Address does not empty', 0),
(756, 'vn', 'public', 'address_empty', 'Địa chỉ không được để trống', 0),
(757, 'us', 'public', 'telephone_empty', 'Telephone does not empty', 0),
(758, 'vn', 'public', 'telephone_empty', 'Số điện thoại không được để trống', 0),
(759, 'vn', 'user', 'user_no_exits', 'Username không tồn tại', 0),
(760, 'us', 'user', 'user_no_exits', 'Username does not exist', 0),
(761, 'us', 'public', 'agree-terms-conditions-privacypolicy', 'Please indicate that you have read and agree to the Terms and Conditions and Privacy Policy', 0),
(762, 'vn', 'public', 'agree-terms-conditions-privacypolicy', 'Vui lòng cho biết rằng bạn đã đọc và đồng ý với các Điều khoản và Điều kiện và Chính sách Bảo mật', 0),
(763, 'us', 'public', 'register-successfuly', 'Register successfully', 0),
(764, 'vn', 'public', 'register-successfuly', 'Đăng ký thành công', 0),
(765, 'us', 'public', 'register-unsuccessfuly', 'Register unsuccessfully', 0),
(766, 'vn', 'public', 'register-unsuccessfuly', 'Đăng ký thất bại', 0),
(767, 'us', 'public', 'submitted-successfully', 'Submitted successfully', 0),
(768, 'vn', 'public', 'submitted-successfully', 'Gửi thành công', 0),
(769, 'us', 'public', 'submitted-unsuccessfully', 'Submitted unsuccessfully', 0),
(770, 'vn', 'public', 'submitted-unsuccessfully', 'Gửi thất bại', 0),
(771, 'us', 'public', 'quantity-valid', 'Quantity valid', 0),
(772, 'vn', 'public', 'quantity-valid', 'Số lượng hợp lệ', 0),
(773, 'us', 'public', 'no-products', 'No products', 0),
(774, 'vn', 'public', 'no-products', 'Không có sản phẩm', 0),
(775, 'us', 'public', 'payment-successfully', 'Payment successfully', 0),
(776, 'vn', 'public', 'payment-successfully', 'Thanh toán thành công', 0),
(777, 'us', 'public', 'payment-unsuccessfully', 'Payment unsuccessfully', 0),
(778, 'vn', 'public', 'payment-unsuccessfully', 'Thanh toán thất bại', 0),
(779, 'us', 'public', 'comments_empty', 'Comments does not empty', 0),
(780, 'vn', 'public', 'comments_empty', 'Comments không được để trống hoặc không hợp lệ', 0),
(781, 'us', 'public', 'remove-compare', 'Please remove the product to continue comparing', 0),
(782, 'vn', 'public', 'remove-compare', 'Vui lòng xóa bớt sản phẩm để tiếp tục so sánh', 0),
(783, 'us', 'public', 'orderid_empty', 'Order ID does not empty', 0),
(784, 'vn', 'public', 'orderid_empty', 'Order ID không được để trống', 0),
(785, 'us', 'public', 'message-special-characters', 'Message contains special characters', 0),
(786, 'vn', 'public', 'message-special-characters', 'Tin nhắn chứa các ký tự đặc biệt', 0),
(787, 'us', 'public', 'name-special-characters', 'Name contains special characters', 0),
(788, 'vn', 'public', 'name-special-characters', 'Tên chứa các ký tự đặc biệt', 0),
(789, 'us', 'public', 'message_empty', 'Message does not empty', 0),
(790, 'vn', 'public', 'message_empty', 'Tin nhắn không được trống', 0),
(791, 'us', 'public', 'review-special-characters', 'Your review contains special characters', 0),
(792, 'vn', 'public', 'review-special-characters', 'Đánh giá của bạn chứa ký tự đặc biệt', 0),
(793, 'us', 'public', 'comments-special-characters', 'Comments contains special characters', 0),
(794, 'vn', 'public', 'comments-special-characters', 'Nội dung bình luận chứa ký tự đặc biệt', 0),
(795, 'us', 'public', 'create-code', 'Create another code', 0),
(796, 'vn', 'public', 'create-code', 'Tạo mã khác', 0),
(797, 'us', 'public', 'quesion', 'Quesion', 0),
(798, 'vn', 'public', 'quesion', 'Câu hỏi', 0),
(799, 'us', 'public', 'view-detail', 'View detail', 0),
(800, 'vn', 'public', 'view-detail', 'Xem chi tiết', 0),
(801, 'us', 'public', 'action', 'Action', 0),
(802, 'vn', 'public', 'action', 'Thao tác', 0),
(803, 'us', 'admin', 'total-revenue', 'Total Revenue', 0),
(804, 'vn', 'admin', 'total-revenue', 'Tổng doanh thu', 0),
(805, 'us', 'admin', 'total-orders', 'Total Orders', 0),
(806, 'vn', 'admin', 'total-orders', 'Tổng số đơn hàng', 0),
(807, 'us', 'admin', 'total-sales', 'Total Sales', 0),
(808, 'vn', 'admin', 'total-sales', 'Tổng doanh số', 0),
(809, 'us', 'admin', 'new-employees', 'New Employees', 0),
(810, 'vn', 'admin', 'new-employees', 'Khách hàng mới', 0),
(811, 'us', 'admin', 'visit-sales-statistics', 'Visit & Sales Statistics', 0),
(812, 'vn', 'admin', 'visit-sales-statistics', 'Thống kê lượt truy cập & bán hàng', 0),
(813, 'us', 'admin', 'sales-statistics', 'Sales Statistics', 0),
(814, 'vn', 'admin', 'sales-statistics', 'Thống kê bán hàng', 0),
(815, 'us', 'admin', 'for-year', 'for the year', 0),
(816, 'vn', 'admin', 'for-year', 'trong 1 năm', 0),
(818, 'us', 'menu', 'home', 'Dashboard', 0),
(819, 'vn', 'menu', 'home', 'Bảng điều khiển', 0),
(822, 'us', 'menu', 'e-products', 'Products', 0),
(823, 'vn', 'menu', 'e-products', 'Danh sách sản phẩm', 0),
(824, 'us', 'menu', 'e-orders', 'Orders', 0),
(825, 'vn', 'menu', 'e-orders', 'Danh sách đơn hàng', 0),
(826, 'us', 'menu', 'events', 'Events', 0),
(827, 'vn', 'menu', 'events', 'Danh sách sự kiện', 0),
(828, 'us', 'menu', 'setting', 'Config', 0),
(829, 'vn', 'menu', 'setting', 'Cấu hình', 0),
(830, 'us', 'menu', 'comments', 'Comments', 0),
(831, 'vn', 'menu', 'comments', 'Danh sách bình luận', 0),
(832, 'us', 'menu', 'reviews', 'Reviews', 0),
(833, 'vn', 'menu', 'reviews', 'Danh sách đánh giá', 0),
(834, 'us', 'menu', 'language', 'Languages', 0),
(835, 'vn', 'menu', 'language', 'Danh sách ngôn ngữ', 0),
(836, 'us', 'menu', 'brands', 'Brands', 0),
(837, 'vn', 'menu', 'brands', 'Danh sách nhãn hiệu', 0),
(838, 'us', 'menu', 'categories', 'Categories', 0),
(839, 'vn', 'menu', 'categories', 'Danh sách thể loại', 0),
(840, 'us', 'menu', 'color', 'Colors', 0),
(841, 'vn', 'menu', 'color', 'Danh sách màu sắc', 0),
(842, 'us', 'menu', 'discount', 'Discount', 0),
(843, 'vn', 'menu', 'discount', 'Danh sách giảm giá', 0),
(844, 'vn', 'all', 'add_new', 'Thêm mới', 0),
(845, 'vn', 'public', 'import', 'Nhập', 0),
(846, 'us', 'all', 'add_new', 'Add', 0),
(847, 'us', 'public', 'import', 'Import', 0),
(848, 'us', 'public', 'from_date', 'From date', 0),
(849, 'vn', 'public', 'from_date', 'Từ ngày', 0),
(850, 'us', 'public', 'to_date', 'To date', 0),
(851, 'vn', 'public', 'to_date', 'Đến ngày', 0),
(852, 'us', 'public', 'input', 'Input', 0),
(853, 'vn', 'public', 'input', 'Nhập', 0),
(854, 'vn', 'menu', 'seo-page', 'Quản lý SEO', 0),
(855, 'vn', 'menu', 'seo-extended', 'SEO mở rộng', 0),
(857, 'us', 'menu', 'file-manager', 'File Manager', 0),
(858, 'vn', 'menu', 'file-manager', 'Quản lý file', 0),
(859, 'vn', 'public', 'download-file', 'Tải file', 0),
(860, 'vn', 'public', 'keyword', 'Từ khóa', 0),
(861, 'vn', 'public', 'add-event', 'Thêm sự kiện', 0),
(862, 'vn', 'public', 'close', 'Đóng', 0),
(863, 'vn', 'public', 'create', 'Tạo', 0),
(864, 'vn', 'public', 'cancel', 'Hủy', 0),
(865, 'vn', 'public', 'rename-folder', 'Đổi tên thư mục', 0),
(866, 'vn', 'public', 'folder', 'Thư mục', 0),
(867, 'vn', 'public', 'page', 'Trang', 0),
(868, 'vn', 'public', 'user-created', 'Người tạo', 0),
(869, 'vn', 'public', 'date-created', 'Ngày tạo', 0),
(870, 'vn', 'public', 'contents-file-robot', 'Nội dung file Robot', 0),
(871, 'vn', 'public', 'contents-file-sitemap', 'Nội dung file Sitemap', 0),
(872, 'vn', 'public', 'upload', 'Tải lên', 0),
(873, 'vn', 'public', 'update-sitemap', 'Cập nhật Sitemap tự động', 0),
(874, 'vn', 'public', 'auto', 'Tự động', 0),
(875, 'vn', 'public', 'detail', 'Chi tiết', 0),
(876, 'vn', 'public', 'file', 'Tập tin', 0),
(877, 'vn', 'public', 'new-folder', 'Tạo thư mục', 0),
(878, 'vn', 'public', 'file-upload', 'Tải lên tệp', 0),
(879, 'vn', 'public', 'folder-upload', 'Tải lên thư mục', 0),
(880, 'vn', 'public', 'get-link', 'Lấy liên kết', 0),
(881, 'vn', 'public', 'move-to', 'Di chuyển đến', 0),
(882, 'vn', 'public', 'add-starred', 'Gắn dấu sao', 0),
(883, 'vn', 'public', 'rename', 'Đổi tên', 0),
(884, 'vn', 'public', 'download', 'Tải xuống', 0),
(885, 'vn', 'public', 'owner', 'Người sở hữu', 0),
(886, 'vn', 'public', 'modified', 'Sửa đổi', 0),
(887, 'vn', 'public', 'created', 'Tạo', 0),
(888, 'us', 'public', 'download-file', 'Download file', 0),
(889, 'us', 'public', 'keyword', 'Keyword', 0),
(890, 'us', 'public', 'add-event', 'Add Event', 0),
(891, 'us', 'public', 'close', 'Close', 0),
(892, 'us', 'public', 'create', 'Create', 0),
(893, 'us', 'public', 'cancel', 'Cancel', 0),
(894, 'us', 'public', 'rename-folder', 'Rename folder', 0),
(895, 'us', 'public', 'folder', 'Folder', 0),
(896, 'us', 'public', 'page', 'Page', 0),
(897, 'us', 'public', 'user-created', 'User created', 0),
(898, 'us', 'public', 'date-created', 'Date created', 0),
(899, 'us', 'public', 'contents-file-robot', 'Robot file contents', 0),
(900, 'us', 'public', 'contents-file-sitemap', 'Sitemap file contents', 0),
(901, 'us', 'public', 'upload', 'Upload', 0),
(902, 'us', 'public', 'update-sitemap', 'Automatic Sitemap updates', 0),
(903, 'us', 'public', 'auto', 'Auto', 0),
(904, 'us', 'public', 'detail', 'Detail', 0),
(905, 'us', 'public', 'file', 'File', 0),
(906, 'us', 'public', 'new-folder', 'New folder', 0),
(907, 'us', 'public', 'file-upload', 'File upload', 0),
(908, 'us', 'public', 'folder-upload', 'Folder upload', 0),
(909, 'us', 'public', 'get-link', 'Get link', 0),
(910, 'us', 'public', 'move-to', 'Move to', 0),
(911, 'us', 'public', 'add-starred', 'Add to starred', 0),
(912, 'us', 'public', 'rename', 'Rename', 0),
(913, 'us', 'public', 'download', 'Download', 0),
(914, 'us', 'public', 'owner', 'Owner', 0),
(915, 'us', 'public', 'modified', 'Modified', 0),
(916, 'us', 'public', 'created', 'Created', 0),
(917, 'vn', 'menu', 'all-file', 'Tất cả file', 0),
(918, 'us', 'menu', 'all-file', 'All file', 0),
(919, 'vn', 'public', 'move-to-now', 'Di chuyển tới đây', 0),
(920, 'us', 'public', 'move-to-now', 'Move to now', 0),
(921, 'vn', 'public', 'make-copy', 'Tạo một bản sao', 0),
(922, 'us', 'public', 'make-copy', 'Make a copy', 0),
(923, 'vn', 'public', 'search-within', 'Tìm kiếm trong', 0),
(924, 'us', 'public', 'search-within', 'Search within', 0),
(925, 'vn', 'public', 'search-results', 'Kết quả tìm kiếm', 0),
(926, 'us', 'public', 'search-results', 'Search results', 0),
(927, 'vn', 'public', 'dich-vu-noi-bat', 'Dịch vụ nổi bật', 0),
(928, 'us', 'public', 'dich-vu-noi-bat', 'Excellent service', 0),
(929, 'vn', 'public', 'ho-tro-tu-van', 'Hỗ trợ tư vấn', 0),
(930, 'us', 'public', 'ho-tro-tu-van', 'Consulting support', 0),
(931, 'vn', 'public', 'bai-viet-lien-quan', 'Bài viết liên quan', 0),
(932, 'us', 'public', 'bai-viet-lien-quan', 'Related Posts', 0),
(933, 'vn', 'public', 'chi-tiey-san-pham', 'Chi tiết sản phẩm', 0),
(934, 'us', 'public', 'chi-tiey-san-pham', 'Product details', 0),
(935, 'us', 'menu', 'categories-news', 'News category', 0),
(936, 'vn', 'menu', 'categories-news', 'Thể loại tin tức', 0),
(937, 'vn', 'public', 'error-capcha', 'Hình ảnh xác thực không hợp lệ', 0),
(938, 'us', 'public', 'error-capcha', 'Invalid captcha', 0),
(941, 'vn', 'public', 'services', 'Dịch vụ', 0),
(942, 'us', 'public', 'services', 'Services', 0),
(943, 'vn', 'public', 'factory', 'Nhà xưởng', 0),
(944, 'us', 'public', 'factory', 'Factory', 0),
(945, 'vn', 'public', 'cat-lasze', 'Cắt Lasze', 0),
(946, 'us', 'public', 'cat-lasze', 'Laser CNC cutting', 0),
(947, 'vn', 'public', 'gia-cong-hang-phu-tro', 'Gia công hàng phụ trợ	', 0),
(948, 'us', 'public', 'gia-cong-hang-phu-tro', 'Processing supporting goods', 0),
(949, 'vn', 'public', 'san-pham-khac', 'Sản phẩm khác', 0),
(950, 'us', 'public', 'san-pham-khac', 'Other prodcuts', 0),
(951, 'vn', 'public', 'hang-phu-tro-mau', 'Hàng phụ trợ mẫu', 0),
(952, 'us', 'public', 'hang-phu-tro-mau', 'Sample auxiliary goods', 0),
(953, 'vn', 'public', 'tat-ca', 'Tất cả', 0),
(954, 'us', 'public', 'tat-ca', 'All', 0),
(955, 'vn', 'public', 'description', 'Thông tin sản phẩm', 0),
(956, 'us', 'public', 'description', 'Description', 0),
(959, 'vn', 'public', 'all-folder', 'Tất cả thư mục', 0),
(960, 'us', 'public', 'all-folder', 'All folder', 0),
(961, 'vn', 'public', 'export-excel', 'Xuất excel', 0),
(962, 'us', 'public', 'export-excel', 'Export excel', 0),
(963, 'vn', 'public', 'remove-starred', 'Bỏ gắn dấu sao', 0),
(964, 'us', 'public', 'remove-starred', 'Remove starred', 0),
(965, 'vn', 'public', 'last-modified', 'Sửa đổi lần cuối', 0),
(966, 'us', 'public', 'last-modified', 'Last modified', 0),
(968, 'vn', 'public', 'view', 'Xem', 0),
(969, 'us', 'public', 'view', 'View', 0),
(970, 'vn', 'profile', 'wrong_pass', 'Sai mật khẩu', 0),
(971, 'vn', 'contact', 'replied', 'Đã trả lời', 0),
(972, 'vn', 'all', 'send_error', 'Gửi lỗi', 0),
(973, 'us', 'menu', 'seo-extended', 'Expand SEO', 0),
(974, 'us', 'menu', 'seo-page', 'SEO Management', 0),
(975, 'vn', 'all', 'content_empty', 'Nội dung không trống', 0),
(976, 'vn', 'group', 'delete-group', 'Bạn có chắc chắn muốn xóa?', 0),
(977, 'vn', 'all', 'priority', 'Quyền ưu tiên', 0),
(978, 'vn', 'all', 'permission_denied', 'Quyền bị từ chối', 0),
(979, 'vn', 'all', 'alias', 'Bí danh', 0),
(980, 'vn', 'all', 'edit_success', 'Sửa thành công', 0),
(981, 'vn', 'all', 'add_success', 'Thêm thành công', 0),
(982, 'vn', 'all', 'exist', 'tồn tại', 0),
(983, 'vn', 'all', 'empty', 'không được để trống', 0),
(984, 'vn', 'group', 'group-exists', 'Nhóm đã tồn tại', 0),
(985, 'vn', 'group', 'select_group', 'Chọn nhóm', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_menus`
--

CREATE TABLE `ecommerce_menus` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `route` char(25) NOT NULL,
  `classicon` char(50) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `params` char(100) NOT NULL DEFAULT 'view,add,edit,delete',
  `keylang` char(100) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 1,
  `isdelete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_menus`
--

INSERT INTO `ecommerce_menus` (`id`, `name`, `route`, `classicon`, `parent`, `params`, `keylang`, `ordering`, `isdelete`) VALUES
(1, 'Administration', '#', 'mdi mdi-account-cog\r\n\r\n', 0, '', 'quan-tri', 10, 0),
(2, 'Home', '#', 'mdi mdi-desktop-mac-dashboard\r\n', 0, '', 'trang-chu', 1, 0),
(5, 'Contact US', '#', 'bx bxs-contact', 0, '', 'lien-he', 4, 0),
(11, 'Groups Permission', 'group', '', 1, 'view,add,edit,right,delete', 'nhom-quyen', 4, 0),
(12, 'Users', 'user', '', 1, 'view,add,edit,delete', 'nguoi-dung', 3, 0),
(21, 'Home page', 'home_image', '', 2, 'view,add,edit,right,delete', 'home_image', 2, 0),
(22, 'About', 'home_public', '', 2, 'view,add,edit,right,delete', 've-chung-toi', 3, 0),
(66, 'Blog', 'news', 'mdi mdi-newspaper-variant\r\n\r\n', 0, 'view,add,edit,delete', 'news', 2, 0),
(68, 'Menu', 'menu', '', 88, 'view,add,edit,delete', 'menu', 1, 0),
(81, 'Contact List', 'contact', '', 5, 'view,add,edit,delete', 'danh-sach-lien-he', 1, 0),
(82, 'Contact Information', 'contact_information', '', 5, 'view,add,edit,delete', 'thong-tin-lien-he', 2, 0),
(83, 'eCommerce', '#', 'bx bxs-cart-alt', 0, '', 'e-commerce', 3, 0),
(84, 'Products', 'products', '', 83, 'view,add,edit,delete', 'e-products', 1, 0),
(85, 'Orders', 'orders', '', 83, 'view,add,edit,delete', 'e-orders', 2, 0),
(86, 'Dashboard', 'home', '', 2, 'view,add,edit,delete', 'home', 1, 0),
(87, 'Events', 'calendar', 'bx bxs-calendar-week', 0, 'view,add,edit,delete', 'events', 7, 0),
(88, 'Settings', '#', 'mdi mdi-application-cog\r\n', 0, '', 'setting', 5, 0),
(89, 'Comments', 'comments', '', 88, 'view,add,edit,delete', 'comments', 4, 0),
(90, 'Reviews', 'reviews', '', 88, 'view,add,edit,delete', 'reviews', 5, 0),
(91, 'Language', 'language', '', 88, 'view,add,edit,delete,import', 'language', 3, 0),
(92, 'Brands', 'brands', '', 88, 'view,add,edit,delete', 'brands', 6, 0),
(93, 'Categories', 'categories', '', 88, 'view,add,edit,delete', 'categories', 7, 0),
(94, 'Color', 'color', '', 88, 'view,add,edit,delete', 'color', 8, 0),
(95, 'Discount', 'discount', '', 83, 'view,add,edit,delete', 'discount', 3, 0),
(96, 'SEO', '#', 'bx bxl-google', 0, '', 'seo', 8, 0),
(97, 'Page SEO', 'seopage', '', 96, 'view,add,edit,delete,import', 'seo-page', 1, 0),
(98, 'Extended SEO', 'seoextended', '', 96, 'view,add', 'seo-extended', 2, 0),
(99, 'File Manager', '#', 'mdi mdi-folder-multiple\r\n\r\n', 0, '', 'file-manager', 9, 0),
(100, 'All File', 'filemanager', '', 99, 'view,add,edit,delete,upload', 'all-file', 1, 0),
(101, 'Coupons', 'coupons', '', 83, 'view,add,edit,delete', 'coupons', 4, 0),
(103, 'Categories News', 'categoriesnews', '', 88, 'view,add,edit,delete', 'categories-news', 10, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_news`
--

CREATE TABLE `ecommerce_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `news_title` varchar(255) DEFAULT NULL,
  `news_summary` text DEFAULT NULL,
  `news_content` text DEFAULT NULL,
  `news_image` varchar(100) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `isdelete` int(2) DEFAULT 0,
  `news_priority` int(10) DEFAULT NULL,
  `views_number` int(11) DEFAULT 0,
  `author` varchar(45) DEFAULT NULL,
  `popular` tinyint(4) DEFAULT 0,
  `isshow` tinyint(4) DEFAULT 0,
  `date_update` datetime DEFAULT NULL,
  `news_image_right` varchar(100) DEFAULT NULL,
  `news_image_mobile` varchar(100) DEFAULT NULL,
  `news_image_mobile_right` varchar(100) DEFAULT NULL,
  `tag` varchar(45) DEFAULT NULL,
  `categories` varchar(45) DEFAULT NULL,
  `news_title_vn` varchar(255) DEFAULT NULL,
  `news_summary_vn` text DEFAULT NULL,
  `news_content_vn` text DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_news`
--

INSERT INTO `ecommerce_news` (`id`, `news_title`, `news_summary`, `news_content`, `news_image`, `date_created`, `isdelete`, `news_priority`, `views_number`, `author`, `popular`, `isshow`, `date_update`, `news_image_right`, `news_image_mobile`, `news_image_mobile_right`, `tag`, `categories`, `news_title_vn`, `news_summary_vn`, `news_content_vn`, `link`, `keyword`) VALUES
(1, 'Chống dịch quyết liệt, vì sao Singapore vẫn gặp cú sốc?', '<p>A bomb blast hits a police building in Turkey&#39;s majority-Kurdish Diyarbakir province, reportedly killing five people and injuring at least 36.</p>\r\n', '<p style=\"text-align:justify\"><span style=\"font-size:14px\">D&ugrave; đ&atilde; d&ugrave;ng nhiều biện ph&aacute;p cứng rắn để kiềm chế dịch bệnh, số ca nhiễm ở Singapore vẫn tăng mạnh do l&agrave;n s&oacute;ng người trở về từ nước ngo&agrave;i v&agrave; t&igrave;nh trạng l&acirc;y nhiễm trong cộng đồng.</span></p>\n\n<div class=\"the-article-body\">\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Đầu th&aacute;ng 3, Singapore chỉ c&oacute; hơn 100 ca nhiễm. Đảo quốc Đ&ocirc;ng Nam &Aacute; được khắp thế giới nh&igrave;n nhận như một h&igrave;nh mẫu trong cuộc chiến chống Covid-19 khi sớm khống chế được dịch bệnh nhờ triển khai sớm c&aacute;c biện ph&aacute;p hạn chế đi lại, c&aacute;ch ly, theo d&otilde;i nghi&ecirc;m ngặt cũng như x&eacute;t nghiệm tr&ecirc;n diện rộng.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">T&iacute;nh đến 25/3, Singapore đ&atilde; tiến h&agrave;nh 6.800 x&eacute;t nghiệm/1 triệu người, nhiều hơn cả H&agrave;n Quốc v&agrave; Đ&agrave;i Loan với c&aacute;c con số lần lượt l&agrave; 6.500 v&agrave; 1.000 x&eacute;t nghiệm/1 triệu người. Trường học v&agrave; ngay cả trung t&acirc;m thương mại tr&ecirc;n quốc đảo sư tử vẫn mở cửa, nhịp sống vẫn diễn ra b&igrave;nh thường, theo <em>South China Morning Post</em>.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Tuy nhi&ecirc;n, tất cả thay đổi ch&oacute;ng mặt chỉ trong 1 th&aacute;ng. Ng&agrave;y 1/4, Singapore vượt mốc 1.000 ca nhiễm, bức tranh kh&ocirc;ng c&ograve;n &quot;m&agrave;u hồng&quot;. Số ca nhiễm tăng kỷ lục trong ng&agrave;y 1/4 (74 ca) v&agrave; 2/4 (49 ca), theo <em>Straits Times</em>.</span></p>\n\n<table align=\"center\" class=\"picture\">\n	<tbody>\n		<tr>\n			<td style=\"text-align:justify\"><span style=\"font-size:14px\"><img alt=\"Chong dich quyet liet, vi sao Singapore van gap cu soc 1.000 ca nhiem? hinh anh 1 Lan_song_nguoi_tro_ve_tu_nuoc_ngoai_la_mot_trong_nhung_nguyen_nhan_dan_den_dot_bung_phat_dich_benh_moi_o_Singapore._Anh_Reuters.jpg\" src=\"https://znews-photo.zadn.vn/w1024/Uploaded/zdhwqwqd2/2020_04_01/Lan_song_nguoi_tro_ve_tu_nuoc_ngoai_la_mot_trong_nhung_nguyen_nhan_dan_den_dot_bung_phat_dich_benh_moi_o_Singapore._Anh_Reuters.jpg\" /></span></td>\n		</tr>\n		<tr>\n			<td>\n			<p style=\"text-align:justify\"><span style=\"font-size:14px\"><em>L&agrave;n s&oacute;ng người trở về từ nước ngo&agrave;i l&agrave; một trong những nguy&ecirc;n nh&acirc;n dẫn đến đợt b&ugrave;ng ph&aacute;t dịch bệnh mới ở Singapore. Ảnh: Reuters.</em></span></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<div class=\"banner size_masthead\" id=\"advMiddle1\" style=\"display: block;\">\n<div class=\"z2-zads-zone\" id=\"adtima-zone-2782058279008172787\">\n<div id=\"adtimaDivWrapper_2782058279008172787\" style=\"display: block; text-align: justify;\">&nbsp;</div>\n</div>\n</div>\n\n<p style=\"text-align: justify;\"><strong><span style=\"font-size:16px\">&quot;L&agrave;n s&oacute;ng thứ hai&quot;</span></strong></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:14px\">Theo c&aacute;c chuy&ecirc;n gia, số lượng ca nhiễm tăng vọng tại Singapore cho thấy một l&agrave;n s&oacute;ng l&acirc;y nhiễm thứ hai ở đất nước 5,7 triệu d&acirc;n.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">L&agrave;n s&oacute;ng thứ nhất bắt nguồn từ du kh&aacute;ch từ Trung Quốc đại lục sang, những ca nhiễm đầu ti&ecirc;n xuất hiện trước khi ch&iacute;nh quyền Singapore kịp thực hiện bất kỳ hạn chế du lịch n&agrave;o.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Khi số người mắc bệnh tăng l&ecirc;n, Singapore đ&atilde; triển khai c&aacute;c biện ph&aacute;p hạn chế du lịch nghi&ecirc;m ngặt, đầu ti&ecirc;n nhắm v&agrave;o c&aacute;c du kh&aacute;ch nước ngo&agrave;i đến từ Trung Quốc; sau đ&oacute; l&agrave; H&agrave;n Quốc, Italy v&agrave; Iran; cuối c&ugrave;ng l&agrave; cấm tất cả du kh&aacute;ch nước ngo&agrave;i.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Tuy nhi&ecirc;n, l&agrave;n s&oacute;ng l&acirc;y nhiễm thứ hai phần lớn li&ecirc;n quan đến người Singapore trở về từ c&aacute;c nước như Mỹ v&agrave; Anh, nơi dịch bệnh đang lan rộng. Đ&aacute;ng lo ngại hơn l&agrave; đợt b&ugrave;ng ph&aacute;t mới c&oacute; nhiều ca l&acirc;y nhiễm tại địa phương v&agrave; một số ca kh&ocirc;ng x&aacute;c định được nguồn l&acirc;y nhiễm.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Đối ph&oacute; với l&agrave;n s&oacute;ng thứ hai, ch&iacute;nh quyền Singapore đ&atilde; thực hiện c&aacute;c biện ph&aacute;p c&aacute;ch ly x&atilde; hội nghi&ecirc;m ngặt hơn, cấm nhập cảnh đối với tất cả du kh&aacute;ch từ ng&agrave;y 23/3, ng&agrave;y 27/3 đ&oacute;ng cửa c&aacute;c qu&aacute;n bar v&agrave; tụ điểm vui chơi về đ&ecirc;m, hạn chế tụ tập từ 10 người v&agrave; &aacute;p dụng c&aacute;c h&igrave;nh phạt cho những c&aacute; nh&acirc;n v&agrave; nh&agrave; h&agrave;ng kh&ocirc;ng đảm bảo khoảng c&aacute;ch 1 m giữa c&aacute;c kh&aacute;ch h&agrave;ng.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Ch&iacute;nh phủ k&ecirc;u gọi người d&acirc;n ở nh&agrave;, chỉ ra ngo&agrave;i khi thực sự cần thiết.</span></p>\n\n<table align=\"center\" class=\"picture\">\n	<tbody>\n		<tr>\n			<td style=\"text-align:justify\"><span style=\"font-size:14px\"><img alt=\"Chong dich quyet liet, vi sao Singapore van gap cu soc 1.000 ca nhiem? hinh anh 2 Chinh_phu_Singapore_khuyen_cao_nguoi_dan_thuc_han_che_toi_da_viec_ra_khoi_nha_de_kiem_soat_dich_benh._Anh_AFP.jpg\" src=\"https://znews-photo.zadn.vn/w1024/Uploaded/zdhwqwqd2/2020_04_01/Chinh_phu_Singapore_khuyen_cao_nguoi_dan_thuc_han_che_toi_da_viec_ra_khoi_nha_de_kiem_soat_dich_benh._Anh_AFP.jpg\" /></span></td>\n		</tr>\n		<tr>\n			<td>\n			<p style=\"text-align:justify\"><span style=\"font-size:14px\">Ch&iacute;nh phủ Singapore khuyến c&aacute;o người d&acirc;n thực hạn chế tối đa việc ra khỏi nh&agrave; để kiểm so&aacute;t dịch bệnh. Ảnh: <em>AFP</em>.</span></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Tuần n&agrave;y, Bộ trưởng Ph&aacute;t triển quốc gia Lawrence Wong đồng thời l&agrave; người đứng đầu nh&oacute;m c&ocirc;ng t&aacute;c đặc biệt chống Covid-19 của Singapore, cho hay khoảng thời gian hai tuần tới sẽ &quot;quyết định&quot; xem c&aacute;c biện ph&aacute;p tr&ecirc;n c&oacute; hiệu quả kh&ocirc;ng.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">&Ocirc;ng Wong n&oacute;i rằng ch&iacute;nh phủ cần l&agrave;m cho &quot;tất cả người d&acirc;n Singapore hiểu rằng l&uacute;c n&agrave;y mỗi người đều đang ở tiền tuyến trong mặt trận chống dịch&quot;.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">&quot;Tất cả ch&uacute;ng ta chắc chắn kh&ocirc;ng thể thờ ơ trước l&agrave;n s&oacute;ng thứ hai n&agrave;y&quot;, Ph&oacute; gi&aacute;o sư Jeremy Lim từ chương tr&igrave;nh y tế to&agrave;n cầu tại Trường Y tế c&ocirc;ng cộng Saw Swee Hock b&agrave;y tỏ quan ngại.</span></p>\n\n<h3 style=\"text-align:justify\"><span style=\"font-size:16px\"><strong>Người d&acirc;n chưa đủ &quot;quyết liệt&quot;</strong></span></h3>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><em>Reuters</em> dẫn &yacute; kiến của Michael Osterholm, một chuy&ecirc;n gia về bệnh truyền nhiễm tại Đại học Minnesota, Mỹ, cho rằng cho đến nay, c&aacute;ch tiếp cận của Singapore l&agrave; một trong những phương thức hiệu quả nhất để đối ph&oacute; với virus corona.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">D&ugrave; vậy, vấn đề m&agrave; c&aacute;c chuy&ecirc;n gia quan t&acirc;m l&agrave; tại sao &quot;chiến lược ngăn chặn&quot; của Singapore vẫn chưa thể chặn đứng ho&agrave;n to&agrave;n dịch bệnh.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Kitty Lee, người phụ tr&aacute;ch mảng khoa học đời sống v&agrave; sức khỏe ở khu vực ch&acirc;u &Aacute; - Th&aacute;i B&igrave;nh Dương của c&ocirc;ng ty tư vấn Oliver Wyman, cho hay t&igrave;nh h&igrave;nh ở Singapore hiện nay &quot;kh&aacute; đ&aacute;ng ngại&quot;. B&agrave; n&oacute;i người d&acirc;n vẫn chưa thực hiện triệt để gi&atilde;n c&aacute;ch x&atilde; hội, chỉ c&oacute; 40% nh&acirc;n vi&ecirc;n tại khu trung t&acirc;m l&agrave;m việc tại nh&agrave;. Ch&iacute;nh phủ Singapore đ&atilde; phải cảnh b&aacute;o sẽ phạt những người kh&ocirc;ng thực hiện l&agrave;m việc từ xa d&ugrave; c&oacute; thể.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Theo chuy&ecirc;n gia bệnh truyền nhiễm Leong Hoe Nam, người d&acirc;n Singapore cần &quot;quyết liệt&quot; hơn nữa trong thực hiện gi&atilde;n c&aacute;ch x&atilde; hội. &quot;Như hiện nay l&agrave; chưa đủ để chấm dứt dịch bệnh. Dịch bệnh đang tiếp tục ho&agrave;nh h&agrave;nh bởi sự thiếu &yacute; thức của người d&acirc;n&quot;, &ocirc;ng Leong n&oacute;i.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Gi&aacute;o sư Teo Yik Ying, Hiệu trưởng Trường Sức khỏe cộng đồng Saw Swee Hock thuộc Đại học Quốc gia Singapore, n&oacute;i với <em>Straits Times</em> rằng nếu người Singapore kh&ocirc;ng &quot;l&agrave;m theo những hướng dẫn đơn giản th&igrave; d&ugrave; ch&iacute;nh phủ c&oacute; &aacute;p đặt biện ph&aacute;p g&igrave; đi nữa cũng chẳng thể ngăn dịch b&ugrave;ng ph&aacute;t&quot;.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Biện ph&aacute;p gi&atilde;n c&aacute;ch x&atilde; hội đang được tăng cường ch&uacute; trọng trong bối cảnh c&oacute; nghi&ecirc;n cứu mới chỉ ra rằng Covid-19 c&oacute; thể l&acirc;y nhiễm ngay cả trước khi bệnh nh&acirc;n xuất hiện triệu chứng.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Trong một hội thảo trực tuyến của b&aacute;o <em>T&agrave;i T&acirc;n</em> (Caixin Global) h&ocirc;m 26/4, &ocirc;ng Vernon Lee, chuy&ecirc;n gia bệnh truyền nhiễm của Bộ Y tế Singapore, cho biết tỷ lệ l&acirc;y nhiễm ở Singapore l&agrave; dưới 1, c&oacute; nghĩa l&agrave; 1 người mắc l&acirc;y cho &iacute;t hơn một người kh&aacute;c. Tỉ lệ n&agrave;y tại Vũ H&aacute;n, Trung Quốc l&agrave; 2,35 trước khi th&agrave;nh phố n&agrave;y bị phong tỏa.</span></p>\n\n<table align=\"center\" class=\"picture\">\n	<tbody>\n		<tr>\n			<td style=\"text-align:justify\"><span style=\"font-size:14px\"><img alt=\"Chong dich quyet liet, vi sao Singapore van gap cu soc 1.000 ca nhiem? hinh anh 3 Tinh_trang_lay_nhiem_trong_cong_dong_moi_xuat_hien_khien_chinh_phu_Singapore_keu_goi_nguoi_dan_thuc_hien_nghiem_ngat_hon_gian_cac_xa_hoi._Anh_Nikkei_Asian_Review.jpg\" src=\"https://znews-photo.zadn.vn/w1024/Uploaded/zdhwqwqd2/2020_04_01/Tinh_trang_lay_nhiem_trong_cong_dong_moi_xuat_hien_khien_chinh_phu_Singapore_keu_goi_nguoi_dan_thuc_hien_nghiem_ngat_hon_gian_cac_xa_hoi._Anh_Nikkei_Asian_Review.jpg\" /></span></td>\n		</tr>\n		<tr>\n			<td>\n			<p style=\"text-align:justify\"><em><span style=\"font-size:14px\">T&igrave;nh trạng l&acirc;y nhiễm trong cộng đồng mới xuất hiện khiến ch&iacute;nh phủ Singapore k&ecirc;u gọi người d&acirc;n thực hiện nghi&ecirc;m ngặt hơn gi&atilde;n c&aacute;c x&atilde; hội. Ảnh: Nikkei Asian Review.</span></em></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">T&igrave;nh trạng l&acirc;y nhiễm trong cộng đồng mới xuất hiện cũng khiến ch&iacute;nh phủ Singapore phải thay đổi lập trường đối với việc đeo khẩu trang đại tr&agrave;, kh&ocirc;ng c&ograve;n khuyến c&aacute;o người d&acirc;n kh&ocirc;ng cần phải đeo khẩu trang nếu khỏe mạnh như trước đ&acirc;y.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Chuy&ecirc;n gia bệnh truyền nhiễm Leong Hoe Nam nhận định Singapore hiện đối mặt với 2 th&aacute;ch thức l&agrave; kh&ocirc;ng đủ khẩu trang cho to&agrave;n bộ d&acirc;n số v&agrave; gi&atilde;n c&aacute;ch x&atilde; hội cần thực hiện nghi&ecirc;m ngặt hơn nữa.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">&Ocirc;ng Leong lo ngại nếu kh&ocirc;ng h&agrave;nh động mạnh mẽ th&igrave; hệ thống chăm s&oacute;c sức khỏe của Singapore c&oacute; thể sẽ qu&aacute; tải bởi sự l&acirc;y nhiễm theo cấp số nh&acirc;n.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">C&ocirc;ng ty thiết bị game Razer ở Singapore mới đ&acirc;y th&ocirc;ng b&aacute;o sẽ bắt đầu sản xuất khẩu trang trong v&ograve;ng 30 ng&agrave;y, một t&iacute;n hiệu đ&aacute;ng mừng. Trong khi đ&oacute;, nhiều chuy&ecirc;n gia hy vọng lập trường cứng rắn của ch&iacute;nh phủ về l&agrave;m việc từ xa sẽ ph&aacute;t huy hiệu quả.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Theo Ph&oacute; gi&aacute;o sư Jeremy Lim, nếu c&aacute;c biện ph&aacute;p hiện nay vẫn kh&ocirc;ng thể dứt điểm dịch bệnh th&igrave; c&oacute; lẽ chỉ c&ograve;n 3 điều nữa m&agrave; ch&iacute;nh phủ Singapore c&oacute; thể l&agrave;m: đ&oacute; l&agrave; đ&oacute;ng cửa trường học, dừng c&aacute;c phương tiện giao th&ocirc;ng c&ocirc;ng cộng, v&agrave; ra lệnh cho tất cả c&aacute;c địa điểm ăn uống, trung t&acirc;m thương mại đ&oacute;ng cửa.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Đến ng&agrave;y 3/4, Thủ tướng L&yacute; Hiển Long đ&atilde; th&ocirc;ng b&aacute;o phần lớn nơi l&agrave;m việc sẽ phải đ&oacute;ng cửa từ ng&agrave;y 7/4, trong khi tất cả trường học chuyển sang chế độ học online từ xa từ ng&agrave;y 8/4.</span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\">Những nơi l&agrave;m việc được mở cửa l&agrave; nơi cung cấp c&aacute;c dịch vụ thiết yếu như cửa h&agrave;ng thực phẩm, si&ecirc;u thị, ph&ograve;ng kh&aacute;m, bệnh viện, dịch vụ giao th&ocirc;ng v&agrave; ng&acirc;n h&agrave;ng. Nh&agrave; trẻ sẽ đ&oacute;ng cửa, nhưng vẫn sẽ giữ trẻ l&agrave; con của những người vẫn phải đi l&agrave;m.</span></p>\n</div>', 'unnamed.jpg', '2021-09-28 00:00:00', 0, 1, 0, 'Tuấn Vũ', 1, 0, '2021-09-28 11:35:07', 'unnamed.jpg', NULL, NULL, 'Food,Cooktails', '1,2', NULL, NULL, NULL, NULL, ''),
(2, 'Three dead in Alps avalanche', '<p>Two French schoolchildren and a Ukrainian tourist have been killed in an avalanche at a ski resort in the French Alps, officials say.</p>\r\n', 'BBBBBBBBBBBBBBBBB', 'app_img1_mobile.jpg', '2015-01-20 00:00:00', 0, 3, 0, '', 1, 1, '2021-09-27 19:33:06', 'Call-center(1)_PC.jpg', NULL, NULL, 'Food,Bars', '1', NULL, NULL, NULL, NULL, ''),
(3, 'Carbon emissions \'postpone ice age\'', 'The next ice age may have been delayed by more than 50,000 years because of the greenhouse gases put in the atmosphere by humans, scientists in Germany say.', '123', 'certification_img2.jpg', '2015-01-20 00:00:00', 0, 2, 0, '', 0, 1, '2019-06-21 20:31:50', 'cloud_img2_mobile.jpg', NULL, NULL, 'Shops,Restaurants', '1', NULL, NULL, NULL, NULL, ''),
(10, 'Turkey car bomb hits police HQ near Diyarbakir', '<p>A car bomb blast has hit a police headquarters in south-eastern Turkey, killing six people and wounding at least 39, officials say.</p>\r\n', '<p>Five civilians including a baby were among the dead. Rescuers searched the rubble for survivors at the scene in Cinar district, Diyarbakir province.</p>\n\n<p>Officials blamed the blast on Kurdistan Worker&#39;s Party (PKK) militants, who are active in the mainly Kurdish province.</p>\n\n<p>No group has so far said it carried out the attack.<br />\n&nbsp;</p>\n\n<p>The bomb was detonated at the entrance of the Cinar district police complex, officials say. The attackers then reportedly fired rockets at the headquarters.</p>\n\n<p>The blast damaged nearby residential buildings, where a mother and her five-month-old baby were killed. A girl aged one and a five-year-old boy also died when a house collapsed.</p>\n\n<p>Another police station, in Midyat town, in neighbouring Mardin province, was also attacked by militants, according to Turkish media, but there are no reports of casualties.</p>\n\n<p><img alt=\"\" src=\"localhost:81/images/general/20160201092726news5_1.png\" style=\"height:351px; width:624px\" /><img alt=\"\" src=\"localhost:81/images/general/20160201092733news5_2.png\" style=\"height:351px; width:624px\" /></p>\n\n<p>A ceasefire between the army and the PKK collapsed in July.</p>\n\n<p>A curfew was imposed on Diyarbakir and several other towns and cities as part of a security crackdown after PKK attacks in the east that left 16 soldiers and 14 police officers dead.</p>\n\n<p><img alt=\"\" src=\"localhost:81/images/general/20160201092739news5_3.png\" style=\"height:351px; width:624px\" /></p>\n\n<p>Speaking after a suicide bombing in Istanbul blamed on Islamic State (IS) jihadists, in which 10 German tourists were killed, Mr Erdogan said the government drew no distinction between terror groups, whatever their name.</p>\n\n<p>The hashtag #1128katil (1,128 killers) was trending in Turkey on Thursday, particularly among government and nationalist supporters, apparently in reference to the academics. PM Ahmet Davutoglu condemned the overnight bomb attack and echoed the president&#39;s criticism of the petition.</p>\n\n<p>Turkish jets have bombed PKK bases in northern Iraq and the army launched a ground operation there.</p>\n\n<p>Turkey is also part of a US-led coalition that has been carrying out air strikes against Islamic State (IS) militants in Iraq and Syria.</p>\n\n<p>However, Ankara has been accused of hitting mostly PKK targets, angering Kurds who are themselves fighting IS in the two countries.</p>\n\n<h2>&#39;1,128 killers&#39;</h2>\n\n<p>There have been repeated clashes between PKK separatists and the Turkish army in recent months, but the violence has escalated in the past week.</p>\n\n<p>Civilians have been caught up in the clashes in the towns of Cizre and Silopi, close to the borders with Syria and Iraq.</p>\n\n<p>Since August, human rights activists say 170 civilians have lost their lives in areas under curfew.</p>\n\n<p>More than 1,100 Turkish and foreign academics have signed a petition calling for an end to Turkish military operations in the south-east, drawing criticism from President Recep Tayyip Erdogan.</p>', 'EcoFunc.png', '2016-02-01 00:00:00', 0, 1, 0, '', 0, 1, '2019-06-21 20:32:50', 'efunc 1.jpg', NULL, NULL, 'Bars,Shops,Cooktails', '3', NULL, NULL, NULL, NULL, ''),
(11, 'GDT data erasure solution has been certified by ADISA', '<p>Two French schoolchildren and a Ukrainian tourist have been killed in an avalanche at a ski resort in the French Alps, officials say.</p>\r\n', 'Greystone Data Technology is a trusted source of partnership in the mobile device processing and reverse logistics environments. Greystone Data Technology is proud to announce that our data erasure solutions have been further validated by the Asset Disposal &amp; Information Security Alliance (ADISA) claims test process. Our data erase process of iOS and Android mobile devices have been proven effective beyond forensic recovery. Greystone Data Technology is proud to provide our partners with additional security and one more reason to trust Greystone with your mobile device processing needs.<br />\n<br />\n<strong>About ADISA</strong><br />\n<br />\nUK&#39;s leading independent forensic research laboratory. Specializing in Data Sanitization for ITAD Data Processors, Data Controllers and OEMs. The ARC is based in Cardiff, Wales and is a specialist research center providing thought leadership, product assurance and forensic services to government and commercial sectors. Under the control of Dr Andrew Blyth, the ARC is currently the only laboratory worldwide which provides product assurance for Data Sanitization software across all media types.<br />\n<a href=\"https://adisarc.com/\">https://adisarc.com</a>', 'Banner certificate.jpg', '2019-03-03 00:00:00', 0, 3, 268, '', 1, 1, '2019-03-22 16:39:12', 'Screenshot from 2019-03-22 16-20-51.png', NULL, NULL, 'Cooktails,Restaurants', '4', NULL, NULL, NULL, NULL, ''),
(12, 'Carbon emissions \'postpone ice age\'', 'The next ice age may have been delayed by more than 50,000 years because of the greenhouse gases put in the atmosphere by humans, scientists in Germany say.', 'Nguyen Thi Hoa', 'logo-adisa.png', '2019-03-21 00:00:00', 0, 2, 132, 'nth', 0, 1, '2019-06-21 20:32:00', 'cloud_img1_mobile.jpg', NULL, NULL, 'Cooktails', '5', NULL, NULL, NULL, NULL, ''),
(13, 'US thanks Iran for freeing sailors', 'The US thanks Iran for the swift release of 10 sailors held for entering its waters, an incident which could have held up implementation of a nuclear deal.', 'Noi dung chinh', 'index.jpeg', '2019-03-21 00:00:00', 0, 4, 0, 'test', 0, 1, '2019-06-21 20:32:12', 'Group copy.png', NULL, NULL, 'Restaurants', '6', NULL, NULL, NULL, NULL, ''),
(14, '123', 'The US thanks Iran for the swift release of 10 sailors held for entering its waters, an incident which could have held up implementation of a nuclear deal.', 'The US thanks Iran for the swift release of 10 sailors held for entering its waters, an incident which could have held up implementation of a nuclear deal.', 'photo_2019-05-31_12-20-52.jpg', '2019-06-21 18:53:09', 0, NULL, 1, '', 0, 1, NULL, 'photo_2019-05-31_12-20-52.jpg', NULL, NULL, 'Restaurants', '1,7', NULL, NULL, NULL, NULL, ''),
(15, 'Dũng \"Trọc\" bị Công an TP Hòa Bình bắt', NULL, '<p>Dũng &quot;Trọc&quot; bị C&ocirc;ng an TP H&ograve;a B&igrave;nh bắt quả tang khi đang tổ chức sử dụng ma t&uacute;y tại một qu&aacute;n karaoke tr&ecirc;n địa b&agrave;n.</p>\n\n<div class=\"the-article-body\">\n<p>S&aacute;ng 12/9, trao đổi với <em>Zing</em>, C&ocirc;ng an TP <a class=\"topic location autolink quickview\" href=\"https://zingnews.vn/tieu-diem/hoa-binh.html\">H&ograve;a B&igrave;nh</a> cho biết đang tạm giữ Nguyễn Văn Dũng (52 tuổi, tức Dũng &quot;Trọc&quot;) để điều tra về h&agrave;nh vi Tổ chức sử dụng tr&aacute;i ph&eacute;p chất ma t&uacute;y.</p>\n\n<p>&quot;Ch&uacute;ng t&ocirc;i bắt Dũng khi anh ta đang tổ chức sử dụng ma t&uacute;y tại một qu&aacute;n karaoke&quot;, đại diện C&ocirc;ng an TP H&ograve;a B&igrave;nh cho hay.</p>\n\n<table align=\"right\" class=\"picture\">\n	<tbody>\n		<tr>\n			<td><img alt=\"Dung troc Ha Dong bi bat anh 1\" src=\"https://znews-photo.zadn.vn/w660/Uploaded/ngotgs/2020_09_11/z2072214536584_af2d6bec7335bff9e4dbe676ba46c899.jpg\" title=\"Dũng trọc Hà Đông bị bắt ảnh 1\" /></td>\n		</tr>\n		<tr>\n			<td>\n			<p>H&igrave;nh ảnh của Dũng &quot;Trọc&quot;. Ảnh: <em>FBNV.</em></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Dũng &quot;Trọc&quot; c&oacute; quan hệ th&acirc;n thiết với c&aacute;c &quot;giang hồ mạng&quot; như: Huấn Hoa Hồng, Kh&aacute; Bảnh, Dương Minh Tuyền... Dũng cũng thường livestream tr&ecirc;n Facebook c&aacute; nh&acirc;n khoe khoang t&agrave;i sản.</p>\n\n<p>Năm 2013, &ocirc;ng ta bị phạt 24 th&aacute;ng t&ugrave; về tội G&acirc;y rối trật tự c&ocirc;ng cộng do li&ecirc;n quan vụ nổ s&uacute;ng ở vũ trường Next Top. Sau khi ra t&ugrave;, Dũng &quot;Trọc&quot; trở th&agrave;nh &quot;hiện tượng&quot; mạng x&atilde; hội với h&agrave;ng chục ngh&igrave;n lượt đăng k&yacute; theo d&otilde;i.</p>\n</div>', '95801398_1118866368489375_8537126985548169216_o.jpg', '2020-09-12 12:49:21', 0, NULL, 0, '', 0, 0, NULL, '95801398_1118866368489375_8537126985548169216_o.jpg', NULL, NULL, 'Restaurants,Transports', '2', NULL, NULL, NULL, NULL, ''),
(16, 'Ca sĩ Choi Yun Jin bán cà phê để kiếm sống', NULL, '<p>Cựu thần tượng nh&oacute;m TINT tiết lộ từ bỏ ước mơ l&agrave;m ca sĩ, chuyển sang kinh doanh qu&aacute;n c&agrave; ph&ecirc; v&igrave; thực tế khắc nghiệt.</p>\n\n<div class=\"the-article-body\">\n<p>Tr&ecirc;n <em>Newsen,</em> cựu th&agrave;nh vi&ecirc;n nh&oacute;m TINT - Choi Yun Jin chia sẻ video về cuộc sống h&agrave;ng ng&agrave;y. Video nhận được sự quan t&acirc;m của cộng đồng mạng H&agrave;n Quốc.</p>\n\n<p>Trong video, Yun Jin tiết lộ c&ocirc; đ&atilde; quản l&yacute; một qu&aacute;n c&agrave; ph&ecirc; khoảng hai năm với bạn của m&igrave;nh. Họ l&agrave; bạn th&acirc;n từ thời tiểu học v&agrave; quyết định c&ugrave;ng nhau mua lại qu&aacute;n c&agrave; ph&ecirc; để kinh doanh. Yun Jin từng l&agrave; th&agrave;nh vi&ecirc;n TINT, nh&oacute;m nhạc n&agrave;y tan r&atilde; v&agrave;o năm 2015.</p>\n\n<p>&quot;Những người kh&aacute;c đang theo đuổi giấc mơ của họ. T&ocirc;i cũng từng như thế v&agrave; b&acirc;y giờ t&ocirc;i theo đuổi thực tế&quot;, c&ocirc; chia sẻ.</p>\n\n<table align=\"center\" class=\"picture\">\n	<tbody>\n		<tr>\n			<td>\n			<div class=\"zad-inimage-wrapper\" style=\"overflow: hidden;\"><img alt=\"than tuong Kpop tu bo uoc mo anh 1\" src=\"https://znews-photo.zadn.vn/w660/Uploaded/bzivoxbp/2020_09_12/Webp.net_resizeimage_2.jpg\" title=\"thần tượng Kpop từ bỏ ước mơ ảnh 1\" /></div>\n			</td>\n		</tr>\n		<tr>\n			<td>\n			<p>Choi Yun Jin l&agrave; cựu th&agrave;nh vi&ecirc;n nh&oacute;m nhạc nữ TINT, tan r&atilde; năm 2015.</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>C&ocirc; chia sẻ phải bắt đầu ng&agrave;y mới sớm hơn mọi người v&igrave; qu&aacute;n c&agrave; ph&ecirc; nằm ở Yeouido, khu vực tập trung nhiều nh&acirc;n vi&ecirc;n t&agrave;i ch&iacute;nh ng&acirc;n h&agrave;ng. Yun Jin di chuyển bằng phương tiện c&ocirc;ng cộng trước 7 giờ s&aacute;ng để mở qu&aacute;n c&agrave; ph&ecirc; trước giờ đi l&agrave;m của kh&aacute;ch h&agrave;ng. Sau khi mở cửa qu&aacute;n c&agrave; ph&ecirc;, c&ocirc; sẽ mang những hộp tr&aacute;i c&acirc;y nặng từ trong kho để chuẩn bị đồ uống đ&oacute;n kh&aacute;ch.</p>\n\n<p>Cựu thần tượng tiết lộ m&igrave;nh phải từ bỏ giấc mơ l&agrave;m ca sĩ khi đối mặt với thực tế. L&agrave;ng <a class=\"topic normal autolink\" href=\"https://zingnews.vn/tieu-diem/giai-tri-han-quoc-kpop.html\" title=\"Tin tức Giải trí Hàn Quốc\">giải tr&iacute; H&agrave;n Quốc</a> nổi tiếng khắc nghiệt, nhiều c&aacute;m dỗ, kh&ocirc;ng dễ d&agrave;ng để vươn l&ecirc;n trở th&agrave;nh ng&ocirc;i sao.</p>\n\n<p>Video nhanh ch&oacute;ng lan truyền v&agrave; nhận được hơn 2,5 triệu lượt xem. Ph&iacute;a dưới video, nhiều cư d&acirc;n mạng tỏ &yacute; khen ngợi v&agrave; cổ vũ nữ doanh nh&acirc;n trẻ v&igrave; l&agrave;m việc chăm chỉ để giữ cho qu&aacute;n c&agrave; ph&ecirc; của m&igrave;nh mở cửa.</p>\n\n<table align=\"center\" class=\"picture\">\n	<tbody>\n		<tr>\n			<td><img alt=\"than tuong Kpop tu bo uoc mo anh 2\" src=\"https://znews-photo.zadn.vn/w660/Uploaded/bzivoxbp/2020_09_12/1599844568_cafe.jpg\" title=\"thần tượng Kpop từ bỏ ước mơ ảnh 2\" /></td>\n		</tr>\n		<tr>\n			<td>\n			<p>Choi Yun Jin l&agrave;m việc chăm chỉ để chuẩn bị mở cửa qu&aacute;n c&agrave; ph&ecirc;.</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Cư d&acirc;n mạng b&igrave;nh luận: &quot;C&aacute;i t&acirc;m l&agrave;m việc cũng đẹp đẽ như vẻ ngo&agrave;i của c&ocirc; ấy vậy&quot;, &quot;Thật tuyệt vời khi c&ocirc; ấy d&aacute;m l&agrave;m những g&igrave; m&igrave;nh muốn ở độ tuổi trẻ như vậy. Điều h&agrave;nh một qu&aacute;n c&agrave; ph&ecirc; vốn kh&ocirc;ng dễ d&agrave;ng&quot;...</p>\n\n<p>TINT l&agrave; nh&oacute;m nhạc nữ 5 th&agrave;nh vi&ecirc;n, thuộc quyền quản l&yacute; của GH Entertainment. Nh&oacute;m ra mắt năm 2013 với ca kh&uacute;c <em>Love At First Sight.</em> Một năm sau, họ comeback với ca kh&uacute;c <em>Wolf Is Stupi</em><em>d</em>, đi theo h&igrave;nh tượng c&ocirc; b&eacute; qu&agrave;ng khăn đỏ dễ thương.</p>\n\n<p>Tuy nhi&ecirc;n, v&igrave; h&igrave;nh tượng c&oacute; phần trẻ con, lại đến từ c&ocirc;ng ty nhỏ n&ecirc;n TINT kh&ocirc;ng thể trụ lại trong Kpop. Kh&ocirc;ng l&acirc;u sau ng&agrave;y ph&aacute;t h&agrave;nh single thứ hai, nh&oacute;m nhạc tuy&ecirc;n bố tan r&atilde;. C&aacute;c th&agrave;nh vi&ecirc;n đều c&oacute; kế hoạch ri&ecirc;ng để ph&aacute;t triển sự nghiệp.</p>\n</div>', '95570885_1117370788638933_458381475587293184_n.jpg', '2020-09-12 12:50:08', 0, NULL, 0, '', 0, 0, NULL, '95570885_1117370788638933_458381475587293184_n.jpg', NULL, NULL, 'Restaurants', '3', NULL, NULL, NULL, NULL, ''),
(27, '11', '', '<p>11</p>', '95570885_1117370788638933_458381475587293184_n.jpg', '2020-09-12 00:00:00', 0, NULL, 0, '11', 1, 1, '2022-05-19 13:16:46', '95570885_1117370788638933_458381475587293184_n.jpg', NULL, NULL, 'Transports', '4', NULL, NULL, NULL, NULL, ''),
(28, 'Những mẹo giúp bạn dễ dàng trúng tuyển', 'Bạn nên chuẩn bị kiến thức thật tốt cho buổi phỏng vấn mà bạn sắp tham gia. Tìm hiểu về nhiệm vụ, chức năng, các công việc liên quan tới công việc ứng tuyển của bạn.', '<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>1. Kiến thức - Niểm tin</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Bạn nên chuẩn bị kiến thức thật tốt cho buổi phỏng vấn mà bạn sắp tham gia. Tìm hiểu về nhiệm vụ, chức năng, các công việc liên quan tới công việc ứng tuyển của bạn. Bạn có thể tìm hiểu ở nhiều kênh kiến thức khác nhau như trên mạng internet, từ người thân, bạn bè có kinh nghiệm hoạt động trong lĩnh vực đó, từ công ty, tập đoàn lớn. Bạn càng chuẩn bị kĩ, nhiều kiến thức thì sẽ rất tự tin trong buổi phỏng vấn.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>2. Câu hỏi giao tiếp</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Bạn cũng không nên quá chú trọng vào những kiến thức chuyên môn. Ngoài ra mình cũng có thể chuẩn bị trước một số câu hỏi giao tiếp đơn giản với nhà tuyển dụng. Bạn nên nhờ người thân, bạn bè hỏi những câu hỏi giao tiếp đơn giản và chuẩn bị sẵn những câu trả lời thật tốt để chứng tỏ bạn là người giao tiếp với đồng nghiệp tốt trong công việc. Bạn cũng không nên hỏi hoặc thắc mắc quá nhiều về công việc và công ty, chỉ nên đặt câu hỏi và sự kiến chính.</span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:center\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><img alt=\"\" src=\"http://vieclammiennam.vn/img_data/files/featured.jpg\" style=\"height:480px; width:679px\" /></span></span></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>3. Câu hỏi khó</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Khi gặp những câu hỏi khó về chuyên môn, bạn nên thẳng thắn chia sẽ về kiến thức hoặc kinh nghiệm của mình về vấn đề trên. Không nên nói dối hoặc im lặng, bạn sẽ biến những thiếu sót, điểm yếu của mình thành điểm mạnh để trả lời nhà tuyển dụng. Ví dụ khi gặp câu hỏi `Bạn hãy chia sẽ về điểm yếu của mình trong công việc?`, bạn hãy chọn lấy 1 điểm yếu của bạn thân và biến nó thành điểm mạnh `Tôi là một người thiếu kiên nhẫn trong công việc, chỉ vì bản thân tôi luôn muốn hoàn thành công việc được giao đúng hẹn.`</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>4. Chuẩn bị những câu hỏi</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Bạn cũng nên chuẩn bị cho mình một số câu hỏi để chứng minh mình là người có tư duy và biết phản biện. `Tôi có thể không nhận phần này không?` nếu nhà tuyển dụng không muốn nhắc đến vấn đề trên, đó là cơ hội để bạn tìm hiểu thêm về vấn đề đấy.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>5. Chuẩn bị về trang phục</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Bạn nên chọn 1 bộ quần áo mặc đi phỏng vấn làm sao để thấy được sự chuyên nghiệp, gọn gàng. Bạn cũng nên tìm hiểu về văn hóa của công ty để ăn mặc phù hợp khi đi phỏng vấn. Bạn nên chọn những bộ đồ thoải mái, không nên quá cầu kì. Bạn cũng nên mặc vét đi phỏng vấn.</span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>', 'featured.jpg', '2021-11-09 10:11:25', 0, NULL, 214, 'Admin', 1, 1, '2021-12-13 14:01:36', 'featured.jpg', NULL, NULL, 'Transports', '5', NULL, NULL, NULL, NULL, ''),
(29, 'Có tốt hay không việc làm mãi ở 1 công ty?', 'Với muôn vàn lý do được đưa ra cho lý do trên như: công việc ổn định, đồng nghiệp, chính sách công ty,... Nhưng mọi người không thể cãi được là lý do chính yếu của vấn đề trên là cá nhân bạn rất sợ rủi ro khi chuyển công ty mới.', '<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>Vấn đề làm lâu năm ở 1 công ty luôn được mọi người đặt ra. Vậy việc làm cố định lâu năm tại 1 công ty có tốt hay không? Bạn nghĩ sao về ý kiến trên?</strong></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Với muôn vàn lý do được đưa ra cho lý do trên như: công việc ổn định, đồng nghiệp, chính sách công ty,... Nhưng mọi người không thể cãi được là lý do chính yếu của vấn đề trên là cá nhân bạn rất sợ rủi ro khi chuyển công ty mới. Không phải bắt buộc hay đúng với mọi trường hợp, nhưng tôi khuyên bạn sau khi làm việc 3-4 năm tại 1 công ty, bạn nên nhìn lại chặng đường mà mình đã đi để đánh giá sự nghiệp của mình. Với kinh nghiệm của bạn thân, tôi xin chia sẽ một số lợi ích khi bạn chuyển công ty mới:</span></span></p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Nâng cao khả năng thích nghi với công việc mới, trình độ bản thân.</span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Nâng cao khả năng giao tiếp, phỏng vấn của bạn.</span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Nhận biết được giá trị của bản thân.</span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Mở rộng các mối quan hệ đồng nghiệp trên lĩnh vực công việc của bản thân.</span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Nâng cao mức thu nhập của bản thân khi tham gia 1 môi trường công ty mới.</span></span></li>\n</ul>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:center\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><img alt=\"\" src=\"http://vieclammiennam.vn/img_data/files/co-nen-tim-viec-lam-online-7.jpeg\" style=\"height:418px; width:650px\" /></span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Lời khuyên trên phải luôn đúng với mọi người, tuy nhiên bạn hãy cho bản thân 1 cơ hội để phát triển trong lịnh vực, công việc mà bạn theo đuổi và đam mê. Nếu công ty luôn tạo điều kiện cho bạn phát triển trong tương lai và có thể gắn bó lâu dài, bạn nên cân nhắc việc ở lại công ty và đóng góp 1 cách tích cực vào sự phát triển chung.</span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Sự nghiệp của bạn là do bạn quyết định, hãy là 1 người lái đò tuyệt vời để lèo lái cuộc sống của bạn đến những nơi tốt đẹp và hành phúc nhất. Đừng lo rủi ro, hãy suy nghĩ cơi mở và chúc bạn sẽ thành công trong tương lai nhé.</span></span></p>', 'co-nen-tim-viec-lam-online-7.jpeg', '2021-12-09 08:50:30', 0, NULL, 116, 'Admin', 1, 1, '2021-12-13 14:02:08', 'co-nen-tim-viec-lam-online-7.jpeg', NULL, NULL, 'Transports', '6', NULL, NULL, NULL, NULL, ''),
(30, 'TOP 5 câu trả lời bạn không nên dùng trong buổi phỏng vấn', 'Bạn không nên kể quá chi tiết về gia đình của mình ngay trong buổi phỏng vấn đầu tiên, vì đó sẽ là cơ sở để công ty quyết định những định hướng, chế độ cho bạn khi bạn được nhận.', '<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>1. Giới thiệu bản thân</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Bạn không nên kể quá chi tiết về gia đình của mình ngay trong buổi phỏng vấn đầu tiên, vì đó sẽ là cơ sở để công ty quyết định những định hướng, chế độ cho bạn khi bạn được nhận. Khi gặp những loại câu hỏi về công việc cũ của bản thân, bạn nên liệt kế các kinh nghiệm đã có được ở công việc cũ và bạn sẽ áp dụng chúng vào công việc mới như thế nào. Nếu còn thời gian, bạn có thể giới thiệu 1 vài sở thích, sở trường của mình.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>2. Kiến thức của ứng viên về công ty tuyển dụng</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Việc bạn không nghiên cứu kĩ về công ty cũng như công việc ứng tuyển tại công sẽ là 1 điểm trừ lớn trong buổi phỏng vấn của bạn. Bạn sẽ bị đánh giá là lười biếng, ứng tuyển cho vui. Vì thế hãy nghiên cứu thật kĩ về công ty, định hướng công ty, công việc và sản phẩm công ty. Có rất nhiều thứ bạn có thể tìm được về công ty trên internet, nhưng bạn chỉ cần chú trọng vào 1 vài vấn đề chính, đừng quá dài dòng.</span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vieclammiennam.vn/img_data/files/dai-su-quan-nhat-goi-phong-van2.jpg\" style=\"height:366px; width:650px\" /></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>3. Điểm mạnh</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Bạn hãy chọn cho mình 1 điểm mạnh và lên kế hoạch thật kĩ cho câu trả lời của bạn thân. Việc tích cực liên kết, làm việc nhóm trong công việc luôn là ưu tiên hàng đầu của các nhà tuyển dụng hiện nay. Bạn hãy chứng mình là bản thân đã liên kết, hợp tác giữa các nhóm/bộ phân trong công ty cũ như thế nào để đạt được những thành công trong công việc.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>4. Điểm yếu</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Với những chia sẽ trung thực về các điểm yếu của bạn thân, bạn sẽ nhận được những dấu hiệu tích cực từ nhà tuyển dụng. Nhưng bạn phải biết vận dụng điểm yếu đầu trở thành thế mạnh và áp dụng vào công việc trong tương lai. Đừng trả lời rằng điểm yếu đó sẽ đi theo mình qua môi trường làm việc mới, mà hãy nói rằng nó sẽ giúp ích cho mình hoàn thiện bản thân hơn khi làm việc lâu dài.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>5. Vị trí của bạn trong tương lai</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Những ứng viên có suy nghĩ luôn hướng lên phía trước sẽ được nhà tuyển dụng quan tâm. Bạn đừng chia sẽ mình sẽ làm công việc như vậy trong tương lai, mà hãy nói mình luôn muốn phát triển và đạt được 1 vị trí cao hơn khi làm việc tại công ty. Những dấu hiệu tích cực trên sẽ giúp bạn ghi điểm khá nhiều trong mắt nhà tuyển dụng.</span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Chúc bạn có 1 buổi phóng vấn thành công!</span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>', 'dai-su-quan-nhat-goi-phong-van2.jpg', '2021-10-26 04:15:00', 0, NULL, 302, 'Admin', 1, 1, '2021-12-13 14:02:17', 'dai-su-quan-nhat-goi-phong-van2.jpg', NULL, NULL, 'Transports', '1', NULL, NULL, NULL, NULL, ''),
(31, 'Những nỗi khổ của người xuất khẩu lao động', 'Với mong muốn có thật nhiều tiền để đổi đời, hầu hết mọi người lao động đều mong muốn được đi xuất khẩu lao động để kiếm được thu nhập tốt cho bản thân và gia đình và Nhật Bản ', '<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Với mong muốn có thật nhiều tiền để đổi đời, hầu hết mọi người lao động đều mong muốn được đi xuất khẩu lao động để kiếm được thu nhập tốt cho bản thân và gia đình và Nhật Bản luôn là quốc gia được nhiều người lựa chọn. Mất một số tiền lớn để đi xuất khẩu lao động, tôi hoàn toàn vở mộng với những gì phải trải qua.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>Những khó khăn về cuộc sống</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Hết giờ làm việc, mọi người lao động từ Việt Nam qua Nhật Bản làm việc đều như tôi, đều được sắp xếp 1 căn phòng trọ mà công ty trợ cấp. Căn phòng chỉ rộng khoảng 15m2 dành cho 4 người ở. Mức lương bên Nhật kể cả tăng ca sẽ được hưởng từ 25-30 triệu, trừ hết tiền nhà, điện, nước, ăn uống ra thì tôi dư khoảng 10 triệu tiền tiết kiệm hàng tháng để gửi về cho gia đình. Ở Việt Nam thì số tiền đó là lớn, nhưng không ai biết được những gì tôi phải trải qua là cái giá qúa đắt.</span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vieclammiennam.vn/img_data/files/aa.jpg\" style=\"height:433px; width:650px\" /></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Chúng tôi phải thức dậy lúc 5h30 sáng và làm việc đến 23h mỗi ngày, có ngày đi làm dưới cái lạnh -2 độ C chỉ khi có bão lớn hay lũ lụt ảnh hưởng đến tính mạng con người thì chúng tôi mới được nghỉ, còn lại vẫn phải đi làm bình thường.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>Quy tắc ở những công ty Nhật</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Người Nhật rất quy cũ và nghiêm khắc với bộ quy tắc của mình. Trong công ty thường có những quy tắc, quy định rất nghiêm, đó là lý do nhiều người lao động như chúng tôi cảm thấy mệt mỏi và bị stress thời gian đầu khi qua đây làm việc. Ai cũng mong muốn kết thúc 1 ngày làm việc thật nhanh để ra khỏi công ty.</span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Nhưng cuộc sống vốn dĩ luôn phải đánh đổi để có được thứ mình mong muốn, chúng tôi ai cũng cố gắng lao động để có được tiền gửi về cho gia đình, người thân. Ai cũng mong được kết thúc 1 năm làm việc để Tết được về Việt Nam thăm gia đình và đó là động lực to lớn nhất để mọi người cùng vượt qua khó khăn.</span></span></p>', 'aa.jpg', '2021-12-07 09:14:14', 0, NULL, 95, 'Admin', 1, 1, '2021-12-13 14:02:26', 'aa.jpg', NULL, NULL, 'Transports', '1', NULL, NULL, NULL, NULL, ''),
(32, 'Những tính cách sẽ gây phiền cho bạn trong công ty', 'Đây là tính cách đầu tiên bạn cần phải bỏ khi làm việc tập thể. Nóng giận luôn đi kèm với sự kém khôn ngoan, điều đó sẽ làm bạn bị mất điểm với những đồng nghiệp của mình. Bản phải luôn làm chủ', '<h1 style=\"text-align:justify\"><span style=\"font-family:arial,helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Tức giận</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-family:arial,helvetica,sans-serif\"><span style=\"font-size:14px\">Đây là tính cách đầu tiên bạn cần phải bỏ khi làm việc tập thể. Nóng giận luôn đi kèm với sự kém khôn ngoan, điều đó sẽ làm bạn bị mất điểm với những đồng nghiệp của mình. Bản phải luôn làm chủ được cảm xúc của bản thân trong giải quyết công việc, việc bản tỏ ra nóng giận sẽ chẳng giúp ích được gì trong công việc chung của công ty.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-family:arial,helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Kiêu ngạo</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-family:arial,helvetica,sans-serif\"><span style=\"font-size:14px\">Mặc dù bản thân bạn là người rất giỏi và năng động trong công việc, nhưng việc bạn kiêu ngạo quá mức cần thiết với bạn bè đồng nghiệp, nhận hết mọi công lao, ưu điểm của công việc về mình sẽ làm bạn ngày càng bị tách ra ngoài nhóm hoạt động công việc của mình. Có những công việc cần phải hoạt động theo nhóm để hoàn thành, vì vậy bạn nên chủ động giao tiếp, khiêm tốn để cùng đồng nghiệp hoàn thành tốt công việc của mình.</span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vieclammiennam.vn/img_data/files/interviewing-skills-training-course.jpg\" style=\"height:406px; width:650px\" /></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-family:arial,helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Cẩu thả</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-family:arial,helvetica,sans-serif\"><span style=\"font-size:14px\">Bạn có thể biết mình sẽ thực hiện được công việc đó một cách nhanh gọn và thành công, nhưng vì bản tính cẩu thả bạn làm mọi chuyện trở nên rắc rối và thất bại và đó là 1 tính cách không nên có trong công việc. Khi bạn nhận 1 nhiệm vụ từ công ty, bạn phải tìm hiểu và làm bằng trách nhiệm của bản thân, không chỉ làm đối phó mà phải thành công để chứng minh năng lực bản thân với đồng nghiệp và sếp. Hãy luôn chuẩn bị cho mình 1 tư thế sẵn sàng tiếp nhận mọi công việc được giao.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-family:arial,helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Đứng núi này, trông núi nọ</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-family:arial,helvetica,sans-serif\"><span style=\"font-size:14px\">Khi bạn làm việc trong 1 tập thể, 1 công ty bạn nên biết mình đang ở đâu và vị trí cụ thể phù hợp với năng lực của bản thân. Thay vì bạn luôn đi nói xấu người đang đứng ở vị trí mình mong muốn để có ý làm giảm uy tín, hệ bệ họ thì bạn nên chứng mình thực lục của bạn thân mình 1 cách tích cực hơn. Hãy lấy kiến thức, tài năng của mình là vũ khí để mình đạt được mọi thành công trong công việc.</span></span></p>', 'interviewing-skills-training-course.jpg', '2021-11-30 07:13:13', 0, NULL, 12, 'Admin', 1, 1, '2021-12-13 14:02:34', 'interviewing-skills-training-course.jpg', NULL, NULL, 'Transports', '1', NULL, NULL, NULL, NULL, '');
INSERT INTO `ecommerce_news` (`id`, `news_title`, `news_summary`, `news_content`, `news_image`, `date_created`, `isdelete`, `news_priority`, `views_number`, `author`, `popular`, `isshow`, `date_update`, `news_image_right`, `news_image_mobile`, `news_image_mobile_right`, `tag`, `categories`, `news_title_vn`, `news_summary_vn`, `news_content_vn`, `link`, `keyword`) VALUES
(33, 'Cách giải quyết mâu thuẩn trong công việc', 'Việc mâu thuẩn giữa các thành viên trong nhóm là điều hết sức bình thường, các ý kiến trái chiều được đưa ra cho 1 vấn đề sẽ gây tranh cãi gay gắt, nhằm đến những sáng tạo, phát triển cho dự án ', '<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Việc mâu thuẩn giữa các thành viên trong nhóm là điều hết sức bình thường, các ý kiến trái chiều được đưa ra cho 1 vấn đề sẽ gây tranh cãi gay gắt, nhằm đến những sáng tạo, phát triển cho dự án công ty là điều đang quý trọng. Nhưng bạn nên biết việc tranh cải để giải quyết công việc không để vược quá giới hạn làm mâu thuẫn sâu sắc giữa các thành viên trong công ty.</span></span></p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>Hãy lắng nghe</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Khi mọi chuyện đã đang đi quá giới hạn, bạn nên là người lắng xuống và lắng nghe ý kiến của mọi người. Đừng giả vờ nghe rồi cho qua, việc đó sẽ chỉ làm mọi chuyện thêm tồi tệ. Bạn hãy tỏ thái độ cởi mở, cho đồng nghiệp 1 vài lời khuyên những điều đó sẽ giúp buổi tranh luận giảm dần mâu thuẩn và giải quyết được mọi việc 1 cách hiệu quả.</span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Về phía mình, bạn nên chia sẽ cho mọi người nghe về vấn đề của mình đừng chỉ đổ lỗi cho người khác mà hãy thành thật nhận lỗi về mình nếu bạn mắc sai lầm.</span></span></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vieclammiennam.vn/img_data/files/images(1).jpeg\" style=\"height:432px; width:650px\" /></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<h1 style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>Tình hình trở nên tệ hơn</strong></span></span></h1>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Nếu đồng nghiệp của bạn tỏ ra quá khích, bạn nên yêu cầu đừng buổi thảo luận và đi ra ngoài. Bạn có thể bắt đầu lại buổi thảo luận bằng những cách giao tiếp khác như dùng giấy, bảng con để trò chuyển nhằm giảm sự căng thẳng của mọi người hoặc nhờ 1 người thứ ba giải quyết những mẫu thuẩn giữa 2 người. Bạn không quá cho mình luôn đúng, hiểu biết hơn điều đó có thể làm mọi thứ tồi tệ.</span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\"><strong>Đưa ra giải pháp</strong></span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:arial,helvetica,sans-serif\">Khi mọi thứ đã được giải quyết và làm rõ, sử dụng những thông tin của bạn trong buổi nói chuyện để đưa ra giải pháp khắc phục, giúp không để tái diễn tình trạng này nữa. Nếu đồng nghiệp của bạn không đồng ý với cách giải quyết đấy của bạn, thì bạn nên phân tích hiểu rõ vì sao và cố chèo kéo về phía mình.</span></span></p>', 'images.jpeg', '2021-12-13 13:23:21', 0, NULL, 123, 'Admin', 1, 1, '2021-12-13 14:02:42', 'images.jpeg', NULL, NULL, 'Transports', '3', NULL, NULL, NULL, NULL, ''),
(34, 'AAAAAAAAACCC', 'BBBBBBBBBCCC', '<p>AAAAAAAAAAAA</p>', 'luca-bravo-zAjdgNXsMeg-unsplash.jpg', '2022-05-09 00:00:00', 0, NULL, 0, 'Admin', NULL, 1, '2022-11-01 15:33:58', 'jaanus-jagomagi-8_q9cHYKLhM-unsplash.jpg', NULL, NULL, NULL, NULL, 'CCCCCCCCCCCC33333', 'CCCCCCCCCCCC', '<p>VVVVVVVVVVVVVVVVVV</p>', 'cccccccccccc33333', ''),
(35, 'aaaaaaaaaaaaaaaaaaaa', '12', '<p>3333</p>', '02437_banner_en.png', '2022-11-02 09:30:56', 1, NULL, 0, '1', 1, 1, NULL, '02437_banner_vi.png', NULL, NULL, NULL, NULL, 'bbbbbbbbbbbbbbbbbbbbbb', '12', '<p>33333</p>', 'bbbbbbbbbbbbbbbbbbbbbb', NULL),
(36, '111111', '2222', '<p>1</p>', 'auth-bg.jpg', '2022-11-02 09:40:51', 1, NULL, 0, NULL, NULL, NULL, NULL, '16558695914.jpg', NULL, NULL, NULL, NULL, '2222222', '1', '<p>1</p>', '2222222', NULL),
(37, '3333', '1', '<p>1</p>', '02437_banner_vi.png', '2022-11-02 13:32:17', 0, NULL, 0, NULL, NULL, NULL, NULL, '02437_banner_vi.png', NULL, NULL, NULL, NULL, '44444', '1', '<p>1</p>', '44444', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_news_categories`
--

CREATE TABLE `ecommerce_news_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_news_categories`
--

INSERT INTO `ecommerce_news_categories` (`id`, `name`, `isdelete`) VALUES
(1, 'Food', 0),
(2, 'Places to visit', 0),
(3, 'New Places', 0),
(4, 'Suggestions and guides', 0),
(5, 'Transports', 0),
(6, 'Restaurants', 0),
(7, 'Bars', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_product`
--

CREATE TABLE `ecommerce_product` (
  `id` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `list_img` text DEFAULT NULL,
  `price` double(10,0) NOT NULL,
  `isdelete` tinyint(1) DEFAULT 0,
  `isshow` tinyint(1) DEFAULT 1,
  `user_created` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `ishot` tinyint(1) DEFAULT 0,
  `isnew` tinyint(1) DEFAULT 0,
  `qty_instock` int(11) DEFAULT NULL,
  `user_update` varchar(45) DEFAULT NULL,
  `date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_product`
--

INSERT INTO `ecommerce_product` (`id`, `name`, `code`, `image`, `list_img`, `price`, `isdelete`, `isshow`, `user_created`, `date_created`, `ishot`, `isnew`, `qty_instock`, `user_update`, `date_update`) VALUES
(1, 'X Armor Air X Fear', '3DcAM01', '', '', 300, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 1, 30, 'root', '2022-05-27 13:18:28'),
(2, 'Y Armor Air Y Fear', 'USB02', '', '', 120, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 1, 0, 'root', '2022-05-18 16:27:31'),
(3, 'Z Armor Air Z Fear', 'wristWear03', '', '', 50, 0, 1, 'tuanva', '2022-02-19 00:00:00', 0, 1, 2, NULL, NULL),
(4, 'D Armor Air D Fear', 'LPN45', '', '', 600, 0, 1, 'tuanva', '2022-02-19 00:00:00', 0, 1, 500, NULL, NULL),
(5, 'A Armor Air D Fear', 'LPN47', '', '', 550, 0, 1, 'tuanva', '2022-02-19 00:00:00', 0, 1, 500, NULL, NULL),
(6, 'B Armor Air D Fear', 'LPN48', '', '', 725, 0, 1, 'tuanva', '2022-02-19 00:00:00', 0, 1, 500, NULL, NULL),
(7, 'C Armor Air D Fear', 'LPN49', '', '', 865, 0, 1, 'tuanva', '2022-02-19 00:00:00', 0, 1, 500, NULL, NULL),
(8, 'I Armor Air D Fear', 'LPN50', '', '', 333, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(9, 'F Armor Air D Fear', 'LPN51', '', '', 264, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(10, 'G Armor Air D Fear', 'LPN52', '', '', 875, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(11, 'H Armor Air D Fear', 'LPN53', '', '', 456, 0, 1, 'tuanva', '2022-02-19 00:00:00', 0, 1, 500, NULL, NULL),
(12, 'J Armor Air D Fear', 'LPN54', '', '', 987, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(13, 'M Armor Air D Fear', 'LPN55', '', '', 563, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(14, 'N Armor Air D Fear', 'LPN56', '', '', 324, 0, 1, 'tuanva', '2022-02-19 00:00:00', 0, 1, 500, NULL, NULL),
(15, 'O Armor Air D Fear', 'LPN57', '', '', 521, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(16, 'P Armor Air D Fear', 'LPN58', '', '', 523, 0, 1, 'tuanva', '2022-02-19 00:00:00', 0, 1, 500, NULL, NULL),
(17, 'Q Armor Air D Fear', 'LPN59', '', '', 852, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(18, 'E Armor Air D Fear', 'LPN60', '', '', 4562, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(19, 'R Armor Air D Fear', 'LPN61', '', '', 698, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(20, 'T Armor Air D Fear', 'LPN62', '', '', 753, 0, 1, 'tuanva', '2022-02-19 00:00:00', 1, 0, 500, NULL, NULL),
(25, '123', 'MC2FM022700', '', '', 123, 1, 1, 'root', '2022-05-18 13:27:40', 1, 1, 123, 'root', '2022-05-18 15:36:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_product_brand`
--

CREATE TABLE `ecommerce_product_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_product_brand`
--

INSERT INTO `ecommerce_product_brand` (`id`, `name`, `isdelete`) VALUES
(1, 'Addidas', 0),
(2, 'Nike', 0),
(3, 'Vans', 0),
(4, 'Pumas', 0),
(5, 'Bitis', 0),
(6, 'AAAAAA', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_product_categories`
--

CREATE TABLE `ecommerce_product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_product_categories`
--

INSERT INTO `ecommerce_product_categories` (`id`, `name`, `isdelete`) VALUES
(1, 'Men', 0),
(3, 'Women', 0),
(4, 'Tranning', 0),
(5, 'Running', 0),
(6, 'Hiking', 0),
(7, 'Kids', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_product_color`
--

CREATE TABLE `ecommerce_product_color` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_product_color`
--

INSERT INTO `ecommerce_product_color` (`id`, `name`, `isdelete`) VALUES
(1, 'Black', 0),
(2, 'Red', 0),
(3, 'Blue', 0),
(4, 'Yellow', 0),
(5, 'White', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_product_detail`
--

CREATE TABLE `ecommerce_product_detail` (
  `id` int(11) NOT NULL,
  `id_product` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `manifacturer` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `categories` varchar(45) DEFAULT NULL,
  `description_vn` text DEFAULT NULL,
  `content_vn` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_product_detail`
--

INSERT INTO `ecommerce_product_detail` (`id`, `id_product`, `description`, `content`, `color`, `size`, `weight`, `manifacturer`, `brand`, `categories`, `description_vn`, `content_vn`) VALUES
(1, '3DcAM01', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', '<p>Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.</p>', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '1', '1,3', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa', '<p>BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB</p>'),
(2, 'USB02', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', '<p>Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.</p>', '2', 'X,XL', '0.6kg', 'Manifacturer', '1', '3', NULL, NULL),
(3, 'wristWear03', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '4', 'X,XL', '0.6kg', 'Manifacturer', '3', '4', NULL, NULL),
(4, 'LPN45', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '4', '1,5', NULL, NULL),
(5, 'LPN62', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '1', '5,2,3', NULL, NULL),
(6, 'LPN47', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '2', '5,1,2', NULL, NULL),
(7, 'LPN48', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '3', '1,2', NULL, NULL),
(8, 'LPN49', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '4', '1', NULL, NULL),
(9, 'LPN50', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '1', '2', NULL, NULL),
(10, 'LPN51', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '2', '3', NULL, NULL),
(11, 'LPN52', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '3', '5,1', NULL, NULL),
(12, 'LPN53', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '4', '1,3', NULL, NULL),
(13, 'LPN54', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '1', '3,2', NULL, NULL),
(14, 'LPN55', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '2', '2,5', NULL, NULL),
(15, 'LPN56', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '3', '5', NULL, NULL),
(16, 'LPN57', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '4', '5', NULL, NULL),
(17, 'LPN58', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '4', '5', NULL, NULL),
(18, 'LPN59', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '4', '5', NULL, NULL),
(19, 'LPN60', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '4', '5', NULL, NULL),
(20, 'LPN61', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel', 'Lorem ipsum dolor sit amet, in eleifend inimicus elaboraret his, harum efficiendi mel ne. Sale percipit vituperata ex mel, sea ne essent aeterno sanctus, nam ea laoreet civibus electram. Ea vis eius explicari. Quot iuvaret ad has.', '1,2,3,4,5', 'X,XL', '0.6kg', 'Manifacturer', '4', '5', NULL, NULL),
(23, 'MC2FM022700', '312', '<p>312</p>', '1,2,3,4,5', NULL, NULL, NULL, '4', '1,2,3,4,5,6', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_product_detail_order`
--

CREATE TABLE `ecommerce_product_detail_order` (
  `id` int(11) NOT NULL,
  `id_order` varchar(45) DEFAULT NULL,
  `code_order` varchar(45) DEFAULT NULL,
  `id_product` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `discount` varchar(45) DEFAULT NULL,
  `qty` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_product_detail_order`
--

INSERT INTO `ecommerce_product_detail_order` (`id`, `id_order`, `code_order`, `id_product`, `price`, `discount`, `qty`) VALUES
(10, '7', 'DH7WWDJR', 'USB02', '120', '0', '2'),
(11, '7', 'DH7WWDJR', 'wristWear03', '50', '0', '1'),
(12, '8', 'DH8BNPVV', 'LPN45', '600', '2', '1'),
(13, '8', 'DH8BNPVV', 'LPN62', '753', '0', '1'),
(14, '8', 'DH8BNPVV', 'LPN47', '550', '0', '1'),
(15, '8', 'DH8BNPVV', 'LPN48', '725', '0', '1'),
(16, '8', 'DH8BNPVV', 'LPN49', '865', '30', '4'),
(17, '8', 'DH8BNPVV', 'LPN50', '333', '0', '1'),
(18, '8', 'DH8BNPVV', 'LPN51', '264', '0', '1'),
(19, '9', 'DH9PKDLY', '3DcAM01', '1500', '30', '1'),
(20, '9', 'DH9PKDLY', 'USB02', '120', '0', '1'),
(21, '10', 'DH100IBXK', '3DcAM01', '1500', '30', '1'),
(22, '10', 'DH100IBXK', 'LPN62', '753', '0', '1'),
(23, '11', 'DH11QUQNK', 'USB02', '120', '0', '1'),
(24, '11', 'DH11QUQNK', 'wristWear03', '50', '0', '1'),
(25, '12', 'DH12ODVLW', 'LPN52', '875', '0', '1'),
(26, '12', 'DH12ODVLW', 'LPN60', '4562', '0', '6'),
(27, '12', 'DH12ODVLW', 'LPN61', '698', '0', '1'),
(28, '13', 'DH13TEH33', 'LPN49', '865', '0', '1'),
(29, '13', 'DH13TEH33', 'LPN62', '753', '0', '1'),
(30, '13', 'DH13TEH33', 'LPN60', '4562', '0', '1'),
(31, '14', 'DH142Q084', '3DcAM01', '1500', '30', '1'),
(32, '15', 'DH15HF4JI', 'USB02', '120', '0', '2'),
(33, '16', 'DH16LVKCD', 'wristWear03', '50', '0', '1'),
(34, '17', 'DH17WWZJG', '3DcAM01', '1500', '30', '1'),
(35, '18', 'DH18TJL5W', 'USB02', '120', '0', '1'),
(36, '19', 'DH19R9RMC', 'wristWear03', '50', '0', '1'),
(37, '20', 'DH20535YK', '3DcAM01', '1500', '30', '1'),
(38, '21', 'DH2117B4N', 'LPN50', '333', '0', '2'),
(39, '22', 'DH2295RRS', 'LPN50', '333', '0', '2'),
(40, '22', 'DH2295RRS', '3DcAM01', '1500', '30', '1'),
(41, '23', 'DH234TJVF', '3DcAM01', '1500', '30', '1'),
(42, '24', 'DH245REXE', '3DcAM01', '300', '2', '1'),
(43, '25', 'DH257Y1LF', 'wristWear03', '50', '0', '2'),
(44, '26', 'DH2632EQW', 'wristWear03', '50', '0', '1'),
(45, '27', 'DH272MAH5', '3DcAM01', '300', '23', '2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_product_discount`
--

CREATE TABLE `ecommerce_product_discount` (
  `id` int(11) NOT NULL,
  `id_product` varchar(45) DEFAULT NULL,
  `discount` varchar(45) DEFAULT NULL,
  `time_countdown` datetime DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_product_discount`
--

INSERT INTO `ecommerce_product_discount` (`id`, `id_product`, `discount`, `time_countdown`, `isdelete`) VALUES
(1, '3DcAM01', '23', '2022-06-10 00:00:00', 1),
(2, 'LPN45', '2', '2022-06-09 14:35:00', 0),
(5, 'USB02', '10', '2022-06-30 16:37:03', 0),
(6, 'LPN53', '3', '2022-06-10 16:36:18', 0),
(8, 'LPN60', '10', '0000-00-00 00:00:00', 0),
(9, 'LPN61', '10', '0000-00-00 00:00:00', 0),
(10, 'LPN62', '10', '0000-00-00 00:00:00', 0),
(11, '3DcAM01', '5', '0000-00-00 00:00:00', 0),
(12, '3DcAM01', '5', '0000-00-00 00:00:00', 0),
(13, 'USB02', '5', '0000-00-00 00:00:00', 0),
(14, 'wristWear03', '5', '0000-00-00 00:00:00', 0),
(15, 'LPN49', '5', '0000-00-00 00:00:00', 0),
(16, 'LPN50', '5', '0000-00-00 00:00:00', 0),
(17, 'LPN51', '5', '0000-00-00 00:00:00', 0),
(18, 'LPN52', '5', '0000-00-00 00:00:00', 0),
(19, 'LPN55', '5', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_product_order`
--

CREATE TABLE `ecommerce_product_order` (
  `id` int(11) NOT NULL,
  `id_user` varchar(45) DEFAULT NULL,
  `hinh_thuc_thanh_toan` varchar(45) DEFAULT NULL,
  `loi_nhan` varchar(45) DEFAULT NULL,
  `ngay_dat_hang` datetime DEFAULT NULL,
  `tinh_trang` tinyint(1) DEFAULT 0,
  `vat` varchar(45) DEFAULT '10',
  `isdelete` tinyint(1) DEFAULT 0,
  `ngay_giao_hang` datetime DEFAULT NULL,
  `is_notify` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_product_order`
--

INSERT INTO `ecommerce_product_order` (`id`, `id_user`, `hinh_thuc_thanh_toan`, `loi_nhan`, `ngay_dat_hang`, `tinh_trang`, `vat`, `isdelete`, `ngay_giao_hang`, `is_notify`) VALUES
(7, '12', '1', '123', '2022-04-25 11:20:04', 4, '10', 0, NULL, 0),
(8, '12', '1', '', '2022-04-26 13:01:30', 2, '10', 0, NULL, 0),
(9, '12', '1', '', '2022-04-26 16:40:36', 3, '10', 0, NULL, 0),
(10, '12', '1', 'Test', '2022-04-27 09:05:39', 1, '10', 0, NULL, 0),
(11, '12', '1', '', '2022-04-27 09:06:12', 1, '10', 0, NULL, 0),
(12, '12', '1', 'Check1', '2022-04-27 09:40:29', 1, '10', 0, NULL, 0),
(13, '12', '1', 'Hey', '2022-04-27 09:43:13', 1, '10', 0, NULL, 0),
(14, '12', '2', '', '2022-04-27 09:56:34', 1, '10', 0, NULL, 0),
(15, '12', '1', '', '2022-04-27 13:19:09', 1, '10', 0, NULL, 0),
(16, '12', '1', '', '2022-04-27 13:29:43', 1, '10', 0, NULL, 0),
(17, '12', '1', '', '2022-04-27 13:31:20', 1, '10', 1, NULL, 0),
(18, '13', '1', '', '2022-04-27 13:31:57', 1, '10', 0, NULL, 0),
(19, '13', '1', '', '2022-03-27 13:32:36', 4, '10', 0, '2022-05-21 15:08:45', 0),
(20, '13', '1', '', '2022-01-27 14:05:31', 4, '10', 0, '2022-05-21 15:08:45', 0),
(21, '13', '1', 'Hey', '2022-05-27 14:11:23', 4, '10', 0, '2022-05-21 15:08:45', 0),
(22, '13', '1', '', '2022-04-27 14:30:43', 5, '20', 0, '2022-05-21 15:26:36', 0),
(23, '105582891398523551577', '1', 'Test', '2022-10-29 16:19:49', 4, '20', 0, '2022-05-21 15:26:23', 0),
(24, '6', '1', '', '2022-05-23 13:42:57', 1, '20', 0, NULL, 0),
(25, '12', '1', '', '2022-06-01 12:42:37', 1, '10', 0, NULL, 0),
(26, '12', '1', '', '2022-06-01 15:52:58', 1, '10', 0, NULL, 0),
(27, '12', '1', '', '2022-08-01 10:02:14', 1, '10', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_public`
--

CREATE TABLE `ecommerce_public` (
  `id` int(10) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `title_vn` varchar(255) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `label` varchar(150) DEFAULT NULL,
  `picture` varchar(150) DEFAULT NULL,
  `picture_mobile` varchar(100) DEFAULT NULL,
  `json_pictures` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `content_vn` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` tinyint(4) NOT NULL DEFAULT 1,
  `is_publish` tinyint(4) NOT NULL DEFAULT 0,
  `user_create` char(50) DEFAULT NULL,
  `time_create` datetime DEFAULT NULL,
  `user_update` char(50) DEFAULT NULL,
  `time_update` datetime DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_public`
--

INSERT INTO `ecommerce_public` (`id`, `title`, `title_vn`, `link`, `label`, `picture`, `picture_mobile`, `json_pictures`, `content`, `content_vn`, `area`, `is_publish`, `user_create`, `time_create`, `user_update`, `time_update`, `is_delete`) VALUES
(3, 'Header', 'Header', 'header', NULL, 'top_about.jpg', '', '[]', '<p>Dolor docendi fuisset ad</p>\n\n<p>movet mucius diceret et qui</p>', '<p>Dolor docendi fuisset ad</p>\n\n<p>movet mucius diceret et qui</p>', 1, 1, '1', '2022-06-02 14:57:21', '1', '2022-06-02 15:03:02', 0),
(4, 'Per quot choro cetero eu', 'Per quot choro cetero eu', 'Eu qui mundi lucilius petentium, mea amet libris prodesset in.', NULL, 'about_1.svg', '', '[]', '<p>His dolor docendi fuisset ad, movet mucius diceret et qui. Esse ferri integre sit id. Nec iusto eleifend definitionem ne, persius argumentum sed ut. Ut mel dicta latine. Ut dicta tempor omittantur pro, ne mea magna idque. Nulla ancillae et his, ei vim lorem accusam.</p>', '<p>His dolor docendi fuisset ad, movet mucius diceret et qui. Esse ferri integre sit id. Nec iusto eleifend definitionem ne, persius argumentum sed ut. Ut mel dicta latine. Ut dicta tempor omittantur pro, ne mea magna idque. Nulla ancillae et his, ei vim lorem accusam.</p>', 2, 1, '1', '2022-06-02 15:04:56', NULL, NULL, 0),
(5, 'Per quot choro cetero eu', 'Per quot choro cetero eu', 'Eu qui mundi lucilius petentium, mea amet libris prodesset in.', NULL, 'about_3.svg', 'about_3.svg', '[]', '<p>His dolor docendi fuisset ad, movet mucius diceret et qui. Esse ferri integre sit id. Nec iusto eleifend definitionem ne, persius argumentum sed ut. Ut mel dicta latine. Ut dicta tempor omittantur pro, ne mea magna idque. Nulla ancillae et his, ei vim lorem accusam.</p>', '<p>His dolor docendi fuisset ad, movet mucius diceret et qui. Esse ferri integre sit id. Nec iusto eleifend definitionem ne, persius argumentum sed ut. Ut mel dicta latine. Ut dicta tempor omittantur pro, ne mea magna idque. Nulla ancillae et his, ei vim lorem accusam.</p>', 3, 1, '1', '2022-06-02 15:04:56', '1', '2022-06-02 15:39:05', 0),
(6, 'Per quot choro cetero eu', 'Per quot choro cetero eu', 'Eu qui mundi lucilius petentium, mea amet libris prodesset in.', NULL, 'about_2.svg', 'about_2.svg', '[]', '<p>His dolor docendi fuisset ad, movet mucius diceret et qui. Esse ferri integre sit id. Nec iusto eleifend definitionem ne, persius argumentum sed ut. Ut mel dicta latine. Ut dicta tempor omittantur pro, ne mea magna idque. Nulla ancillae et his, ei vim lorem accusam.</p>', '<p>His dolor docendi fuisset ad, movet mucius diceret et qui. Esse ferri integre sit id. Nec iusto eleifend definitionem ne, persius argumentum sed ut. Ut mel dicta latine. Ut dicta tempor omittantur pro, ne mea magna idque. Nulla ancillae et his, ei vim lorem accusam.</p>', 4, 1, '1', '2022-06-02 15:04:56', '1', '2022-06-02 15:38:43', 0),
(7, 'About slides', 'About slides', 'about-slides', NULL, 'testimonial_1.jpg', '', '[{\"name\":\"testimonial_1.jpg\",\"label\":\"Awesome Experience\",\"link\":\"His dolor docendi fuisset ad, movet mucius diceret et qui. Esse ferri integre sit id. Nec iusto eleifend definitionem ne, persius argumentum sed ut.@@Susan - Photographer\",\"display\":1},{\"name\":\"testimonial_2.jpg\",\"label\":\"Great Support\",\"link\":\"His dolor docendi fuisset ad, movet mucius diceret et qui. Esse ferri integre sit id. Nec iusto eleifend definitionem ne.@@Mary - Doctor\",\"display\":1},{\"name\":\"testimonial_3.jpg\",\"label\":\"Satisfied\",\"link\":\"His dolor docendi fuisset ad, movet mucius diceret et qui. Esse ferri integre sit id.@@Katrin - Student\",\"display\":1}]', '<p>About slides</p>', '<p>About slides</p>', 5, 1, '1', '2022-06-02 15:33:42', '1', '2022-06-02 15:46:37', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_public_menus`
--

CREATE TABLE `ecommerce_public_menus` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `menu_alias` varchar(45) DEFAULT NULL,
  `menu_link` varchar(100) DEFAULT NULL,
  `menu_parent` int(11) DEFAULT NULL,
  `isdelete` int(2) DEFAULT 0,
  `ordering` int(11) DEFAULT NULL,
  `menu_name_vn` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_public_menus`
--

INSERT INTO `ecommerce_public_menus` (`id`, `menu_name`, `menu_alias`, `menu_link`, `menu_parent`, `isdelete`, `ordering`, `menu_name_vn`) VALUES
(49, 'Home', 'Home', '', 0, 0, NULL, 'Trang chủ'),
(50, 'About', 'About', 'aboutus.html', 0, 0, NULL, 'Giới thiệu'),
(51, 'Product', 'Product', 'product.html', 0, 0, NULL, 'Sản phẩm'),
(52, 'News', 'News', 'news.html', 0, 0, NULL, 'Tin tức'),
(53, 'Contact Us', 'ContactUs', 'contact.html', 0, 0, NULL, 'Liên hệ'),
(56, 'Men\'s Collection', 'Men\\\'sCollection', '', 51, 1, NULL, 'Men\\\'sCollection'),
(57, 'Womens\'s Collection', 'Womens\\\'sCollection', '', 51, 1, NULL, 'Womens\\\'sCollection'),
(58, 'Kids\'s Collection', 'Kids\\\'sCollection', '', 51, 1, NULL, 'Kids\\\'sCollection'),
(59, 'Lorem Ipsum 1', 'LoremIpsum1', '', 56, 1, NULL, 'LoremIpsum1'),
(60, 'Lorem Ipsum 2', 'LoremIpsum2', '', 56, 1, NULL, 'LoremIpsum2'),
(61, 'Lorem Ipsum 3', 'LoremIpsum3', '', 56, 1, NULL, 'LoremIpsum3'),
(62, 'Lorem Ipsum 4', 'LoremIpsum4', '', 56, 1, NULL, 'LoremIpsum4'),
(63, 'Lorem Ipsum 5', 'LoremIpsum5', '', 57, 1, NULL, 'LoremIpsum5'),
(64, 'Lorem Ipsum 6', 'LoremIpsum6', '', 57, 1, NULL, 'LoremIpsum6'),
(65, 'Lorem Ipsum 7', 'LoremIpsum7', '', 57, 1, NULL, 'LoremIpsum7'),
(66, 'Lorem Ipsum 8', 'LoremIpsum8', '', 58, 1, NULL, 'LoremIpsum8'),
(67, 'Lorem Ipsum 9', 'LoremIpsum9', '', 58, 1, NULL, 'LoremIpsum9'),
(68, 'Lorem Ipsum 1', 'LoremIpsum1', '', 52, 1, NULL, 'LoremIpsum1'),
(69, 'Lorem Ipsum 2', 'LoremIpsum2', '', 52, 1, NULL, 'LoremIpsum2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_public_users`
--

CREATE TABLE `ecommerce_public_users` (
  `id` int(10) NOT NULL,
  `username` char(50) DEFAULT NULL,
  `password` char(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` char(50) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `usercreate` char(70) DEFAULT NULL,
  `datecreate` datetime DEFAULT '0000-00-00 00:00:00',
  `dateupdate` datetime DEFAULT '0000-00-00 00:00:00',
  `userupdate` char(70) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_public_users`
--

INSERT INTO `ecommerce_public_users` (`id`, `username`, `password`, `name`, `last_name`, `fullname`, `address`, `mobile`, `email`, `usercreate`, `datecreate`, `dateupdate`, `userupdate`, `isdelete`) VALUES
(6, 'tuanva', '66062cb383851a9023c8aecebd0a010dd0eae5dc', 'Tuan2', 'Vu3', NULL, '156', '0123456789', 'tat20012@gmail.com', NULL, '2022-04-22 13:53:08', '0000-00-00 00:00:00', NULL, 0),
(12, 'hanva', '66062cb383851a9023c8aecebd0a010dd0eae5dc', 'Gia Han', 'Vu', NULL, '56, kp10, An Binh, BH-DN', '0123456789', 'hanva@gmail.com', NULL, '2022-04-25 11:20:04', '0000-00-00 00:00:00', NULL, 0),
(13, 'test', '66062cb383851a9023c8aecebd0a010dd0eae5dc', 'Test', 'Test', NULL, '45', '0123456789', 'test@gmail.com', NULL, '2022-04-27 13:31:57', '0000-00-00 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_review_product`
--

CREATE TABLE `ecommerce_review_product` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `id_product` varchar(45) DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `content_review` mediumtext DEFAULT NULL,
  `content_img` varchar(45) DEFAULT NULL,
  `datecreate` datetime DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT 0,
  `is_notify` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ecommerce_review_product`
--

INSERT INTO `ecommerce_review_product` (`id`, `username`, `id_product`, `rating`, `content_review`, `content_img`, `datecreate`, `isdelete`, `is_notify`) VALUES
(2, 'tuanva', 'USB02', '3', '123', NULL, '2022-04-16 15:26:29', 0, 0),
(3, 'hanva', 'USB02', '4', '33333', NULL, '2022-04-16 15:35:21', 0, 0),
(4, 'thaodinh', 'USB02', '5', '4444', NULL, '2022-04-15 15:35:35', 0, 0),
(5, 'hanva', 'LPN49', '5', 'Đã mua và hài lòng với sản phẩm, giá tốt', NULL, '2022-04-16 15:58:33', 0, 0),
(6, 'hanva', 'LPN49', '5', 'TỐt', NULL, '2022-04-16 15:59:35', 0, 0),
(7, 'tuanva', 'LPN49', '5', '1', NULL, '2022-04-16 16:03:32', 0, 0),
(8, 'hanva', 'USB02', '1', 'quá kém', NULL, '2022-04-16 16:10:22', 0, 0),
(9, 'tuanva', 'USB02', '5', 'Good', NULL, '2022-04-20 12:34:41', 0, 0),
(10, 'tuanva', 'LPN45', '5', 'Good', NULL, '2022-04-25 11:21:03', 0, 0),
(11, 'hanva', 'USB02', '5', 'Hay', NULL, '2022-04-29 13:00:00', 0, 0),
(12, 'hanva', 'USB02', '5', 'Tuyệt', NULL, '2022-04-29 13:00:11', 0, 0),
(13, 'hanva', 'USB02', '5', 'Good', NULL, '2022-04-29 13:00:17', 0, 0),
(14, 'hanva', 'USB02', '5', 'DH100IBXK', NULL, '2022-04-29 13:00:25', 0, 0),
(15, 'hanva', 'USB02', '5', 'Hay', NULL, '2022-04-29 13:00:31', 0, 0),
(16, 'hanva', 'USB02', '5', 'Tuyệt', NULL, '2022-04-29 13:00:51', 0, 0),
(17, 'vuanhtuan3113@gmail.com', '3DcAM01', '5', 'Hay', NULL, '2022-04-29 15:22:06', 0, 0),
(18, 'hanva', '3DcAM01', '5', '12', NULL, '2022-06-27 16:19:15', 0, 0),
(19, 'hanva', '3DcAM01', '1', '1', NULL, '2022-06-27 16:19:23', 0, 0),
(20, 'hanva', '3DcAM01', '5', 'good', NULL, '2022-08-01 10:06:40', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ecommerce_seo_page`
--

CREATE TABLE `ecommerce_seo_page` (
  `id` int(11) NOT NULL,
  `page` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usercreate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datecreate` datetime DEFAULT NULL,
  `userupdate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateupdate` datetime DEFAULT NULL,
  `isdelete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log_exception`
--

CREATE TABLE `log_exception` (
  `id` int(11) NOT NULL,
  `page` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `date_create` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ecommerce_aboutus`
--
ALTER TABLE `ecommerce_aboutus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_admin_users`
--
ALTER TABLE `ecommerce_admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_comments`
--
ALTER TABLE `ecommerce_comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_config_vat`
--
ALTER TABLE `ecommerce_config_vat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_contact`
--
ALTER TABLE `ecommerce_contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_email_newsletter`
--
ALTER TABLE `ecommerce_email_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_events`
--
ALTER TABLE `ecommerce_events`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_file_manager`
--
ALTER TABLE `ecommerce_file_manager`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_google_users`
--
ALTER TABLE `ecommerce_google_users`
  ADD PRIMARY KEY (`google_id`);

--
-- Chỉ mục cho bảng `ecommerce_groups`
--
ALTER TABLE `ecommerce_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_home`
--
ALTER TABLE `ecommerce_home`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_language`
--
ALTER TABLE `ecommerce_language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_menus`
--
ALTER TABLE `ecommerce_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent` (`parent`),
  ADD KEY `idx_router` (`route`),
  ADD KEY `idx_menu_0` (`parent`,`isdelete`,`ordering`),
  ADD KEY `idx_menu_1` (`parent`,`isdelete`,`route`,`ordering`);

--
-- Chỉ mục cho bảng `ecommerce_news`
--
ALTER TABLE `ecommerce_news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_news_categories`
--
ALTER TABLE `ecommerce_news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_product`
--
ALTER TABLE `ecommerce_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`code`);

--
-- Chỉ mục cho bảng `ecommerce_product_brand`
--
ALTER TABLE `ecommerce_product_brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_product_categories`
--
ALTER TABLE `ecommerce_product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_product_color`
--
ALTER TABLE `ecommerce_product_color`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_product_detail`
--
ALTER TABLE `ecommerce_product_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_product_detail_order`
--
ALTER TABLE `ecommerce_product_detail_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_product_discount`
--
ALTER TABLE `ecommerce_product_discount`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_product_order`
--
ALTER TABLE `ecommerce_product_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_public`
--
ALTER TABLE `ecommerce_public`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_public_menus`
--
ALTER TABLE `ecommerce_public_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Chỉ mục cho bảng `ecommerce_review_product`
--
ALTER TABLE `ecommerce_review_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ecommerce_seo_page`
--
ALTER TABLE `ecommerce_seo_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page` (`page`) USING BTREE;

--
-- Chỉ mục cho bảng `log_exception`
--
ALTER TABLE `log_exception`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `ecommerce_aboutus`
--
ALTER TABLE `ecommerce_aboutus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `ecommerce_admin_users`
--
ALTER TABLE `ecommerce_admin_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `ecommerce_comments`
--
ALTER TABLE `ecommerce_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `ecommerce_config_vat`
--
ALTER TABLE `ecommerce_config_vat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ecommerce_contact`
--
ALTER TABLE `ecommerce_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT cho bảng `ecommerce_email_newsletter`
--
ALTER TABLE `ecommerce_email_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `ecommerce_events`
--
ALTER TABLE `ecommerce_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ecommerce_file_manager`
--
ALTER TABLE `ecommerce_file_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `ecommerce_groups`
--
ALTER TABLE `ecommerce_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `ecommerce_home`
--
ALTER TABLE `ecommerce_home`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `ecommerce_language`
--
ALTER TABLE `ecommerce_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=986;

--
-- AUTO_INCREMENT cho bảng `ecommerce_menus`
--
ALTER TABLE `ecommerce_menus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT cho bảng `ecommerce_news`
--
ALTER TABLE `ecommerce_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `ecommerce_news_categories`
--
ALTER TABLE `ecommerce_news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `ecommerce_product`
--
ALTER TABLE `ecommerce_product`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `ecommerce_product_brand`
--
ALTER TABLE `ecommerce_product_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `ecommerce_product_categories`
--
ALTER TABLE `ecommerce_product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `ecommerce_product_color`
--
ALTER TABLE `ecommerce_product_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `ecommerce_product_detail`
--
ALTER TABLE `ecommerce_product_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `ecommerce_product_detail_order`
--
ALTER TABLE `ecommerce_product_detail_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `ecommerce_product_discount`
--
ALTER TABLE `ecommerce_product_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `ecommerce_product_order`
--
ALTER TABLE `ecommerce_product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `ecommerce_public`
--
ALTER TABLE `ecommerce_public`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `ecommerce_public_menus`
--
ALTER TABLE `ecommerce_public_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `ecommerce_review_product`
--
ALTER TABLE `ecommerce_review_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `ecommerce_seo_page`
--
ALTER TABLE `ecommerce_seo_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `log_exception`
--
ALTER TABLE `log_exception`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
