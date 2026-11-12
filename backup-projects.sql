PRAGMA defer_foreign_keys=TRUE;
CREATE TABLE IF NOT EXISTS "d1_migrations"(
		id         INTEGER PRIMARY KEY AUTOINCREMENT,
		name       TEXT UNIQUE,
		applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
INSERT INTO "d1_migrations" ("id","name","applied_at") VALUES(1,'0000_lucky_green_goblin.sql','2026-11-04 15:56:04');
INSERT INTO "d1_migrations" ("id","name","applied_at") VALUES(2,'0001_noisy_lilith.sql','2026-11-04 15:56:04');
INSERT INTO "d1_migrations" ("id","name","applied_at") VALUES(3,'0002_married_la_nuit.sql','2026-11-04 15:56:04');
CREATE TABLE `projects` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`description` text DEFAULT '' NOT NULL,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL
);
INSERT INTO "projects" ("id","name","description","created_at","updated_at") VALUES(1,'New Project','Hello There','2026-11-04T16:49:17.728Z','2026-11-04T16:49:17.728Z');
INSERT INTO "projects" ("id","name","description","created_at","updated_at") VALUES(3,'Grading assignment','Instructor evaluation','2026-11-11T06:04:49.201Z','2026-11-11T06:04:49.201Z');
CREATE TABLE `tasks` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`project_id` integer NOT NULL,
	`title` text NOT NULL,
	`description` text DEFAULT '' NOT NULL,
	`status` text DEFAULT 'todo' NOT NULL,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL,
	FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON UPDATE no action ON DELETE cascade,
	CONSTRAINT "tasks_status_check" CHECK("tasks"."status" IN ('todo', 'in_progress', 'done'))
);
INSERT INTO "tasks" ("id","project_id","title","description","status","created_at","updated_at") VALUES(1,1,'New Task','New Task Description','todo','2026-11-04T16:50:14.034Z','2026-11-04T16:50:14.034Z');
INSERT INTO "tasks" ("id","project_id","title","description","status","created_at","updated_at") VALUES(2,1,'New Task','New Task Description','todo','2026-11-04T16:50:58.607Z','2026-11-04T16:50:58.607Z');
INSERT INTO "tasks" ("id","project_id","title","description","status","created_at","updated_at") VALUES(4,3,'Grading assignment','','todo','2026-11-11T06:04:49.374Z','2026-11-11T06:04:49.374Z');
INSERT INTO "tasks" ("id","project_id","title","description","status","created_at","updated_at") VALUES(5,1,'New Task','New Task Description','todo','2026-11-11T15:44:57.778Z','2026-11-11T15:44:57.778Z');
CREATE TABLE `users` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`email` text NOT NULL,
	`password_hash` text NOT NULL,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL
);
INSERT INTO "users" ("id","email","password_hash","created_at","updated_at") VALUES(1,'hello@there.com','$2b$10$DSB8LVmYxIPGtCFda8rwUesEdU6yr.LYcAxLxTxVxdOtWU3WE8hXi','2026-11-04T16:46:37.395Z','2026-11-04T16:46:37.395Z');
INSERT INTO "users" ("id","email","password_hash","created_at","updated_at") VALUES(2,'rodolfo@roman.com','$2b$10$YvQVvBDLG7id6FowXG4Wme71N4wXjsrZyH9xTXWZ2OJvBqq1NxStO','2026-11-11T06:04:44.786Z','2026-11-11T06:04:44.786Z');
INSERT INTO "users" ("id","email","password_hash","created_at","updated_at") VALUES(3,'other@user.com','$2b$10$HwLWe5I32PKdfyTVcJy37uoYSGWdFtdqf/kY7i9HG4G3MegonEJ8S','2026-11-11T18:58:25.696Z','2026-11-11T18:58:25.696Z');
CREATE TABLE `sessions` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_id` integer NOT NULL,
	`token_hash` text NOT NULL,
	`expires_at` text NOT NULL,
	`created_at` text NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
INSERT INTO "sessions" ("id","user_id","token_hash","expires_at","created_at") VALUES(1,1,'84c9bb5fcdf3ce0ad0d382a9d7e7e8ed8e84cc351ba7300aa56c61d80ab54d8d','2026-11-11T16:47:46.011Z','2026-11-04T16:47:46.011Z');
INSERT INTO "sessions" ("id","user_id","token_hash","expires_at","created_at") VALUES(2,2,'94bf2ae02a20fb7d4c9629e35584dd72afda35d9f24e4d6bb7541539de6c3cd4','2026-11-18T06:04:45.919Z','2026-11-11T06:04:45.919Z');
INSERT INTO "sessions" ("id","user_id","token_hash","expires_at","created_at") VALUES(3,2,'0ec02f7da07cd53a153e2260520e9ac2c2cdc3c413e37c8295c312cfe6d9995a','2026-11-18T06:04:58.409Z','2026-11-11T06:04:58.409Z');
INSERT INTO "sessions" ("id","user_id","token_hash","expires_at","created_at") VALUES(4,1,'68cadd24d6995747accdf6f269b600e634ad309935f5c565b24da504c2358017','2026-11-18T15:41:45.901Z','2026-11-11T15:41:45.901Z');
INSERT INTO "sessions" ("id","user_id","token_hash","expires_at","created_at") VALUES(5,1,'ce7095d251b61352ddf13c7c2211f4bc4a7ded21d65f94bcca3a49d7faffecec','2026-11-18T15:42:59.383Z','2026-11-11T15:42:59.383Z');
INSERT INTO "sessions" ("id","user_id","token_hash","expires_at","created_at") VALUES(6,1,'2a018a8be665469017db7d84c4acb515cdbf84b5912fd6ff1a5f6587a9682865','2026-11-18T16:31:02.316Z','2026-11-11T16:31:02.316Z');
INSERT INTO "sessions" ("id","user_id","token_hash","expires_at","created_at") VALUES(7,1,'de1aa42927282566a23c4309036ccbe194f8ae89d5c8c6d6e2873063303e4d48','2026-11-18T18:56:41.474Z','2026-11-11T18:56:41.474Z');
INSERT INTO "sessions" ("id","user_id","token_hash","expires_at","created_at") VALUES(8,3,'82e30fd509df4537bd3a060312e061960d7801f2f1b54fbcf65e9915d8a0c220','2026-11-18T18:59:30.985Z','2026-11-11T18:59:30.985Z');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('d1_migrations',3);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('users',3);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('sessions',8);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('projects',3);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('tasks',5);
CREATE INDEX `Idx_tasks_project_id` ON `tasks` (`project_id`);
CREATE UNIQUE INDEX `users_email_unique` ON `users` (`email`);
CREATE UNIQUE INDEX `idx_users_email` ON `users` (`email`);
CREATE UNIQUE INDEX `sessions_token_hash_unique` ON `sessions` (`token_hash`);
CREATE UNIQUE INDEX `idx_sessions_token_hash` ON `sessions` (`token_hash`);
CREATE INDEX `idx_sessions_user_id` ON `sessions` (`user_id`);
