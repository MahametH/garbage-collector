-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `garbage-collector`;
CREATE DATABASE `garbage-collector` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `garbage-collector`;

DROP TABLE IF EXISTS `backups`;
CREATE TABLE `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backups_name_unique` (`name`),
  UNIQUE KEY `backups_file_name_unique` (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `camions`;
CREATE TABLE `camions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `identifiant` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `etat` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lattitude` double(8,2) NOT NULL,
  `longitude` double(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `corbeilles`;
CREATE TABLE `corbeilles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `identifiant` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `niveau` double NOT NULL DEFAULT 0,
  `poubelle` int(10) unsigned NOT NULL DEFAULT 1,
  `lattitude` double(8,2) NOT NULL,
  `longitude` double(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `corbeilles_poubelle_foreign` (`poubelle`),
  CONSTRAINT `corbeilles_poubelle_foreign` FOREIGN KEY (`poubelle`) REFERENCES `poubelles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `corbeilles` (`id`, `deleted_at`, `created_at`, `updated_at`, `identifiant`, `niveau`, `poubelle`, `lattitude`, `longitude`) VALUES
(1,	NULL,	'2019-06-03 11:51:14',	'2019-06-03 11:51:14',	'ghggg',	0,	1,	0.00,	0.00);

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `departments` (`id`, `name`, `tags`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'Administration',	'[]',	'#000',	NULL,	'2019-05-16 11:25:52',	'2019-05-16 11:25:52');

DROP TABLE IF EXISTS `la_configs`;
CREATE TABLE `la_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `la_configs` (`id`, `key`, `section`, `value`, `created_at`, `updated_at`) VALUES
(1,	'sitename',	'',	'Collecteur Intelligent de Déchets',	'2019-05-16 11:26:07',	'2019-05-17 22:03:47'),
(2,	'sitename_part1',	'',	'CiD',	'2019-05-16 11:26:07',	'2019-05-17 22:03:47'),
(3,	'sitename_part2',	'',	'version 1.0',	'2019-05-16 11:26:07',	'2019-05-17 22:03:47'),
(4,	'sitename_short',	'',	'CD',	'2019-05-16 11:26:07',	'2019-05-17 22:03:47'),
(5,	'site_description',	'',	'Système Intelligent de Collecte de Déchets menagers',	'2019-05-16 11:26:07',	'2019-05-17 22:03:47'),
(6,	'sidebar_search',	'',	'0',	'2019-05-16 11:26:07',	'2019-05-17 22:03:48'),
(7,	'show_messages',	'',	'0',	'2019-05-16 11:26:07',	'2019-05-17 22:03:48'),
(8,	'show_notifications',	'',	'0',	'2019-05-16 11:26:07',	'2019-05-17 22:03:48'),
(9,	'show_tasks',	'',	'0',	'2019-05-16 11:26:08',	'2019-05-17 22:03:48'),
(10,	'show_rightsidebar',	'',	'0',	'2019-05-16 11:26:08',	'2019-05-17 22:03:48'),
(11,	'skin',	'',	'skin-green',	'2019-05-16 11:26:08',	'2019-05-17 22:03:47'),
(12,	'layout',	'',	'fixed',	'2019-05-16 11:26:08',	'2019-05-17 22:03:47'),
(13,	'default_email',	'',	'contact@cid.dz',	'2019-05-16 11:26:08',	'2019-05-17 22:03:48');

DROP TABLE IF EXISTS `la_menus`;
CREATE TABLE `la_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) unsigned NOT NULL DEFAULT 0,
  `hierarchy` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `la_menus` (`id`, `name`, `url`, `icon`, `type`, `parent`, `hierarchy`, `created_at`, `updated_at`) VALUES
(1,	'Utilisateurs',	'#',	'fa-group',	'custom',	0,	7,	'2019-05-16 11:25:49',	'2019-06-03 11:52:44'),
(2,	'Users',	'users',	'fa-group',	'module',	1,	1,	'2019-05-16 11:25:49',	'2019-05-17 22:14:18'),
(6,	'Roles',	'roles',	'fa-user-plus',	'module',	1,	2,	'2019-05-16 11:25:50',	'2019-05-17 22:14:19'),
(8,	'Permissions',	'permissions',	'fa-magic',	'module',	1,	3,	'2019-05-16 11:25:51',	'2019-05-17 22:14:19'),
(9,	'Quartiers',	'quartiers',	'fa fa-cube',	'module',	0,	2,	'2019-05-16 11:47:21',	'2019-06-03 11:52:48'),
(10,	'Poubelles',	'poubelles',	'fa fa-trash',	'module',	0,	3,	'2019-05-16 11:54:52',	'2019-06-03 11:52:48'),
(11,	'Corbeilles',	'corbeilles',	'fa fa-trash-o',	'module',	0,	4,	'2019-05-16 12:00:14',	'2019-06-03 11:52:48'),
(12,	'Camions',	'camions',	'fa fa-truck',	'module',	0,	5,	'2019-05-16 12:03:48',	'2019-06-03 11:52:44'),
(14,	'Statut Poubelles / Camions',	'gmaps',	'fa-map-marker',	'custom',	0,	6,	'2019-05-17 22:14:08',	'2019-06-03 11:52:44');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_05_26_050000_create_modules_table',	1),
('2014_05_26_055000_create_module_field_types_table',	1),
('2014_05_26_060000_create_module_fields_table',	1),
('2014_10_12_000000_create_users_table',	1),
('2014_10_12_100000_create_password_resets_table',	1),
('2014_12_01_000000_create_uploads_table',	1),
('2016_05_26_064006_create_departments_table',	1),
('2016_05_26_064007_create_employees_table',	1),
('2016_05_26_064446_create_roles_table',	1),
('2016_07_05_115343_create_role_user_table',	1),
('2016_07_06_140637_create_organizations_table',	1),
('2016_07_07_134058_create_backups_table',	1),
('2016_07_07_134058_create_menus_table',	1),
('2016_09_10_163337_create_permissions_table',	1),
('2016_09_10_163520_create_permission_role_table',	1),
('2016_09_22_105958_role_module_fields_table',	1),
('2016_09_22_110008_role_module_table',	1),
('2016_10_06_115413_create_la_configs_table',	1);

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `modules` (`id`, `name`, `label`, `name_db`, `view_col`, `model`, `controller`, `fa_icon`, `is_gen`, `created_at`, `updated_at`) VALUES
(1,	'Users',	'Users',	'users',	'name',	'User',	'UsersController',	'fa-group',	1,	'2019-05-16 11:25:08',	'2019-05-16 11:26:08'),
(2,	'Uploads',	'Uploads',	'uploads',	'name',	'Upload',	'UploadsController',	'fa-files-o',	1,	'2019-05-16 11:25:11',	'2019-05-16 11:26:08'),
(5,	'Roles',	'Roles',	'roles',	'name',	'Role',	'RolesController',	'fa-user-plus',	1,	'2019-05-16 11:25:18',	'2019-05-16 11:26:08'),
(7,	'Backups',	'Backups',	'backups',	'name',	'Backup',	'BackupsController',	'fa-hdd-o',	1,	'2019-05-16 11:25:28',	'2019-05-16 11:26:09'),
(8,	'Permissions',	'Permissions',	'permissions',	'name',	'Permission',	'PermissionsController',	'fa-magic',	1,	'2019-05-16 11:25:30',	'2019-05-16 11:26:09'),
(9,	'Quartiers',	'Quartiers',	'quartiers',	'nom',	'Quartier',	'QuartiersController',	'fa-cube',	1,	'2019-05-16 11:40:49',	'2019-05-16 11:47:21'),
(10,	'Poubelles',	'Poubelles',	'poubelles',	'identifiant',	'Poubelle',	'PoubellesController',	'fa-trash',	1,	'2019-05-16 11:49:41',	'2019-05-16 11:54:53'),
(11,	'Corbeilles',	'Corbeilles',	'corbeilles',	'identifiant',	'Corbeille',	'CorbeillesController',	'fa-trash-o',	1,	'2019-05-16 11:57:05',	'2019-05-16 12:00:14'),
(12,	'Camions',	'Camions',	'camions',	'identifiant',	'Camion',	'CamionsController',	'fa-truck',	1,	'2019-05-16 12:01:40',	'2019-05-16 12:03:48');

DROP TABLE IF EXISTS `module_fields`;
CREATE TABLE `module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) unsigned NOT NULL,
  `field_type` int(10) unsigned NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT 0,
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT 0,
  `maxlength` int(10) unsigned NOT NULL DEFAULT 0,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_fields_module_foreign` (`module`),
  KEY `module_fields_field_type_foreign` (`field_type`),
  CONSTRAINT `module_fields_field_type_foreign` FOREIGN KEY (`field_type`) REFERENCES `module_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `module_fields_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `module_fields` (`id`, `colname`, `label`, `module`, `field_type`, `unique`, `defaultvalue`, `minlength`, `maxlength`, `required`, `popup_vals`, `sort`, `created_at`, `updated_at`) VALUES
(1,	'name',	'Nom',	1,	16,	0,	'',	5,	250,	1,	'',	0,	'2019-05-16 11:25:08',	'2019-05-16 12:31:28'),
(3,	'email',	'Email',	1,	8,	1,	'',	0,	250,	0,	'',	0,	'2019-05-16 11:25:09',	'2019-05-16 11:25:09'),
(4,	'password',	'Mot de passe',	1,	17,	0,	'',	6,	250,	1,	'',	0,	'2019-05-16 11:25:09',	'2019-05-16 12:31:13'),
(5,	'type',	'Type d\'Utilisateur',	1,	7,	0,	'Agent',	0,	0,	1,	'[\"Administrateur\",\"Agent\"]',	0,	'2019-05-16 11:25:09',	'2019-05-16 12:16:27'),
(6,	'name',	'Name',	2,	16,	0,	'',	5,	250,	1,	'',	0,	'2019-05-16 11:25:11',	'2019-05-16 11:25:11'),
(7,	'path',	'Path',	2,	19,	0,	'',	0,	250,	0,	'',	0,	'2019-05-16 11:25:11',	'2019-05-16 11:25:11'),
(8,	'extension',	'Extension',	2,	19,	0,	'',	0,	20,	0,	'',	0,	'2019-05-16 11:25:11',	'2019-05-16 11:25:11'),
(9,	'caption',	'Caption',	2,	19,	0,	'',	0,	250,	0,	'',	0,	'2019-05-16 11:25:11',	'2019-05-16 11:25:11'),
(10,	'user_id',	'Owner',	2,	7,	0,	'1',	0,	0,	0,	'@users',	0,	'2019-05-16 11:25:11',	'2019-05-16 11:25:11'),
(11,	'hash',	'Hash',	2,	19,	0,	'',	0,	250,	0,	'',	0,	'2019-05-16 11:25:12',	'2019-05-16 11:25:12'),
(12,	'public',	'Is Public',	2,	2,	0,	'0',	0,	0,	0,	'',	0,	'2019-05-16 11:25:12',	'2019-05-16 11:25:12'),
(30,	'name',	'Name',	5,	16,	1,	'',	1,	250,	1,	'',	0,	'2019-05-16 11:25:18',	'2019-05-16 11:25:18'),
(31,	'display_name',	'Display Name',	5,	19,	0,	'',	0,	250,	1,	'',	0,	'2019-05-16 11:25:18',	'2019-05-16 11:25:18'),
(32,	'description',	'Description',	5,	21,	0,	'',	0,	1000,	0,	'',	0,	'2019-05-16 11:25:18',	'2019-05-16 11:25:18'),
(46,	'name',	'Name',	7,	16,	1,	'',	0,	250,	1,	'',	0,	'2019-05-16 11:25:28',	'2019-05-16 11:25:28'),
(47,	'file_name',	'File Name',	7,	19,	1,	'',	0,	250,	1,	'',	0,	'2019-05-16 11:25:28',	'2019-05-16 11:25:28'),
(48,	'backup_size',	'File Size',	7,	19,	0,	'0',	0,	10,	1,	'',	0,	'2019-05-16 11:25:28',	'2019-05-16 11:25:28'),
(49,	'name',	'Nom',	8,	16,	1,	'',	1,	250,	1,	'',	0,	'2019-05-16 11:25:30',	'2019-05-17 18:43:08'),
(50,	'display_name',	'Display Name',	8,	19,	0,	'',	0,	250,	1,	'',	0,	'2019-05-16 11:25:30',	'2019-05-16 11:25:30'),
(51,	'description',	'Description',	8,	21,	0,	'',	0,	1000,	0,	'',	0,	'2019-05-16 11:25:30',	'2019-05-16 11:25:30'),
(52,	'nom',	'Nom',	9,	22,	1,	'',	0,	256,	1,	'',	0,	'2019-05-16 11:45:10',	'2019-05-16 11:45:10'),
(53,	'identifiant',	'Identifiant',	10,	22,	1,	'',	0,	256,	1,	'',	1,	'2019-05-16 11:50:42',	'2019-05-16 11:50:42'),
(54,	'emplacement',	'Emplacement',	10,	1,	0,	'',	0,	256,	1,	'',	3,	'2019-05-16 11:51:20',	'2019-05-16 11:51:35'),
(55,	'quartier',	'Quartier',	10,	7,	0,	'',	0,	0,	1,	'@quartiers',	2,	'2019-05-16 11:53:45',	'2019-05-16 11:53:45'),
(56,	'identifiant',	'Identifiant',	11,	22,	1,	'',	0,	256,	1,	'',	1,	'2019-05-16 11:57:57',	'2019-05-16 11:57:57'),
(57,	'niveau',	'Niveau',	11,	10,	0,	'',	0,	11,	0,	'',	3,	'2019-05-16 11:59:06',	'2019-05-17 22:09:41'),
(58,	'poubelle',	'Poubelle',	11,	7,	0,	'',	0,	0,	1,	'@poubelles',	2,	'2019-05-16 11:59:53',	'2019-05-16 11:59:53'),
(59,	'identifiant',	'Identifiant',	12,	22,	1,	'',	0,	256,	1,	'',	0,	'2019-05-16 12:02:11',	'2019-05-16 12:02:11'),
(60,	'etat',	'Etat',	12,	18,	0,	'',	0,	0,	1,	'[\"En panne\",\"En marche\"]',	0,	'2019-05-16 12:03:34',	'2019-05-16 12:03:34'),
(62,	'lattitude',	'Lattitude',	11,	10,	0,	'',	0,	11,	0,	'',	4,	'2019-05-17 22:08:40',	'2019-05-17 22:08:40'),
(63,	'longitude',	'Longitude',	11,	10,	0,	'',	0,	11,	0,	'',	5,	'2019-05-17 22:09:15',	'2019-05-17 22:09:15'),
(64,	'lattitude',	'Lattitude',	12,	10,	0,	'',	0,	11,	0,	'',	0,	'2019-05-17 22:10:59',	'2019-05-17 22:10:59'),
(65,	'longitude',	'Longitude',	12,	10,	0,	'',	0,	11,	0,	'',	0,	'2019-05-17 22:11:21',	'2019-05-17 22:11:21');

DROP TABLE IF EXISTS `module_field_types`;
CREATE TABLE `module_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `module_field_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1,	'Address',	'2019-05-16 11:25:03',	'2019-05-16 11:25:03'),
(2,	'Checkbox',	'2019-05-16 11:25:03',	'2019-05-16 11:25:03'),
(3,	'Currency',	'2019-05-16 11:25:03',	'2019-05-16 11:25:03'),
(4,	'Date',	'2019-05-16 11:25:03',	'2019-05-16 11:25:03'),
(5,	'Datetime',	'2019-05-16 11:25:03',	'2019-05-16 11:25:03'),
(6,	'Decimal',	'2019-05-16 11:25:03',	'2019-05-16 11:25:03'),
(7,	'Dropdown',	'2019-05-16 11:25:03',	'2019-05-16 11:25:03'),
(8,	'Email',	'2019-05-16 11:25:04',	'2019-05-16 11:25:04'),
(9,	'File',	'2019-05-16 11:25:04',	'2019-05-16 11:25:04'),
(10,	'Float',	'2019-05-16 11:25:04',	'2019-05-16 11:25:04'),
(11,	'HTML',	'2019-05-16 11:25:04',	'2019-05-16 11:25:04'),
(12,	'Image',	'2019-05-16 11:25:04',	'2019-05-16 11:25:04'),
(13,	'Integer',	'2019-05-16 11:25:04',	'2019-05-16 11:25:04'),
(14,	'Mobile',	'2019-05-16 11:25:04',	'2019-05-16 11:25:04'),
(15,	'Multiselect',	'2019-05-16 11:25:04',	'2019-05-16 11:25:04'),
(16,	'Name',	'2019-05-16 11:25:04',	'2019-05-16 11:25:04'),
(17,	'Password',	'2019-05-16 11:25:05',	'2019-05-16 11:25:05'),
(18,	'Radio',	'2019-05-16 11:25:05',	'2019-05-16 11:25:05'),
(19,	'String',	'2019-05-16 11:25:05',	'2019-05-16 11:25:05'),
(20,	'Taginput',	'2019-05-16 11:25:05',	'2019-05-16 11:25:05'),
(21,	'Textarea',	'2019-05-16 11:25:05',	'2019-05-16 11:25:05'),
(22,	'TextField',	'2019-05-16 11:25:05',	'2019-05-16 11:25:05'),
(23,	'URL',	'2019-05-16 11:25:05',	'2019-05-16 11:25:05'),
(24,	'Files',	'2019-05-16 11:25:05',	'2019-05-16 11:25:05');

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'ADMIN_PANEL',	'Admin Panel',	'Admin Panel Permission',	NULL,	'2019-05-16 11:26:06',	'2019-05-16 11:26:06');

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1,	1),
(1,	2);

DROP TABLE IF EXISTS `poubelles`;
CREATE TABLE `poubelles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `identifiant` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emplacement` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quartier` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `poubelles_quartier_foreign` (`quartier`),
  CONSTRAINT `poubelles_quartier_foreign` FOREIGN KEY (`quartier`) REFERENCES `quartiers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `poubelles` (`id`, `deleted_at`, `created_at`, `updated_at`, `identifiant`, `emplacement`, `quartier`) VALUES
(1,	NULL,	'2019-05-16 11:55:56',	'2019-05-16 11:55:56',	'POU/2019/01',	'Rue 01 ',	1),
(2,	NULL,	'2019-06-03 11:50:23',	'2019-06-03 11:50:23',	'2',	'4',	2);

DROP TABLE IF EXISTS `quartiers`;
CREATE TABLE `quartiers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nom` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `quartiers` (`id`, `deleted_at`, `created_at`, `updated_at`, `nom`) VALUES
(1,	NULL,	'2019-05-16 11:48:06',	'2019-05-16 11:48:06',	'Quartier 01'),
(2,	NULL,	'2019-06-03 11:46:36',	'2019-06-03 11:46:36',	'berrihan');

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'SUPER_ADMIN',	'Super Admin',	'Rôle de l\'administrateur (Gestion de Quartiers, Poubelles, Corbeilles, Camions, Utilisateurs)',	NULL,	'2019-05-16 11:25:52',	'2019-05-16 12:37:22'),
(2,	'SUPER_AGENT',	'Super Agent',	'Rôle d\'un agent (Gestion de collecte des déchets)',	NULL,	'2019-05-16 12:35:53',	'2019-05-16 12:36:33');

DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_role_id_foreign` (`role_id`),
  KEY `role_module_module_id_foreign` (`module_id`),
  CONSTRAINT `role_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `role_module` (`id`, `role_id`, `module_id`, `acc_view`, `acc_create`, `acc_edit`, `acc_delete`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	1,	1,	1,	1,	'2019-05-16 11:25:53',	'2019-05-16 11:25:53'),
(2,	1,	2,	1,	1,	1,	1,	'2019-05-16 11:25:55',	'2019-05-16 11:25:55'),
(5,	1,	5,	1,	1,	1,	1,	'2019-05-16 11:26:00',	'2019-05-16 11:26:00'),
(7,	1,	7,	1,	1,	1,	1,	'2019-05-16 11:26:04',	'2019-05-16 11:26:04'),
(8,	1,	8,	1,	1,	1,	1,	'2019-05-16 11:26:05',	'2019-05-16 11:26:05'),
(9,	1,	9,	1,	1,	1,	1,	'2019-05-16 11:46:03',	'2019-05-16 11:46:03'),
(10,	1,	10,	1,	1,	1,	1,	'2019-05-16 11:54:05',	'2019-05-16 11:54:05'),
(11,	1,	11,	1,	1,	1,	1,	'2019-05-16 12:00:14',	'2019-05-16 12:00:14'),
(12,	1,	12,	1,	1,	1,	1,	'2019-05-16 12:03:48',	'2019-05-16 12:03:48'),
(13,	2,	9,	1,	0,	0,	0,	'2019-05-16 12:55:40',	'2019-05-16 12:55:40'),
(14,	2,	10,	1,	0,	0,	0,	'2019-05-16 12:55:54',	'2019-05-16 12:55:54'),
(15,	2,	11,	1,	0,	0,	0,	'2019-05-16 12:56:07',	'2019-05-16 12:56:07'),
(16,	2,	12,	1,	0,	0,	0,	'2019-05-16 12:56:21',	'2019-05-16 12:56:21');

DROP TABLE IF EXISTS `role_module_fields`;
CREATE TABLE `role_module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_fields_role_id_foreign` (`role_id`),
  KEY `role_module_fields_field_id_foreign` (`field_id`),
  CONSTRAINT `role_module_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `module_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_fields_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `role_module_fields` (`id`, `role_id`, `field_id`, `access`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	'write',	'2019-05-16 11:25:53',	'2019-05-16 11:25:53'),
(3,	1,	3,	'write',	'2019-05-16 11:25:53',	'2019-05-16 11:25:53'),
(4,	1,	4,	'write',	'2019-05-16 11:25:53',	'2019-05-16 11:25:53'),
(5,	1,	5,	'write',	'2019-05-16 11:25:53',	'2019-05-16 11:25:53'),
(6,	1,	6,	'write',	'2019-05-16 11:25:55',	'2019-05-16 11:25:55'),
(7,	1,	7,	'write',	'2019-05-16 11:25:55',	'2019-05-16 11:25:55'),
(8,	1,	8,	'write',	'2019-05-16 11:25:55',	'2019-05-16 11:25:55'),
(9,	1,	9,	'write',	'2019-05-16 11:25:55',	'2019-05-16 11:25:55'),
(10,	1,	10,	'write',	'2019-05-16 11:25:55',	'2019-05-16 11:25:55'),
(11,	1,	11,	'write',	'2019-05-16 11:25:55',	'2019-05-16 11:25:55'),
(12,	1,	12,	'write',	'2019-05-16 11:25:55',	'2019-05-16 11:25:55'),
(30,	1,	30,	'write',	'2019-05-16 11:26:00',	'2019-05-16 11:26:00'),
(31,	1,	31,	'write',	'2019-05-16 11:26:00',	'2019-05-16 11:26:00'),
(32,	1,	32,	'write',	'2019-05-16 11:26:00',	'2019-05-16 11:26:00'),
(46,	1,	46,	'write',	'2019-05-16 11:26:04',	'2019-05-16 11:26:04'),
(47,	1,	47,	'write',	'2019-05-16 11:26:04',	'2019-05-16 11:26:04'),
(48,	1,	48,	'write',	'2019-05-16 11:26:04',	'2019-05-16 11:26:04'),
(49,	1,	49,	'write',	'2019-05-16 11:26:05',	'2019-05-16 11:26:05'),
(50,	1,	50,	'write',	'2019-05-16 11:26:05',	'2019-05-16 11:26:05'),
(51,	1,	51,	'write',	'2019-05-16 11:26:05',	'2019-05-16 11:26:05'),
(52,	1,	52,	'write',	'2019-05-16 11:45:11',	'2019-05-16 11:45:11'),
(53,	1,	53,	'write',	'2019-05-16 11:50:43',	'2019-05-16 11:50:43'),
(54,	1,	54,	'write',	'2019-05-16 11:51:20',	'2019-05-16 11:51:20'),
(55,	1,	55,	'write',	'2019-05-16 11:53:46',	'2019-05-16 11:53:46'),
(56,	1,	56,	'write',	'2019-05-16 11:57:58',	'2019-05-16 11:57:58'),
(57,	1,	57,	'write',	'2019-05-16 11:59:06',	'2019-05-16 11:59:06'),
(58,	1,	58,	'write',	'2019-05-16 11:59:54',	'2019-05-16 11:59:54'),
(59,	1,	59,	'write',	'2019-05-16 12:02:12',	'2019-05-16 12:02:12'),
(60,	1,	60,	'write',	'2019-05-16 12:03:35',	'2019-05-16 12:03:35'),
(61,	2,	52,	'readonly',	'2019-05-16 12:55:40',	'2019-05-16 12:55:40'),
(62,	2,	53,	'readonly',	'2019-05-16 12:55:54',	'2019-05-16 12:55:54'),
(63,	2,	55,	'readonly',	'2019-05-16 12:55:54',	'2019-05-16 12:55:54'),
(64,	2,	54,	'readonly',	'2019-05-16 12:55:54',	'2019-05-16 12:55:54'),
(65,	2,	56,	'readonly',	'2019-05-16 12:56:07',	'2019-05-16 12:56:07'),
(66,	2,	57,	'readonly',	'2019-05-16 12:56:07',	'2019-05-16 12:56:07'),
(67,	2,	58,	'readonly',	'2019-05-16 12:56:07',	'2019-05-16 12:56:07'),
(68,	2,	59,	'readonly',	'2019-05-16 12:56:21',	'2019-05-16 12:56:21'),
(69,	2,	60,	'readonly',	'2019-05-16 12:56:21',	'2019-05-16 12:56:21'),
(71,	1,	62,	'write',	'2019-05-17 22:08:42',	'2019-05-17 22:08:42'),
(72,	1,	63,	'write',	'2019-05-17 22:09:17',	'2019-05-17 22:09:17'),
(73,	1,	64,	'write',	'2019-05-17 22:11:00',	'2019-05-17 22:11:00'),
(74,	1,	65,	'write',	'2019-05-17 22:11:22',	'2019-05-17 22:11:22'),
(75,	2,	62,	'readonly',	'2019-06-03 12:00:56',	'2019-06-03 12:00:56'),
(76,	2,	63,	'readonly',	'2019-06-03 12:00:56',	'2019-06-03 12:00:56'),
(77,	2,	1,	'invisible',	'2019-06-03 12:01:25',	'2019-06-03 12:01:25'),
(78,	2,	3,	'invisible',	'2019-06-03 12:01:25',	'2019-06-03 12:01:25'),
(79,	2,	4,	'invisible',	'2019-06-03 12:01:25',	'2019-06-03 12:01:25'),
(80,	2,	5,	'invisible',	'2019-06-03 12:01:25',	'2019-06-03 12:01:25'),
(81,	2,	64,	'readonly',	'2019-06-03 12:01:54',	'2019-06-03 12:01:54'),
(82,	2,	65,	'readonly',	'2019-06-03 12:01:54',	'2019-06-03 12:01:54');

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	NULL,	NULL),
(2,	2,	2,	NULL,	NULL);

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT 1,
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`),
  CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Agent',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `type`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'Super Admin',	'super@admin.dz',	'$2y$10$k34JCevzSIi.6iJKFpGWkuVuoKoQZoH3JIcRudrzlovN0YUiA9FUG',	'Administrateur',	'pQCnqGyMF155OMeSJpPLd6i6lQnbxvDIw5h4dNNS7cxZe51Hw4EQO0I3sr6L',	NULL,	'2019-05-16 11:27:25',	'2019-06-03 12:02:20'),
(2,	'Super Agent',	'super@agent.dz',	'$2y$10$Dj8Z6YrMIaMWdazMYMpoaelFW1lK0k09J/dy9UFjAxdVNT9YeS6D.',	'Agent',	'OTlGtAYflMfPV1ObYfuXoLwGCzXbcBqQepQ67e4c8DkCUf9X1cto4zbKLBex',	NULL,	'2019-05-16 12:33:42',	'2019-06-03 11:59:06');

-- 2019-06-03 13:51:40
