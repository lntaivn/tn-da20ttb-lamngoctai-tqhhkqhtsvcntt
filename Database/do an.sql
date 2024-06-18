CREATE TABLE `programs` (
  `program_id` int PRIMARY KEY AUTO_INCREMENT,
  `programName` text NOT NULL,
  `description` text NOT NULL,
  `isDelete` tinyint DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `pos` (
  `po_id` int PRIMARY KEY AUTO_INCREMENT,
  `description` text NOT NULL,
  `poName` varchar(255) NOT NULL,
  `program_id` int NOT NULL,
  `isDelete` tinyint NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `plos` (
  `plo_id` int PRIMARY KEY AUTO_INCREMENT,
  `description` text NOT NULL,
  `ploName` varchar(255) NOT NULL,
  `program_id` int NOT NULL,
  `isDelete` tinyint NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `clos` (
  `clo_id` int PRIMARY KEY AUTO_INCREMENT,
  `cloName` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `isDelete` tinyint DEFAULT 0,
  `subject_id` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `subjects` (
  `subject_id` int PRIMARY KEY AUTO_INCREMENT,
  `subjectName` text NOT NULL,
  `description` text NOT NULL,
  `numberCredits` int NOT NULL,
  `numberCreditsTheory` int NOT NULL,
  `numberCreditsPractice` int NOT NULL,
  `typesubject` enum('Đại cương','Cơ sở ngành','Chuyên ngành','Thực tập và Đồ án'),
  `isDelete` tinyint DEFAULT 0,
  `program_id` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `chapters` (
  `chapter_id` int PRIMARY KEY AUTO_INCREMENT,
  `chapterName` varchar(100) NOT NULL,
  `description` text,
  `isDelete` tinyint DEFAULT 0,
  `subject_id` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `questions` (
  `question_id` int PRIMARY KEY AUTO_INCREMENT,
  `questionText` text NOT NULL,
  `isDelete` tinyint DEFAULT 0,
  `chapter_id` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `rubrics` (
  `rubric_id` int PRIMARY KEY AUTO_INCREMENT,
  `subject_id` int,
  `assessment_id` int,
  `rubricName` varchar(255) NOT NULL,
  `comment` text,
  `score` double(8,2) DEFAULT 0,
  `isDelete` tinyint DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `rubricsItems` (
  `rubricsItem_id` int PRIMARY KEY AUTO_INCREMENT,
  `chapter_id` int,
  `clo_id` int,
  `description` text,
  `score` double(8,2) DEFAULT 0,
  `isDelete` tinyint DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `assessments` (
  `assessment_id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `student_id` int NOT NULL,
  `rubric_id` int NOT NULL,
  `course_id` int NOT NULL,
  `description` text,
  `date` timestamp,
  `place` text,
  `isDelete` tinyint DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);



CREATE TABLE `users` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `permission` int DEFAULT 1,
  `isBlock` tinyint DEFAULT 0,
  `isDelete` tinyint DEFAULT 0,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `teachers` (
  `teacher_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `teacherCode` varchar(20) UNIQUE,
  `email` varchar(255) NOT NULL,
  `password` varchar(15) NOT NULL,
  `permission` int DEFAULT 1,
  `typeTeacher` enum(GVCV,GVGD) NOT NULL DEFAULT 'GVGD',
  `isBlock` tinyint DEFAULT 0,
  `isDelete` tinyint DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `students` (
  `student_id` int PRIMARY KEY AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `studentCode` varchar(9) NOT NULL,
  `email` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `isDelete` tinyint DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `classes` (
  `class_id` int PRIMARY KEY AUTO_INCREMENT,
  `className` varchar(255) NOT NULL,
  `classCode` varchar(10) UNIQUE NOT NULL,
  `isDelete` tinyint DEFAULT 0,
  `teacher_id` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `courses` (
  `course_id` int PRIMARY KEY AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `teacher_id` int,
  `subject_id` int,
  `semester_id` int,
  `isDelete` tinyint DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `academic_years` (
  `academic_year_id` int PRIMARY KEY AUTO_INCREMENT,
  `startDate` timestamp,
  `endDate` timestamp,
  `description` text
  `isDelete` tinyint DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `semesters` (
  `semester_id` int PRIMARY KEY AUTO_INCREMENT,
  `academic_year_id` int,
  `descriptionShort` text,
  `descriptionLong` text,
  `codeSemester` int
  `isDelete` tinyint DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `map_po_plos` (
  `id_po_plo` int PRIMARY KEY AUTO_INCREMENT,
  `po_id` int NOT NULL,
  `plo_id` int NOT NULL,
  `isDelete` tinyint NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `map_plo_clos` (
  `id_plo_clo` int PRIMARY KEY AUTO_INCREMENT,
  `plo_id` int NOT NULL,
  `clo_id` int NOT NULL,
  `isDelete` tinyint NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `map_clo_chapters` (
  `id_clo_chapter` int PRIMARY KEY AUTO_INCREMENT,
  `clo_id` int NOT NULL,
  `chapter_id` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

CREATE TABLE `map_rubric_questions` (
  `id_rubric_question` int PRIMARY KEY AUTO_INCREMENT,
  `rubric_id` int,
  `question_id` int,
  `createdAt` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updatedAt` timestamp NOT NULL DEFAULT (current_timestamp())
);

ALTER TABLE `pos` ADD FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`);

ALTER TABLE `plos` ADD FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`);

ALTER TABLE `clos` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

ALTER TABLE `subjects` ADD FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`);

ALTER TABLE `chapters` ADD FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

ALTER TABLE `questions` ADD FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`chapter_id`);

ALTER TABLE `rubrics` ADD FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

ALTER TABLE `rubrics` ADD FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`assessment_id`);

ALTER TABLE `rubricsItems` ADD FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`chapter_id`);

ALTER TABLE `rubricsItems` ADD FOREIGN KEY (`clo_id`) REFERENCES `clos` (`clo_id`);

ALTER TABLE `assessments` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `assessments` ADD FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

ALTER TABLE `assessments` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `assessments` ADD FOREIGN KEY (`rubric_id`) REFERENCES `rubrics` (`rubric_id`);

ALTER TABLE `assessments` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

ALTER TABLE `students` ADD FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

ALTER TABLE `teachers` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `classes` ADD FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

ALTER TABLE `courses` ADD FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

ALTER TABLE `courses` ADD FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

ALTER TABLE `courses` ADD FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

ALTER TABLE `courses` ADD FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`);

ALTER TABLE `semesters` ADD FOREIGN KEY (`acdemic_year_id`) REFERENCES `academic_years` (`acdemic_year_id`);

ALTER TABLE `map_po_plos` ADD FOREIGN KEY (`po_id`) REFERENCES `pos` (`po_id`);

ALTER TABLE `map_po_plos` ADD FOREIGN KEY (`plo_id`) REFERENCES `plos` (`plo_id`);

ALTER TABLE `map_plo_clos` ADD FOREIGN KEY (`plo_id`) REFERENCES `plos` (`plo_id`);

ALTER TABLE `map_plo_clos` ADD FOREIGN KEY (`clo_id`) REFERENCES `clos` (`clo_id`);

ALTER TABLE `map_clo_chapters` ADD FOREIGN KEY (`clo_id`) REFERENCES `clos` (`clo_id`);

ALTER TABLE `map_clo_chapters` ADD FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`chapter_id`);

ALTER TABLE `map_rubric_questions` ADD FOREIGN KEY (`rubric_id`) REFERENCES `rubrics` (`rubric_id`);

ALTER TABLE `map_rubric_questions` ADD FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);
