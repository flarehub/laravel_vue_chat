/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.11-MariaDB : Database - chatting
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chatting` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `chatting`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `receiver` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentFile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currentFileName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `messages` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),
(4,'2019_08_19_000000_create_failed_jobs_table',1),
(5,'2019_12_14_000001_create_personal_access_tokens_table',1),
(6,'2021_06_02_061450_create_sessions_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values 
('dtpxp9wd04Pztp9d2hXu27wmcdBfIIhnM9sYiIvO',5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiS0NUTUZ5YmFkWkVkS09wWXA4cEU0QzlnbEt5cmlENFpielg3d3IzRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC91cGxvYWRzL2Z1bmN0aW9uLnppcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjU7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyYSQxMCRDSXVGVnYzbjFOU0xMLmRneXh3ZUwuMUFBbmwwUExycFlIQzNEUjBqdVE0aHhCOXZZSFlRLiI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMmEkMTAkQ0l1RlZ2M24xTlNMTC5kZ3l4d2VMLjFBQW5sMFBMcnBZSEMzRFIwanVRNGh4Qjl2WUhZUS4iO30=',1623309353),
('hFxFjviViGqLg0w2EIIpkQQQV4W4JIZ28Z2uUVOA',4,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoib1NBOGNPczdTN3BJRXdLRE0xYWJIeXpMdklYbUtiTjdpSWdlUnlzUSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJhJDEwJENJdUZWdjNuMU5TTEwuZGd5eHdlTC4xQUFubDBQTHJwWUhDM0RSMGp1UTRoeEI5dllIWVEuIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyYSQxMCRDSXVGVnYzbjFOU0xMLmRneXh3ZUwuMUFBbmwwUExycFlIQzNEUjBqdVE0aHhCOXZZSFlRLiI7fQ==',1623322570),
('KbqO6TwnPfvGa0xryzqAv651DzxhM1pu2LcGzYF4',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTDBKU0p6VUtSNnNKdkNDajJhRDFwMnU1TVpwUFpPeXNUQ2FHUnhlTSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvbWVzc2FnZS1yb29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJhJDEwJENJdUZWdjNuMU5TTEwuZGd5eHdlTC4xQUFubDBQTHJwWUhDM0RSMGp1UTRoeEI5dllIWVEuIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyYSQxMCRDSXVGVnYzbjFOU0xMLmRneXh3ZUwuMUFBbmwwUExycFlIQzNEUjBqdVE0aHhCOXZZSFlRLiI7fQ==',1623314897),
('LRkSEPHwAI45vcmDcXBbl2cCGKe89flEjz5TKgXo',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoibU1CWnBIQ3poOWpadTAxOERET3pYQmJsMFAwZXBaTVk4UktGam45USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9tZXNzYWdlLXJvb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMmEkMTAkQ0l1RlZ2M24xTlNMTC5kZ3l4d2VMLjFBQW5sMFBMcnBZSEMzRFIwanVRNGh4Qjl2WUhZUS4iO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJhJDEwJENJdUZWdjNuMU5TTEwuZGd5eHdlTC4xQUFubDBQTHJwWUhDM0RSMGp1UTRoeEI5dllIWVEuIjt9',1623309365),
('RSiYIZeV6Za6szA7eWHDpfomTMlA2Em8xuQenbi9',4,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUDNzNGVyTkxSZnZXYzZ0ME1BaGw5V0Y4SFB2eFR6TnlEOWgzenVyRyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJhJDEwJENJdUZWdjNuMU5TTEwuZGd5eHdlTC4xQUFubDBQTHJwWUhDM0RSMGp1UTRoeEI5dllIWVEuIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyYSQxMCRDSXVGVnYzbjFOU0xMLmRneXh3ZUwuMUFBbmwwUExycFlIQzNEUjBqdVE0aHhCOXZZSFlRLiI7fQ==',1623314116);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`two_factor_secret`,`two_factor_recovery_codes`,`remember_token`,`current_team_id`,`profile_photo_path`,`created_at`,`updated_at`) values 
(1,'test','test@gmail.com',NULL,'$2a$10$CIuFVv3n1NSLL.dgyxweL.1AAnl0PLrpYHC3DR0juQ4hxB9vYHYQ.',NULL,NULL,NULL,NULL,NULL,'2021-06-03 16:51:40','2021-06-03 16:51:40'),
(2,'test1','test1@gmail.com',NULL,'$2a$10$CIuFVv3n1NSLL.dgyxweL.1AAnl0PLrpYHC3DR0juQ4hxB9vYHYQ.',NULL,NULL,'R16w0IksempALxJBUPz0Xi0DRUJyqomqEj0tLDMN9dwpb8cOV8xJlTOopwgm',NULL,NULL,'2021-06-03 16:51:40','2021-06-03 16:51:40'),
(3,'test2','test2@gmail.com',NULL,'$2a$10$CIuFVv3n1NSLL.dgyxweL.1AAnl0PLrpYHC3DR0juQ4hxB9vYHYQ.',NULL,NULL,NULL,NULL,NULL,'2021-06-03 16:51:40','2021-06-03 16:51:40'),
(4,'test3','test5@gmail.com',NULL,'$2a$10$CIuFVv3n1NSLL.dgyxweL.1AAnl0PLrpYHC3DR0juQ4hxB9vYHYQ.',NULL,NULL,NULL,NULL,NULL,'2021-06-03 16:51:40','2021-06-03 16:51:40'),
(5,'test4','test3@gmail.com',NULL,'$2a$10$CIuFVv3n1NSLL.dgyxweL.1AAnl0PLrpYHC3DR0juQ4hxB9vYHYQ.',NULL,NULL,'R16w0IksempALxJBUPz0Xi0DRUJyqomqEj0tLDMN9dwpb8cOV8xJlTOopwgm',NULL,NULL,'2021-06-03 16:51:40','2021-06-03 16:51:40'),
(6,'test5','test4@gmail.com',NULL,'$2a$10$CIuFVv3n1NSLL.dgyxweL.1AAnl0PLrpYHC3DR0juQ4hxB9vYHYQ.',NULL,NULL,NULL,NULL,NULL,'2021-06-03 16:51:40','2021-06-03 16:51:40'),
(7,'test6','test6@gmail.com',NULL,'$2a$10$CIuFVv3n1NSLL.dgyxweL.1AAnl0PLrpYHC3DR0juQ4hxB9vYHYQ.',NULL,NULL,NULL,NULL,NULL,'2021-06-03 16:51:40','2021-06-03 16:51:40'),
(8,'test7','test7@gmail.com',NULL,'$2a$10$CIuFVv3n1NSLL.dgyxweL.1AAnl0PLrpYHC3DR0juQ4hxB9vYHYQ.',NULL,NULL,NULL,NULL,NULL,'2021-06-03 16:51:40','2021-06-03 16:51:40');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
