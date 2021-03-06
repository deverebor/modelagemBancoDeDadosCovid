USE [Covid]
GO
/****** Object:  Table [dbo].[Pessoas]    Script Date: 02/11/2021 13:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoas](
	[id_pessoas] [int] NOT NULL,
	[nome_pessoa] [varchar](40) NOT NULL,
	[idade] [int] NOT NULL,
	[vacinado] [bit] NOT NULL,
	[n_de_vezes_infectada] [int] NULL,
	[id_localizacao] [int] NOT NULL,
 CONSTRAINT [PK_Pessoas] PRIMARY KEY CLUSTERED 
(
	[id_pessoas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localizacao]    Script Date: 02/11/2021 13:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localizacao](
	[id_localizacao] [int] NOT NULL,
	[cidade] [varchar](40) NOT NULL,
	[estado] [varchar](40) NOT NULL,
	[pais] [varchar](40) NOT NULL,
	[unidade_atendida] [varchar](40) NULL,
 CONSTRAINT [PK_Localizacao] PRIMARY KEY CLUSTERED 
(
	[id_localizacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casos]    Script Date: 02/11/2021 13:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casos](
	[id_casos] [int] NOT NULL,
	[morto] [bit] NOT NULL,
	[id_pessoas] [int] NOT NULL,
 CONSTRAINT [PK_Casos] PRIMARY KEY CLUSTERED 
(
	[id_casos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_PESSOAS_MORTAS_UNIDADES]    Script Date: 02/11/2021 13:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_PESSOAS_MORTAS_UNIDADES]

	AS
	SELECT
		pes.nome_pessoa,
		pes.idade,
		cas.morto,
		loc.cidade,
		loc.unidade_atendida
	FROM

	Casos as cas
		JOIN Pessoas as pes
			ON pes.id_pessoas = cas.id_pessoas
		JOIN Localizacao as loc
			ON pes.id_localizacao = loc.id_localizacao

	WHERE cas.morto = 1
GO
/****** Object:  View [dbo].[VIEW_PESSOAS_MORTAS_CIDADES_UNIDADES]    Script Date: 02/11/2021 13:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_PESSOAS_MORTAS_CIDADES_UNIDADES]
	AS
(
	SELECT
		loc.cidade,
		loc.unidade_atendida,
		count(c.morto) as qtd_mortos
	FROM Casos as c
			JOIN Pessoas as p
				ON p.id_pessoas = c.id_pessoas
			JOIN Localizacao as loc
				ON p.id_localizacao = loc.id_localizacao
	group by loc.cidade, loc.unidade_atendida
);
GO
/****** Object:  Table [dbo].[Recuperados]    Script Date: 02/11/2021 13:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recuperados](
	[id_recuperados] [int] NOT NULL,
	[sequelas] [bit] NOT NULL,
	[id_pessoas] [int] NOT NULL,
 CONSTRAINT [PK_Recuperados] PRIMARY KEY CLUSTERED 
(
	[id_recuperados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Casos] ([id_casos], [morto], [id_pessoas]) VALUES (1, 0, 1)
INSERT [dbo].[Casos] ([id_casos], [morto], [id_pessoas]) VALUES (2, 1, 2)
INSERT [dbo].[Casos] ([id_casos], [morto], [id_pessoas]) VALUES (3, 1, 3)
INSERT [dbo].[Casos] ([id_casos], [morto], [id_pessoas]) VALUES (4, 0, 4)
INSERT [dbo].[Casos] ([id_casos], [morto], [id_pessoas]) VALUES (5, 0, 5)
INSERT [dbo].[Casos] ([id_casos], [morto], [id_pessoas]) VALUES (6, 0, 6)
INSERT [dbo].[Casos] ([id_casos], [morto], [id_pessoas]) VALUES (7, 1, 7)
GO
INSERT [dbo].[Localizacao] ([id_localizacao], [cidade], [estado], [pais], [unidade_atendida]) VALUES (1, N'Salvador', N'Bahia', N'Brasil', N'UPA dos Barris')
INSERT [dbo].[Localizacao] ([id_localizacao], [cidade], [estado], [pais], [unidade_atendida]) VALUES (2, N'Rio de Janeiro', N'Rio de Janeiro', N'Brasil', N'UBS Leblon')
INSERT [dbo].[Localizacao] ([id_localizacao], [cidade], [estado], [pais], [unidade_atendida]) VALUES (3, N'Len??ois', N'Bahia', N'Brasil', N'UPA da Ladeirinha')
INSERT [dbo].[Localizacao] ([id_localizacao], [cidade], [estado], [pais], [unidade_atendida]) VALUES (4, N'S??o Paulo', N'S??o Paulo', N'Brasil', N'UBS Pinheiros')
INSERT [dbo].[Localizacao] ([id_localizacao], [cidade], [estado], [pais], [unidade_atendida]) VALUES (5, N'Texas', N'Texas', N'Estados Unidos', N'Hospital Texas')
INSERT [dbo].[Localizacao] ([id_localizacao], [cidade], [estado], [pais], [unidade_atendida]) VALUES (6, N'Feira de Santana', N'Bahia', N'Brasil', N'UPA Caji')
GO
INSERT [dbo].[Pessoas] ([id_pessoas], [nome_pessoa], [idade], [vacinado], [n_de_vezes_infectada], [id_localizacao]) VALUES (1, N'Adeobaldo', 22, 1, 2, 1)
INSERT [dbo].[Pessoas] ([id_pessoas], [nome_pessoa], [idade], [vacinado], [n_de_vezes_infectada], [id_localizacao]) VALUES (2, N'Etevaldo Pinto', 50, 0, 0, 2)
INSERT [dbo].[Pessoas] ([id_pessoas], [nome_pessoa], [idade], [vacinado], [n_de_vezes_infectada], [id_localizacao]) VALUES (3, N'Guisep Cadura', 15, 1, 0, 3)
INSERT [dbo].[Pessoas] ([id_pessoas], [nome_pessoa], [idade], [vacinado], [n_de_vezes_infectada], [id_localizacao]) VALUES (4, N'Renata Ingrata', 19, 1, 4, 4)
INSERT [dbo].[Pessoas] ([id_pessoas], [nome_pessoa], [idade], [vacinado], [n_de_vezes_infectada], [id_localizacao]) VALUES (5, N'Clovis de Barros Filho', 60, 1, 0, 4)
INSERT [dbo].[Pessoas] ([id_pessoas], [nome_pessoa], [idade], [vacinado], [n_de_vezes_infectada], [id_localizacao]) VALUES (6, N'Zefira Silva', 34, 0, 2, 5)
INSERT [dbo].[Pessoas] ([id_pessoas], [nome_pessoa], [idade], [vacinado], [n_de_vezes_infectada], [id_localizacao]) VALUES (7, N'Maria Antonieta de Barros Silva', 18, 0, 1, 6)
GO
INSERT [dbo].[Recuperados] ([id_recuperados], [sequelas], [id_pessoas]) VALUES (1, 1, 1)
INSERT [dbo].[Recuperados] ([id_recuperados], [sequelas], [id_pessoas]) VALUES (2, 0, 4)
INSERT [dbo].[Recuperados] ([id_recuperados], [sequelas], [id_pessoas]) VALUES (3, 0, 5)
INSERT [dbo].[Recuperados] ([id_recuperados], [sequelas], [id_pessoas]) VALUES (4, 1, 6)
GO
ALTER TABLE [dbo].[Casos]  WITH CHECK ADD  CONSTRAINT [FK_Casos_Pessoas] FOREIGN KEY([id_pessoas])
REFERENCES [dbo].[Pessoas] ([id_pessoas])
GO
ALTER TABLE [dbo].[Casos] CHECK CONSTRAINT [FK_Casos_Pessoas]
GO
ALTER TABLE [dbo].[Pessoas]  WITH CHECK ADD  CONSTRAINT [FK_Pessoas_Localizacao] FOREIGN KEY([id_localizacao])
REFERENCES [dbo].[Localizacao] ([id_localizacao])
GO
ALTER TABLE [dbo].[Pessoas] CHECK CONSTRAINT [FK_Pessoas_Localizacao]
GO
ALTER TABLE [dbo].[Recuperados]  WITH CHECK ADD  CONSTRAINT [FK_Recuperados_Pessoas1] FOREIGN KEY([id_pessoas])
REFERENCES [dbo].[Pessoas] ([id_pessoas])
GO
ALTER TABLE [dbo].[Recuperados] CHECK CONSTRAINT [FK_Recuperados_Pessoas1]
GO
/****** Object:  StoredProcedure [dbo].[NomeDosInfectados]    Script Date: 02/11/2021 13:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NomeDosInfectados]
(
	@NomeDaPessoa VARCHAR (40)
)
AS
	BEGIN
		SELECT
			pes.id_pessoas,
			pes.nome_pessoa,
			pes.n_de_vezes_infectada,
			loc.cidade

		FROM
			Pessoas as pes
				JOIN Localizacao as loc
					ON pes.id_localizacao = loc.id_localizacao

		WHERE pes.nome_pessoa like '%' + @NomeDaPessoa + '%'
	END
GO
