

/****** Object:  Table [dbo].[EMPLEADO_TIEMPOS_TEMPORAL]    Script Date: 2/3/2016 2:25:21 PM ******/
DROP TABLE [dbo].[EMPLEADO_TIEMPOS_TEMPORAL]
GO

/****** Object:  Table [dbo].[EMPLEADO_TIEMPOS_TEMPORAL]    Script Date: 2/3/2016 2:25:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EMPLEADO_TIEMPOS_TEMPORAL](
	[FECHA8_DAY] [numeric](2, 0) NOT NULL,
	[FECHA8_MONTH] [numeric](2, 0) NOT NULL,
	[FECHA8_YEAR] [numeric](4, 0) NOT NULL,
	[CODIGO_BIC] [char](8) NOT NULL,
	[CODIGO_DEF_TRN_PLANILLA] [char](8) NOT NULL,
	[CODIGO_CLASE_DE_PLANILLA] [char](2) NULL,
	[VALOR_GRABADO] [money] NULL,
	[DIAS_GRABADO] [money] NULL,
	[HORAS_GRABADO] [money] NULL,
	[UNIDADES_GRABADO] [money] NULL,
	[CODIGO_CENTRO_DE_COSTO] [char](6) NULL,
	[AGRUPACION_CENTRO_DE_COSTO] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[FECHA8_DAY] ASC,
	[FECHA8_MONTH] ASC,
	[FECHA8_YEAR] ASC,
	[CODIGO_BIC] ASC,
	[CODIGO_DEF_TRN_PLANILLA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO