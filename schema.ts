import { aliasedTable } from "drizzle-orm";
import { relations } from "drizzle-orm/relations";
import { integer, sqliteTable, text } from "drizzle-orm/sqlite-core";

// 従業員情報保存用テーブル
export const employees = sqliteTable("employees", {
	userId: integer("userId", { mode: "number" })
		.primaryKey({ autoIncrement: true }) // 自動生成する主キーに設定
		.notNull(),
	loginId: text("loginID").notNull(),
	password: text("password").notNull(),
	userName: text("userName").notNull(),
	yomiName: text("yomiName"),
	mattermostUsername: text("mattermostUsername").notNull(),
	email: text("email"),
	officemail: text("office-email").notNull(),
	role: text("role").notNull(),
	deptId: integer('deptId').references(() => departments.deptId),
	groupId: integer('groupId').references(() => departments.groupid),
	prefectures: text('prefectures').notNull(),
	
});

// 安否状況保存用テーブル
export const status = sqliteTable("status", {
	userId: integer("userId", { mode: "number" }) // integer型に変更
		.notNull(),
	quakeId: text("quakeId").notNull(),
	status: text("status").notNull(),
	attendanceStatus: text("attendanceStatus").notNull(),
	comment:text('comment')
});

// 地震情報保存用テーブル
export const quakes = sqliteTable("quakes", {
	id: integer("id", { mode: "number" })
		.primaryKey({ autoIncrement: true })
		.notNull(),
	quakeId: text("quakeId").notNull(),
	areaName: text("areaName").notNull(),
	magnitude: text("magnitude").notNull(),
	time: text("time").notNull(),
});

// 組織保存用テーブル
export const departments = sqliteTable("departments", {
	deptId: integer("deptId", { mode: "number" })
		.primaryKey({ autoIncrement: true })
		.notNull(),
	deptname: text("deptName"),
	groupid: integer('groupId').references(() => groups.groupid),
});



export const groups = sqliteTable("group", {
	groupid: integer("groupId", { mode: "number" }) 
		.primaryKey({ autoIncrement: true })
		.notNull(),
	groupname: text("groupName").notNull(),
	groupformat: text("groupFormat").notNull(),
	channelId: text("channelId"),
	chatTool: text("chatTool"),
	parentgroupId: integer("parentgroupId"),
});

export const channels = sqliteTable("channel", {
	channelId: integer("channelId", { mode: "number" }) 
		.primaryKey({ autoIncrement: true })
		.notNull(),
	channelName: text("channelName"),
	channelUrl: text("channelUrl")
});

export const prefectures = sqliteTable("prefectures", {
	prefId: integer("prefId", { mode: "number" })
		.primaryKey({ autoIncrement: true })
		.notNull(),
	prefName: text("prefName")
});


export const parentgroup = aliasedTable(groups, "parentgroup")

export const groupRelations = relations(departments, ({ many }) => ({
	departments: many(departments),
}));

export const departmentsGroupRelations = relations(
	departments,
	({ one, many }) => ({
		group: one(groups, {
			fields: [departments.groupid],
			references: [groups.groupid],
		}),
	})
);
export const employeeRelations = relations(
	employees,
	({ one, many }) => ({
		departments: one(departments, {
			fields: [employees.deptId],
			references: [departments.deptId],
		}),
	})
);

export const departmentsEmployeeRelations = relations(employees, ({ many }) => ({
	employees: many(employees),
}));