CREATE TABLE `channel` (
	`channelId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`channelName` text,
	`channelUrl` text
);


--> statement-breakpoint
CREATE TABLE `departments` (
	`deptId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`deptName` text,
	`groupId` integer,
	FOREIGN KEY (`groupId`) REFERENCES `group`(`groupId`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `employees` (
	`userId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`loginID` text NOT NULL,
	`password` text NOT NULL,
	`userName` text NOT NULL,
	`yomiName` text,
	`mattermostUsername` text NOT NULL,
	`email` text,
	`office-email` text NOT NULL,
	`role` text NOT NULL,
	`deptId` integer,
	`groupId` integer,
	`prefectures` text NOT NULL,
	FOREIGN KEY (`deptId`) REFERENCES `departments`(`deptId`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`groupId`) REFERENCES `departments`(`groupId`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `group` (
	`groupId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`groupName` text NOT NULL,
	`groupFormat` text NOT NULL,
	`channelId` text,
	`chatTool` text,
	`parentgroupId` integer
);
--> statement-breakpoint
CREATE TABLE `parentgroup` (
	`groupId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`groupName` text NOT NULL,
	`groupFormat` text NOT NULL,
	`channelId` text,
	`chatTool` text,
	`parentgroupId` integer
);
--> statement-breakpoint
CREATE TABLE `prefectures` (
	`prefId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`prefName` text
);
--> statement-breakpoint
CREATE TABLE `quakes` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`quakeId` text NOT NULL,
	`areaName` text NOT NULL,
	`magnitude` text NOT NULL,
	`time` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `status` (
	`userId` integer NOT NULL,
	`quakeId` text NOT NULL,
	`status` text NOT NULL,
	`attendanceStatus` text NOT NULL,
	`comment` text
);
--> statement-breakpoint
INSERT INTO status VALUES(1,'66c3d809d616be440743d3fb','無事','いつでも可能','');
--> statement-breakpoint
INSERT INTO status VALUES(2,'66c3d809d616be440743d3fb','被害あり(軽傷)','2、3日以内','足が痛くため在宅をお願いします。');

