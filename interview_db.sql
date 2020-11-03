-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2020 at 02:05 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interview_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add Cart', 7, 'add_cart'),
(20, 'Can change Cart', 7, 'change_cart'),
(21, 'Can delete Cart', 7, 'delete_cart'),
(22, 'Can add Contact', 8, 'add_contact'),
(23, 'Can change Contact', 8, 'change_contact'),
(24, 'Can delete Contact', 8, 'delete_contact'),
(25, 'Can add product', 9, 'add_product'),
(26, 'Can change product', 9, 'change_product'),
(27, 'Can delete product', 9, 'delete_product'),
(28, 'Can add user_reg', 10, 'add_user_reg'),
(29, 'Can change user_reg', 10, 'change_user_reg'),
(30, 'Can delete user_reg', 10, 'delete_user_reg'),
(31, 'Can add location', 11, 'add_location'),
(32, 'Can change location', 11, 'change_location'),
(33, 'Can delete location', 11, 'delete_location'),
(34, 'Can add giftcard', 12, 'add_giftcard'),
(35, 'Can change giftcard', 12, 'change_giftcard'),
(36, 'Can delete giftcard', 12, 'delete_giftcard'),
(37, 'Can add order', 13, 'add_order'),
(38, 'Can change order', 13, 'change_order'),
(39, 'Can delete order', 13, 'delete_order');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$sGffsD00ayju$kD+4I+SFBw98k+EIrZfsn3PAqUoGbnmWquxoZgCOqTg=', '2020-11-01 09:36:29.887250', 1, 'admin', '', '', '', 1, 1, '2020-11-01 09:34:18.819197');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogapp_cart`
--

CREATE TABLE `blogapp_cart` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `add_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_reg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogapp_cart`
--

INSERT INTO `blogapp_cart` (`id`, `quantity`, `price`, `add_date`, `status`, `product_id`, `user_reg_id`) VALUES
(7, 3, 30000, '2020-11-01', 1, 1, 2),
(9, 1, 15000, '2020-11-01', 1, 2, 2),
(11, 3, 15000, '2020-11-01', 1, 2, 1),
(12, 1, 30000, '2020-11-01', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogapp_giftcard`
--

CREATE TABLE `blogapp_giftcard` (
  `id` int(11) NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogapp_giftcard`
--

INSERT INTO `blogapp_giftcard` (`id`, `code`, `Status`, `amount`) VALUES
(1, 'Utshob', 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `blogapp_location`
--

CREATE TABLE `blogapp_location` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogapp_location`
--

INSERT INTO `blogapp_location` (`id`, `Name`, `Status`) VALUES
(1, 'USA', 1),
(2, 'Bangladesh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogapp_order`
--

CREATE TABLE `blogapp_order` (
  `id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `add_date` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogapp_product`
--

CREATE TABLE `blogapp_product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `image1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `new_price` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogapp_product`
--

INSERT INTO `blogapp_product` (`id`, `name`, `image1`, `company`, `new_price`, `view`, `Status`) VALUES
(1, 'Shirt', 'product/613SYKy-XPL._UL1200_.jpg', 'ISHO LTD.', '30000', 29, 1),
(2, 'Cap', 'product/71RUxoV0VjL._AC_SL1500_.jpg', 'ISHO LTD.', '15000', 16, 1),
(3, 'Pant', 'product/men-casual-pant-500x500.jpg', 'ISHO LTD.', '20000', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogapp_user_reg`
--

CREATE TABLE `blogapp_user_reg` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogapp_user_reg`
--

INSERT INTO `blogapp_user_reg` (`id`, `Name`, `email`, `password`, `phone`, `Status`, `location_id`) VALUES
(1, 'Rocky', 'rocky@gmail.com', '0192023a7bbd73250516f069df18b500', '01770866798', 1, 1),
(2, 'Shakil', 'shakil@gmail.com', '0192023a7bbd73250516f069df18b500', '01770866798', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-11-01 09:36:45.458765', '1', 'USA', 1, '[{\"added\": {}}]', 11, 1),
(2, '2020-11-01 09:36:54.627159', '2', 'Bangladesh', 1, '[{\"added\": {}}]', 11, 1),
(3, '2020-11-01 09:39:55.322058', '1', 'Shirt', 1, '[{\"added\": {}}]', 9, 1),
(4, '2020-11-01 09:40:26.679032', '2', 'Cap', 1, '[{\"added\": {}}]', 9, 1),
(5, '2020-11-01 09:41:13.920980', '3', 'Pant', 1, '[{\"added\": {}}]', 9, 1),
(6, '2020-11-01 10:35:35.114686', '3', 'Pant', 2, '[{\"changed\": {\"fields\": [\"new_price\"]}}]', 9, 1),
(7, '2020-11-01 10:35:56.319263', '3', 'Pant', 2, '[{\"changed\": {\"fields\": [\"new_price\"]}}]', 9, 1),
(8, '2020-11-01 10:36:09.938694', '3', 'Pant', 2, '[{\"changed\": {\"fields\": [\"new_price\"]}}]', 9, 1),
(9, '2020-11-01 10:36:17.333309', '2', 'Cap', 2, '[{\"changed\": {\"fields\": [\"new_price\"]}}]', 9, 1),
(10, '2020-11-01 10:36:23.078660', '1', 'Shirt', 2, '[{\"changed\": {\"fields\": [\"new_price\"]}}]', 9, 1),
(11, '2020-11-01 11:05:20.615032', '4', 'Art', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 9, 1),
(12, '2020-11-01 11:05:32.206145', '4', 'Art', 3, '', 9, 1),
(13, '2020-11-01 11:24:05.117198', '1', 'Utshob', 1, '[{\"added\": {}}]', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'blogapp', 'cart'),
(8, 'blogapp', 'contact'),
(12, 'blogapp', 'giftcard'),
(11, 'blogapp', 'location'),
(13, 'blogapp', 'order'),
(9, 'blogapp', 'product'),
(10, 'blogapp', 'user_reg'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-11-01 09:31:23.729106'),
(2, 'auth', '0001_initial', '2020-11-01 09:31:48.752022'),
(3, 'admin', '0001_initial', '2020-11-01 09:31:55.154300'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-11-01 09:31:55.285928'),
(5, 'contenttypes', '0002_remove_content_type_name', '2020-11-01 09:32:01.590951'),
(6, 'auth', '0002_alter_permission_name_max_length', '2020-11-01 09:32:03.986201'),
(7, 'auth', '0003_alter_user_email_max_length', '2020-11-01 09:32:10.456510'),
(8, 'auth', '0004_alter_user_username_opts', '2020-11-01 09:32:10.766375'),
(9, 'auth', '0005_alter_user_last_login_null', '2020-11-01 09:32:18.947565'),
(10, 'auth', '0006_require_contenttypes_0002', '2020-11-01 09:32:19.158417'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2020-11-01 09:32:19.380822'),
(12, 'auth', '0008_alter_user_username_max_length', '2020-11-01 09:32:24.407926'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2020-11-01 09:32:25.821317'),
(14, 'blogapp', '0001_initial', '2020-11-01 09:32:45.647394'),
(15, 'blogapp', '0002_auto_20201031_2254', '2020-11-01 09:32:48.368673'),
(16, 'blogapp', '0003_auto_20201031_2332', '2020-11-01 09:33:04.171178'),
(17, 'blogapp', '0004_auto_20201101_1030', '2020-11-01 09:33:08.810609'),
(18, 'sessions', '0001_initial', '2020-11-01 09:33:10.054405'),
(19, 'blogapp', '0005_giftcard', '2020-11-01 11:16:38.325102'),
(20, 'blogapp', '0006_delete_contact', '2020-11-01 11:20:05.407443'),
(21, 'blogapp', '0007_giftcard_price', '2020-11-01 11:21:33.572596'),
(22, 'blogapp', '0008_auto_20201101_0323', '2020-11-01 11:23:31.416863'),
(23, 'blogapp', '0009_order', '2020-11-01 12:42:06.501094');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2iiqnbrq6dlm6p8uqt0l0doiejqfyymw', 'OGEzY2VmNGJkMWFlZGUzNGM3Mzk0NTFiZmY1NmNjODEyYjlkNjA0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZWMwZGE4ZmFiYjRiOTdmZTI2YWQ2N2ZkYWM2MjEyY2IxZGRkYjQ1IiwiZW1haWwiOiJyb2NreUBnbWFpbC5jb20iLCJpZCI6MSwibG9jYXRpb24iOmZhbHNlfQ==', '2020-11-15 13:00:09.866459');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blogapp_cart`
--
ALTER TABLE `blogapp_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogapp_cart_product_id_815f5172_fk_blogapp_product_id` (`product_id`),
  ADD KEY `blogapp_cart_user_reg_id_3d12e438_fk_blogapp_user_reg_id` (`user_reg_id`);

--
-- Indexes for table `blogapp_giftcard`
--
ALTER TABLE `blogapp_giftcard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `blogapp_location`
--
ALTER TABLE `blogapp_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogapp_order`
--
ALTER TABLE `blogapp_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogapp_product`
--
ALTER TABLE `blogapp_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogapp_user_reg`
--
ALTER TABLE `blogapp_user_reg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogapp_user_reg_location_id_0c2ad317_fk_blogapp_location_id` (`location_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogapp_cart`
--
ALTER TABLE `blogapp_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blogapp_giftcard`
--
ALTER TABLE `blogapp_giftcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogapp_location`
--
ALTER TABLE `blogapp_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blogapp_order`
--
ALTER TABLE `blogapp_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogapp_product`
--
ALTER TABLE `blogapp_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blogapp_user_reg`
--
ALTER TABLE `blogapp_user_reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blogapp_cart`
--
ALTER TABLE `blogapp_cart`
  ADD CONSTRAINT `blogapp_cart_product_id_815f5172_fk_blogapp_product_id` FOREIGN KEY (`product_id`) REFERENCES `blogapp_product` (`id`),
  ADD CONSTRAINT `blogapp_cart_user_reg_id_3d12e438_fk_blogapp_user_reg_id` FOREIGN KEY (`user_reg_id`) REFERENCES `blogapp_user_reg` (`id`);

--
-- Constraints for table `blogapp_user_reg`
--
ALTER TABLE `blogapp_user_reg`
  ADD CONSTRAINT `blogapp_user_reg_location_id_0c2ad317_fk_blogapp_location_id` FOREIGN KEY (`location_id`) REFERENCES `blogapp_location` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
