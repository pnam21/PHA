USE [master]
GO
/****** Object:  Database [OJTDB]    Script Date: 9/30/2024 8:40:56 PM ******/
CREATE DATABASE [OJTDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OJTDB', FILENAME = N'D:\OJTDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OJTDB_log', FILENAME = N'D:\OJTDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OJTDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OJTDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OJTDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OJTDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OJTDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OJTDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OJTDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OJTDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OJTDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OJTDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OJTDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OJTDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OJTDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OJTDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OJTDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OJTDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OJTDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OJTDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OJTDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OJTDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OJTDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OJTDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OJTDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OJTDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OJTDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OJTDB] SET  MULTI_USER 
GO
ALTER DATABASE [OJTDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OJTDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OJTDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OJTDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OJTDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OJTDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OJTDB', N'ON'
GO
ALTER DATABASE [OJTDB] SET QUERY_STORE = OFF
GO
USE [OJTDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[assignment_id] [int] IDENTITY(1,1) NOT NULL,
	[lecture_id] [int] NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[due_date] [datetime] NULL,
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[assignment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[lecture_id] [int] NULL,
	[user_id] [nvarchar](50) NULL,
	[content] [text] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseProgress]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseProgress](
	[progress_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](50) NULL,
	[course_id] [int] NULL,
	[completed_lectures] [int] NULL,
	[completion_status] [int] NULL,
 CONSTRAINT [PK_CourseProgress] PRIMARY KEY CLUSTERED 
(
	[progress_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [varchar](255) NULL,
	[description] [text] NULL,
	[instructor_id] [int] NULL,
	[category_id] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[enrollment_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [nvarchar](50) NULL,
	[course_id] [int] NULL,
	[status_id] [int] NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[enrollment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[lecture_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[title] [varchar](255) NOT NULL,
	[content] [text] NULL,
	[video_url] [varchar](255) NULL,
 CONSTRAINT [PK_Lectures] PRIMARY KEY CLUSTERED 
(
	[lecture_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[content] [text] NULL,
	[created_by] [nvarchar](50) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QnA]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QnA](
	[qna_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[user_id] [nvarchar](50) NULL,
	[question] [text] NOT NULL,
	[answer] [text] NULL,
	[created_at] [datetime] NULL,
	[answered_at] [datetime] NULL,
 CONSTRAINT [PK_QnA] PRIMARY KEY CLUSTERED 
(
	[qna_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](255) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [varchar](255) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[status_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Submissions]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Submissions](
	[submission_id] [int] IDENTITY(1,1) NOT NULL,
	[assignment_id] [int] NULL,
	[user_id] [nvarchar](50) NULL,
	[file_path] [varchar](255) NULL,
	[grade] [decimal](5, 2) NULL,
	[feedback] [text] NULL,
 CONSTRAINT [PK_Submissions] PRIMARY KEY CLUSTERED 
(
	[submission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [nvarchar](50) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[fullname] [nvarchar](255) NULL,
	[phone_number] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[user_id] [nvarchar](50) NOT NULL,
	[role_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/30/2024 8:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CourseProgress] ADD  CONSTRAINT [DF__CoursePro__compl__5629CD9C]  DEFAULT ((0)) FOR [completed_lectures]
GO
ALTER TABLE [dbo].[CourseProgress] ADD  CONSTRAINT [DF__CoursePro__compl__571DF1D5]  DEFAULT ((0)) FOR [completion_status]
GO
ALTER TABLE [dbo].[QnA] ADD  CONSTRAINT [DF__QnA__created_at__5BE2A6F2]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentsLectures] FOREIGN KEY([lecture_id])
REFERENCES [dbo].[Lectures] ([lecture_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_AssignmentsLectures]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_CommentsLectures] FOREIGN KEY([lecture_id])
REFERENCES [dbo].[Lectures] ([lecture_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_CommentsLectures]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_CommentsUser] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_CommentsUser]
GO
ALTER TABLE [dbo].[CourseProgress]  WITH CHECK ADD  CONSTRAINT [FK_CourseProgressCourses] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseProgress] CHECK CONSTRAINT [FK_CourseProgressCourses]
GO
ALTER TABLE [dbo].[CourseProgress]  WITH CHECK ADD  CONSTRAINT [FK_CourseProgressUser] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseProgress] CHECK CONSTRAINT [FK_CourseProgressUser]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_CoursesCategory] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_CoursesCategory]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_EnrollCourse]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_EnrollStatus] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_EnrollStatus]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_EnrollUser] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_EnrollUser]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD  CONSTRAINT [FK_LecturesCourses] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lectures] CHECK CONSTRAINT [FK_LecturesCourses]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_NewsProgressUser] FOREIGN KEY([created_by])
REFERENCES [dbo].[User] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_NewsProgressUser]
GO
ALTER TABLE [dbo].[QnA]  WITH CHECK ADD  CONSTRAINT [FK_QnACourses] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QnA] CHECK CONSTRAINT [FK_QnACourses]
GO
ALTER TABLE [dbo].[QnA]  WITH CHECK ADD  CONSTRAINT [FK_QnAProgressUser] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QnA] CHECK CONSTRAINT [FK_QnAProgressUser]
GO
ALTER TABLE [dbo].[Submissions]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionsAssignments] FOREIGN KEY([assignment_id])
REFERENCES [dbo].[Assignments] ([assignment_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Submissions] CHECK CONSTRAINT [FK_SubmissionsAssignments]
GO
ALTER TABLE [dbo].[Submissions]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionsUser] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Submissions] CHECK CONSTRAINT [FK_SubmissionsUser]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_RoleID_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_RoleID_Role]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_UserID_Role] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_UserID_Role]
GO
USE [master]
GO
ALTER DATABASE [OJTDB] SET  READ_WRITE 
GO
