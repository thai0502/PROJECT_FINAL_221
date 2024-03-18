USE [QuickMarket]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 3/18/2024 10:06:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialTransactions]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialTransactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TransactionType] [varchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK__Financia__55433A4B2ED35ADF] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NOT NULL,
	[ToUserID] [int] NOT NULL,
	[MessageText] [text] NOT NULL,
	[SentTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](255) NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ImageURL] [varchar](255) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReviews]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [int] NULL,
	[Rating] [int] NOT NULL,
	[Comment] [text] NULL,
	[ReviewDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CategoryID] [int] NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [text] NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[DatePosted] [datetime] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK__Products__B40CC6ED9C90F943] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[BuyerID] [int] NULL,
	[SellerID] [int] NULL,
	[ProductID] [int] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK__Transact__55433A4BED3D5DC7] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastLogin] [datetime] NULL,
	[RoldeID] [int] NOT NULL,
 CONSTRAINT [PK__Users__1788CCACE58D8B40] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserShipped]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserShipped](
	[TransactionID] [int] NOT NULL,
	[AddressLine1] [varchar](255) NOT NULL,
	[AddressLine2] [varchar](255) NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](100) NULL,
	[Country] [varchar](100) NOT NULL,
	[PostalCode] [varchar](20) NOT NULL,
	[AddressType] [varchar](50) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK__UserAddr__091C2A1BED36E446] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 3/18/2024 10:06:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[UserID] [int] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Wallet] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FinancialTransactions] ON 

INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (7, 1, N'VND', CAST(2000.00 AS Decimal(18, 2)), CAST(N'2024-02-06T17:12:32.650' AS DateTime), N'Successful', N'CODE055904')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (8, 1, N'VND', CAST(213321.00 AS Decimal(18, 2)), CAST(N'2024-02-06T17:45:48.060' AS DateTime), N'Pending', N'CODE243602')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (9, 1, N'VND', CAST(213321.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:14:45.663' AS DateTime), N'Pending', N'CODE803474')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (10, 1, N'VND', CAST(213321.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:15:20.957' AS DateTime), N'Pending', N'CODE408672')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (11, 1, N'VND', CAST(3310000.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:15:34.043' AS DateTime), N'Pending', N'CODE440121')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (12, 1, N'VND', CAST(13.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:17:36.393' AS DateTime), N'Pending', N'CODE824359')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (13, 1, N'VND', CAST(123312.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:17:50.970' AS DateTime), N'Pending', N'CODE128682')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (14, 1, N'VND', CAST(213321.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:18:00.123' AS DateTime), N'Pending', N'CODE369570')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (15, 1, N'VND', CAST(213321.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:18:20.573' AS DateTime), N'Pending', N'CODE513831')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (16, 1, N'VND', CAST(123312.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:18:29.973' AS DateTime), N'Pending', N'CODE450241')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (17, 1, N'VND', CAST(312.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:30:32.810' AS DateTime), N'Pending', N'CODE702157')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (18, 1, N'VND', CAST(123312.00 AS Decimal(18, 2)), CAST(N'2024-02-06T18:32:17.657' AS DateTime), N'Pending', N'CODE166715')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (19, 1, N'VND', CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-02-07T21:55:31.633' AS DateTime), N'Successful', N'CODE230598')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (20, 1, N'VND', CAST(213321.00 AS Decimal(18, 2)), CAST(N'2024-02-19T08:49:14.083' AS DateTime), N'Pending', N'CODE282242')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (1020, 1, N'VND', CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-03-12T11:29:47.053' AS DateTime), N'Pending', N'CODE271346')
INSERT [dbo].[FinancialTransactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate], [Status], [Description]) VALUES (1021, 1, N'VND', CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-03-12T11:32:25.653' AS DateTime), N'Successful', N'CODE561722')
SET IDENTITY_INSERT [dbo].[FinancialTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [DateCreated], [LastLogin], [RoldeID]) VALUES (1, N'tung12ok', N'tung020802@gmail.com', N'123456', CAST(N'2024-02-03T19:08:46.750' AS DateTime), NULL, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [DateCreated], [LastLogin], [RoldeID]) VALUES (4, N'tungld', N'tungld123@gmail.com', N'tung', CAST(N'2024-02-04T13:00:32.830' AS DateTime), CAST(N'2024-02-04T13:00:32.830' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[Wallet] ([UserID], [Balance], [LastUpdate]) VALUES (1, CAST(14000.00 AS Decimal(18, 2)), CAST(N'2024-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Wallet] ([UserID], [Balance], [LastUpdate]) VALUES (4, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-02-04T13:00:32.863' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053483FFE6BF]    Script Date: 3/18/2024 10:06:34 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__A9D1053483FFE6BF] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favorites] ADD  CONSTRAINT [DF__Favorites__DateA__5CD6CB2B]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF__Messages__SentTi__5812160E]  DEFAULT (getdate()) FOR [SentTime]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[ProductReviews] ADD  DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF__Transacti__Trans__4D94879B]  DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__DateCreat__38996AB5]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[UserShipped] ADD  CONSTRAINT [DF__UserAddre__DateA__3C69FB99]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[Wallet] ADD  CONSTRAINT [DF__UserBalan__Balan__6B24EA82]  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Wallet] ADD  CONSTRAINT [DF__UserBalan__LastU__6C190EBB]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK__Favorites__Produ__5BE2A6F2] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK__Favorites__Produ__5BE2A6F2]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK__Favorites__UserI__5AEE82B9] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK__Favorites__UserI__5AEE82B9]
GO
ALTER TABLE [dbo].[FinancialTransactions]  WITH CHECK ADD  CONSTRAINT [FK__Financial__UserI__6EF57B66] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[FinancialTransactions] CHECK CONSTRAINT [FK__Financial__UserI__6EF57B66]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([FromUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users1] FOREIGN KEY([ToUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users1]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK__ProductIm__Produ__46E78A0C] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK__ProductIm__Produ__46E78A0C]
GO
ALTER TABLE [dbo].[ProductReviews]  WITH CHECK ADD  CONSTRAINT [FK__ProductRe__Produ__5070F446] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductReviews] CHECK CONSTRAINT [FK__ProductRe__Produ__5070F446]
GO
ALTER TABLE [dbo].[ProductReviews]  WITH CHECK ADD  CONSTRAINT [FK__ProductRe__UserI__5165187F] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProductReviews] CHECK CONSTRAINT [FK__ProductRe__UserI__5165187F]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Status]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK__Transacti__Buyer__4AB81AF0] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK__Transacti__Buyer__4AB81AF0]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK__Transacti__Produ__4CA06362] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK__Transacti__Produ__4CA06362]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK__Transacti__Selle__4BAC3F29] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK__Transacti__Selle__4BAC3F29]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Status]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoldeID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[UserShipped]  WITH CHECK ADD  CONSTRAINT [FK_UserShipped_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[UserShipped] CHECK CONSTRAINT [FK_UserShipped_Status]
GO
ALTER TABLE [dbo].[UserShipped]  WITH CHECK ADD  CONSTRAINT [FK_UserShipped_Transactions1] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transactions] ([TransactionID])
GO
ALTER TABLE [dbo].[UserShipped] CHECK CONSTRAINT [FK_UserShipped_Transactions1]
GO
ALTER TABLE [dbo].[Wallet]  WITH CHECK ADD  CONSTRAINT [FK__UserBalan__UserI__6A30C649] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Wallet] CHECK CONSTRAINT [FK__UserBalan__UserI__6A30C649]
GO
ALTER TABLE [dbo].[ProductReviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
