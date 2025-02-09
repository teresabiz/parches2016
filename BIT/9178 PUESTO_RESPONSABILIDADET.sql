
/****** Object:  Table [dbo].[PUESTO_RESPONSABILIDADET]    Script Date: 06/07/2016 11:46:25 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PUESTO_RESPONSABILIDADET](
	[CODIGO_DE_PUESTO] [char](6) NOT NULL,
	[NUMERO_LINEA] [numeric](9, 0) NOT NULL,
	[PUESTO_RESPONSABILIDAD_DE] [varchar](1024) NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_DE_PUESTO] ASC,
	[NUMERO_LINEA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PUESTO_RESPONSABILIDADET]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_PUESTO])
REFERENCES [dbo].[PUESTO_PHYSICAL_TABLE] ([CODIGO_DE_PUESTO])
GO


