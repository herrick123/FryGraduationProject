ALTER TABLE `student`
ADD COLUMN `level`  enum('M0','M1','M2','M3','M4') NULL DEFAULT 'M0' COMMENT '学员能力级别' AFTER `del_flag`,
ADD COLUMN `skill`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学员技能' AFTER `level`;