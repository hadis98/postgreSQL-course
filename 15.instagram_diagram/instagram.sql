CREATE TABLE `users` (
  `id` serial PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp,
  `updated_at` timestamp,
  `username` varchar(30)
);

CREATE TABLE `posts` (
  `id` serial PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp,
  `updated_at` timestamp,
  `url` varchar(200),
  `user_id` integer
);

CREATE TABLE `comments` (
  `id` serial PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp,
  `updated_at` timestamp,
  `contents` varchar(300),
  `user_id` integer,
  `post_id` integer
);

ALTER TABLE `posts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `comments` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `comments` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);
