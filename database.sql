PRAGMA defer_foreign_keys=TRUE;
CREATE TABLE `employees` (
	`userId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`loginID` text NOT NULL,
	`password` text NOT NULL,
	`userName` text NOT NULL,	
	`yomiName` text ,
	`mattermostUsername` text NOT NULL,		
	`office-email` text NOT NULL,
	`email` text,
	`deptId` integer NOT NULL, 
	`groupId` integer , 
	`role` text NOT NULL,
	`prefectures` string NOT NULL);
INSERT INTO employees VALUES(1,'MITS000001','bWl0MTIzNA==','堀江 遼佑','Ryosuke Horie','@myintzuko','r-horie@mamiya-its.co.jp','horie@gmail.com',1,2,'SUPERADMIN','北海道');
INSERT INTO employees VALUES(2,'MITS000002','bWl0MTIzNA==','谷本 紘樹','Hiroki Tanimoto','@myintzuko','k-tanimoto@mamiya-its.co.jp','tanimoto@gmail.com',1,2,'ADMIN','青森県');
INSERT INTO employees VALUES(3,'MITS000003','bWl0MTIzNA==','高木 隼幸','Junko Takagi','@myintzuko','t-takagi@mamiya-its.co.jp','takagi@gmail.com',1,2,'KANRIUSER','岩手県');
INSERT INTO employees VALUES(4,'MITS000004','bWl0MTIzNA==','山本 裕子','Yuko Yamamoto','@myintzuko','y-yamamoto@mamiya-its.co.jp','yamamoto@gmail.com',1,2,'USER','宮城県、福島県');
INSERT INTO employees VALUES(5,'MOPG000001','bWl0MTIzNA==','佐々木 太郎','Taro Sasaki','@myintzuko','t-sasak@mamiya-its.co.jp','sasak@gmail.com',4,1,'ADMIN','石川県、岐阜県、山梨県');
INSERT INTO employees VALUES(6,'MITS000006','bWl0MTIzNA==','田中 玲子','Reiko Tanaka','@myintzuko','r-tanaka@mamiya-its.co.jp','tanaka@gmail.com',3,2,'USER','山口県、新潟県');
INSERT INTO employees VALUES(7,'MITS000007','bWl0MTIzNA==','渡辺 美咲','Misaki Watanabe','@myintzuko','m-watanabe@mamiya-its.co.jp','watanabe@gmail.com',3,2,'USER','和歌山県、大分県、愛媛県');
INSERT INTO employees VALUES(8,'MITS000008','bWl0MTIzNA==','伊藤 一郎','Ichiro Ito','@myintzuko','i-ito@mamiya-its.co.jp','ito@gmail.com',3,2,'KANRIUSER','長崎県、島根県、大阪府');
INSERT INTO employees VALUES(9,'MITS000009','bWl0MTIzNA==','中村 優','Yu Nakamura','@kaiden','y-nakamura@mamiya-its.co.jp','nakamura@gmail.com',1,2,'USER','宮崎県');
INSERT INTO employees VALUES(10,'MITS000010','bWl0MTIzNA==','小林 佳子','Yoshiko Kobayashi','@myintzuko','k-kobayashi@mamiya-its.co.jp','kobayashi@gmail.com',1,2,'USER','静岡県');
INSERT INTO employees VALUES(11,'MITS000011','bWl0MTIzNA==','高橋 真一','Shinichi Takahashi','@myintzuko','s-takahashi@mamiya-its.co.jp','takahashi@gmail.com',1,2,'USER','佐賀県');
INSERT INTO employees VALUES(12,'MITS000012','bWl0MTIzNA==','松本 由美','Yumi Matsumoto','@myintzuko','y-matsumoto@mamiya-its.co.jp','matsumoto@gmail.com',2,2,'USER','福岡県、三重県');
INSERT INTO employees VALUES(13,'MITS000013','bWl0MTIzNA==','加藤 翔','Sho Kato','@myintzuko','s-kato@mamiya-its.co.jp','kato@gmail.com',2,2,'USER','香川県、広島県');
CREATE TABLE `quakes` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`quakeId` text NOT NULL,
	`areaName` text NOT NULL,
	`magnitude` text NOT NULL,
	`time` text NOT NULL
);
INSERT INTO quakes VALUES(1,'66c3d809d616be440743d3fb','熊本県熊本地方','2.6','2024/08/20 08:38:00');
INSERT INTO quakes VALUES(2,'676a1d9fd616be440743d717','石川県能登地方','1.9','2024/12/24 11:30:00');
CREATE TABLE `status` (
	`userId` integer NOT NULL,
	`quakeId` text NOT NULL,
	`status` text NOT NULL,
	`attendanceStatus` text NOT NULL,
	`comment` text 
);

INSERT INTO status VALUES(1,'66c3d809d616be440743d3fb','無事','いつでも可能','');
INSERT INTO status VALUES(2,'66c3d809d616be440743d3fb','被害あり(軽傷)','2、3日以内','足が痛くため在宅をお願いします。');
INSERT INTO status VALUES(4,'66c3d809d616be440743d3fb','被害あり(軽傷)','2、3日以内','');
INSERT INTO status VALUES(6,'66c3d809d616be440743d3fb','被害あり(重傷)','2、3日以内','');
INSERT INTO status VALUES(7,'66c3d809d616be440743d3fb','被害あり(重傷)','1週間以内','');
INSERT INTO status VALUES(8,'66c3d809d616be440743d3fb','被害あり(重傷)','1週間以内','');
INSERT INTO status VALUES(3,'66c3d809d616be440743d3fb','被害あり(重傷)','見通し不明','');
INSERT INTO status VALUES(9,'66c3d809d616be440743d3fb','被害あり(重傷)','見通し不明','');
CREATE TABLE `departments`
 (`deptId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
 `deptName` text NOT NULL,
 `groupId` integer NOT NULL);
INSERT INTO departments VALUES(1,'システム開発部',2);
INSERT INTO departments VALUES(2,'システムソリューション本部',2);
INSERT INTO departments VALUES(3,'企画部',2);
INSERT INTO departments VALUES(4,'営業部',1);

CREATE TABLE `group` (
	`groupId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`groupName` text NOT NULL,
	`groupFormat` text NOT NULL,
	`channelId` text,
	`chatTool` text,
	`parentgroupId` integer);

INSERT INTO "group" VALUES(1,'マミヤ・オーピーグループ','MOPG','1','Mattermost',0);
INSERT INTO "group" VALUES(2,'マミア IT ソリューション','MITS','2','Slack',1);

CREATE TABLE `channel` (
	`channelId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`channelName` text,
	`channelUrl` text NOT NULL);
INSERT INTO "channel" VALUES(1,'pj_anpic_dev','https://ch.fs-revolution.info/hooks/m14yxj45r3dzxr6hd13bnx4w5a');
INSERT INTO "channel" VALUES(2,'','https://hooks.slack.com/services/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');

CREATE TABLE `prefectures`
 (`prefId` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  `prefName` text NOT NULL
);
INSERT INTO prefectures VALUES(1,'北海道');
INSERT INTO prefectures VALUES(2,'青森県');
INSERT INTO prefectures VALUES(3,'岩手県');
INSERT INTO prefectures VALUES(4,'宮城県');
INSERT INTO prefectures VALUES(5,'秋田県');
INSERT INTO prefectures VALUES(6,'山形県');
INSERT INTO prefectures VALUES(7,'福島県');
INSERT INTO prefectures VALUES(8,'茨城県');
INSERT INTO prefectures VALUES(9,'栃木県');
INSERT INTO prefectures VALUES(10,'群馬県');
INSERT INTO prefectures VALUES(11,'埼玉県');
INSERT INTO prefectures VALUES(12,'千葉県');
INSERT INTO prefectures VALUES(13,'東京都');
INSERT INTO prefectures VALUES(14,'神奈川県');
INSERT INTO prefectures VALUES(15,'新潟県');
INSERT INTO prefectures VALUES(16,'富山県');
INSERT INTO prefectures VALUES(17,'石川県');
INSERT INTO prefectures VALUES(18,'福井県');
INSERT INTO prefectures VALUES(19,'山梨県');
INSERT INTO prefectures VALUES(20,'長野県');
INSERT INTO prefectures VALUES(21,'岐阜県');
INSERT INTO prefectures VALUES(22,'静岡県');
INSERT INTO prefectures VALUES(23,'愛知県');
INSERT INTO prefectures VALUES(24,'三重県');
INSERT INTO prefectures VALUES(25,'滋賀県');
INSERT INTO prefectures VALUES(26,'京都府');
INSERT INTO prefectures VALUES(27,'大阪府');
INSERT INTO prefectures VALUES(28,'兵庫県');
INSERT INTO prefectures VALUES(29,'奈良県');
INSERT INTO prefectures VALUES(30,'和歌山県');
INSERT INTO prefectures VALUES(31,'鳥取県');
INSERT INTO prefectures VALUES(32,'島根県');
INSERT INTO prefectures VALUES(33,'岡山県');
INSERT INTO prefectures VALUES(34,'広島県');
INSERT INTO prefectures VALUES(35,'山口県');
INSERT INTO prefectures VALUES(36,'徳島県');
INSERT INTO prefectures VALUES(37,'香川県');
INSERT INTO prefectures VALUES(38,'愛媛県');
INSERT INTO prefectures VALUES(39,'高知県');
INSERT INTO prefectures VALUES(40,'福岡県');
INSERT INTO prefectures VALUES(41,'佐賀県');
INSERT INTO prefectures VALUES(42,'長崎県');
INSERT INTO prefectures VALUES(43,'熊本県');
INSERT INTO prefectures VALUES(44,'大分県');
INSERT INTO prefectures VALUES(45,'宮崎県');
INSERT INTO prefectures VALUES(46,'鹿児島県');
INSERT INTO prefectures VALUES(47,'沖縄県');

DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('employees',14);
INSERT INTO sqlite_sequence VALUES('quakes',1);
