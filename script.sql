USE [Covid]
GO
/****** Object:  Table [dbo].[Casos]    Script Date: 26/10/2021 15:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casos](
	[n_de_casos] [int] NOT NULL,
	[n_de_infectados] [int] NOT NULL,
	[n_de_recuperados] [int] NOT NULL,
	[n_de_mortes] [int] NULL,
	[nome_pessoa_infectada] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Casos] PRIMARY KEY CLUSTERED 
(
	[n_de_casos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoas]    Script Date: 26/10/2021 15:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoas](
	[id_pessoas] [int] NOT NULL,
	[nome_pessoa] [varchar](40) NOT NULL,
	[cidade] [varchar](40) NOT NULL,
	[idade] [int] NOT NULL,
	[vacinado] [bit] NULL,
	[n_de_vezes_infectada] [int] NOT NULL,
 CONSTRAINT [PK_Pessoas] PRIMARY KEY CLUSTERED 
(
	[id_pessoas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_NOVOS_CASOS]    Script Date: 26/10/2021 15:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_NOVOS_CASOS] 
AS
	SELECT
		cas.n_de_casos,
		cas.n_de_infectados,
		cas.n_de_mortes,
		cas.nome_pessoa_infectada,
		pes.n_de_vezes_infectada
	FROM
		Casos as cas,
		Pessoas as pes

	WHERE n_de_vezes_infectada = 1 /*TRUE = 1 :: FALSE = 0*/
GO
/****** Object:  Table [dbo].[Localizacao]    Script Date: 26/10/2021 15:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localizacao](
	[id_localizacao] [int] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[pais] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Localizacao] PRIMARY KEY CLUSTERED 
(
	[id_localizacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recuperados]    Script Date: 26/10/2021 15:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recuperados](
	[id_recuperados] [int] NOT NULL,
	[sequelas] [bit] NOT NULL,
	[n_de_recuperados] [int] NOT NULL,
	[nome_pessoa_recuperada] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Recuperados] PRIMARY KEY CLUSTERED 
(
	[id_recuperados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Casos] ([n_de_casos], [n_de_infectados], [n_de_recuperados], [n_de_mortes], [nome_pessoa_infectada]) VALUES (1, 2, 3, 0, N'Adeobaldo')
GO
ALTER TABLE [dbo].[Localizacao]  WITH CHECK ADD  CONSTRAINT [FK_Localizacao_Pessoas] FOREIGN KEY([id_localizacao])
REFERENCES [dbo].[Pessoas] ([id_pessoas])
GO
ALTER TABLE [dbo].[Localizacao] CHECK CONSTRAINT [FK_Localizacao_Pessoas]
GO
ALTER TABLE [dbo].[Pessoas]  WITH CHECK ADD  CONSTRAINT [FK_Pessoas_Casos] FOREIGN KEY([id_pessoas])
REFERENCES [dbo].[Casos] ([n_de_casos])
GO
ALTER TABLE [dbo].[Pessoas] CHECK CONSTRAINT [FK_Pessoas_Casos]
GO
ALTER TABLE [dbo].[Recuperados]  WITH CHECK ADD  CONSTRAINT [FK_Recuperados_Pessoas] FOREIGN KEY([id_recuperados])
REFERENCES [dbo].[Pessoas] ([id_pessoas])
GO
ALTER TABLE [dbo].[Recuperados] CHECK CONSTRAINT [FK_Recuperados_Pessoas]
GO
/****** Object:  StoredProcedure [dbo].[PessoasMortas]    Script Date: 26/10/2021 15:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PessoasMortas]
(
	@NumeroDeMortes INT,
	@NomeDaPessoa VARCHAR(15)
)
AS
	BEGIN
		SELECT
			*
		FROM
			Casos as cas
				JOIN Pessoas as pes
					ON cas.n_de_casos = pes.nome_pessoa
		WHERE pes.nome_pessoa = @NomeDaPessoa
	END
GO
