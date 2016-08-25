USE [BIT_XXXXX]
GO

/****** Object:  Table [dbo].[CAI_ESTABLECIMIENTO]    Script Date: 8/9/2016 3:25:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CAI_ESTABLECIMIENTO](
	[CODIGO_DE_COMPANIA] [char](2) NOT NULL,
	[NUMERO_DE_DECLARACION] [char](10) NOT NULL,
	[ESTABLECIMIENTO] [char](3) NOT NULL,
	[NOMBRE_ESTABLECIMIENTO] [char](60) NULL,
	[ESTADO_ESTABLECIMIENTO] [char](1) NULL,
	[DIRECCION_ESTABLECIMIENTO] [char](120) NULL,
	[CIUDAD_ESTABLECIMIENTO] [char](30) NULL,
	[TELEFONO_ESTABLECIMIENTO] [char](15) NULL,
	[CELULAR_ESTABLECIMIENTO] [char](15) NULL,
	[EMAIL_DEL_ESTABLECIMIENTO] [varchar](1024) NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_DE_COMPANIA] ASC,
	[NUMERO_DE_DECLARACION] ASC,
	[ESTABLECIMIENTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TABLA_CAI_DECLARACION]    Script Date: 8/9/2016 3:25:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TABLA_CAI_DECLARACION](
	[CODIGO_DE_COMPANIA] [char](2) NOT NULL,
	[NUMERO_DE_DECLARACION] [char](10) NOT NULL,
	[CAI] [char](40) NULL,
	[MODALIDAD_IMPRESION] [char](1) NULL,
	[SISTEMA_COMPUTARIZADO] [char](1) NULL,
	[VARIANTES_SISTEMA_RED] [char](1) NULL,
	[FECHA_LIMITE_EMISION] [datetime] NULL,
	[FECHA_EMISION_DECLARACION] [datetime] NULL,
	[MONTO_FACTURA_EXIGE_CAI] [money] NULL,
	[ESTATUS_CAI] [char](1) NULL,
	[COMENTARIOS] [varchar](1024) NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_DE_COMPANIA] ASC,
	[NUMERO_DE_DECLARACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TABLA_CAI_DOCUMENTO_FISCAL]    Script Date: 8/9/2016 3:25:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TABLA_CAI_DOCUMENTO_FISCAL](
	[CODIGO_DE_COMPANIA] [char](2) NOT NULL,
	[NUMERO_DE_DECLARACION] [char](10) NOT NULL,
	[ESTABLECIMIENTO] [char](3) NOT NULL,
	[PUNTO_DE_EMISION] [char](3) NOT NULL,
	[CODIGO_DOCUMENTO_FISCAL] [char](2) NOT NULL,
	[CANTIDAD_DEMANDA] [int] NULL,
	[CANTIDAD_OTORGADA] [int] NULL,
	[NUMERO_INICIAL] [int] NULL,
	[NUMERO_FINAL] [int] NULL,
	[ESTATUS_DOCUMENTO_FISCAL] [char](1) NULL,
	[FORMATO_DE_IMPRESION_DOCU] [char](60) NULL,
	[PREFIJO_PARTIDA_CONTABLE] [char](6) NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_DE_COMPANIA] ASC,
	[NUMERO_DE_DECLARACION] ASC,
	[ESTABLECIMIENTO] ASC,
	[PUNTO_DE_EMISION] ASC,
	[CODIGO_DOCUMENTO_FISCAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TABLA_CAI_PUNTO_EMISION]    Script Date: 8/9/2016 3:25:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TABLA_CAI_PUNTO_EMISION](
	[CODIGO_DE_COMPANIA] [char](2) NOT NULL,
	[NUMERO_DE_DECLARACION] [char](10) NOT NULL,
	[ESTABLECIMIENTO] [char](3) NOT NULL,
	[PUNTO_DE_EMISION] [char](3) NOT NULL,
	[TIPO_DE_PUNTO_DE_EMISION] [char](1) NULL,
	[NOMBRE_DEL_PUNTO_EMISION] [char](20) NULL,
	[PUNTO_DE_VENTA_CODIGO_BIC] [char](8) NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_DE_COMPANIA] ASC,
	[NUMERO_DE_DECLARACION] ASC,
	[ESTABLECIMIENTO] ASC,
	[PUNTO_DE_EMISION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TABLA_CAI_RETENCION_CONTROL]    Script Date: 8/9/2016 3:25:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TABLA_CAI_RETENCION_CONTROL](
	[PREFIJO_PARTIDA_CONTABLE] [char](6) NOT NULL,
	[NUMERO_DE_PARTIDA] [int] NOT NULL,
	[CODIGO_BIC] [char](8) NULL,
	[NOMBRE_DEL_CONTRIBUYENTE] [char](100) NULL,
	[FECHA_DE_RETENCION] [datetime] NULL,
	[DOCUMENTO_DE_IDENTIFICACI] [char](25) NULL,
	[ESTATUS_DE_LA_RETENCION] [char](1) NULL,
	[PUNTO_VENTA_EMISOR] [char](8) NULL,
	[COMENTARIOS] [varchar](1024) NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[PREFIJO_PARTIDA_CONTABLE] ASC,
	[NUMERO_DE_PARTIDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TABLA_CAI_RETENCIONES_CAT]    Script Date: 8/9/2016 3:25:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TABLA_CAI_RETENCIONES_CAT](
	[PREFIJO_PARTIDA_CONTABLE] [char](6) NOT NULL,
	[NUMERO_DE_PARTIDA] [int] NOT NULL,
	[CAI] [char](40) NULL,
	[FECHA_LIMITE_EMISION] [datetime] NULL,
	[CAEE] [char](20) NULL,
	[DOCUMENTO_TRANSACCION_ICP] [char](25) NULL,
	[FECHA_DEL_DOCUMENTO] [datetime] NULL,
	[BASE_IMPONIBLE] [money] NULL,
	[TASA_DE_RETENCION] [money] NULL,
	[IMPUESTO_RETENIDO] [money] NULL,
	[DOCUMENTO_ORIGINAL_PREFIJO] [char](6) NULL,
	[DOCUMENTO_ORIGINAL_NUMERO] [int] NULL,
	[AUTORIZACION_IMPRESOR_CAI] [char](40) NULL,
	[AUTORIZACION_IMPRESOR_CAE] [char](20) NULL,
	[COMENTARIOS] [varchar](1024) NULL,
	[CODIGO_DE_IMPUESTO] [char](6) NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[PREFIJO_PARTIDA_CONTABLE] ASC,
	[NUMERO_DE_PARTIDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[CAI_ESTABLECIMIENTO]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION])
REFERENCES [dbo].[TABLA_CAI_DECLARACION] ([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION])
GO

ALTER TABLE [dbo].[TABLA_CAI_DECLARACION]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_COMPANIA])
REFERENCES [dbo].[COMPANIA] ([CODIGO_DE_COMPANIA])
GO

ALTER TABLE [dbo].[TABLA_CAI_DOCUMENTO_FISCAL]  WITH CHECK ADD FOREIGN KEY([PREFIJO_PARTIDA_CONTABLE])
REFERENCES [dbo].[NUMERACION_PARTIDAS] ([PREFIJO_PARTIDA_CONTABLE])
GO

ALTER TABLE [dbo].[TABLA_CAI_DOCUMENTO_FISCAL]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION])
REFERENCES [dbo].[TABLA_CAI_DECLARACION] ([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION])
GO

ALTER TABLE [dbo].[TABLA_CAI_DOCUMENTO_FISCAL]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION], [ESTABLECIMIENTO])
REFERENCES [dbo].[CAI_ESTABLECIMIENTO] ([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION], [ESTABLECIMIENTO])
GO

ALTER TABLE [dbo].[TABLA_CAI_DOCUMENTO_FISCAL]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION], [ESTABLECIMIENTO], [PUNTO_DE_EMISION])
REFERENCES [dbo].[TABLA_CAI_PUNTO_EMISION] ([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION], [ESTABLECIMIENTO], [PUNTO_DE_EMISION])
GO

ALTER TABLE [dbo].[TABLA_CAI_PUNTO_EMISION]  WITH CHECK ADD FOREIGN KEY([PUNTO_DE_VENTA_CODIGO_BIC])
REFERENCES [dbo].[PUNTO_DE_VENTA] ([CODIGO_BIC])
GO

ALTER TABLE [dbo].[TABLA_CAI_PUNTO_EMISION]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION])
REFERENCES [dbo].[TABLA_CAI_DECLARACION] ([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION])
GO

ALTER TABLE [dbo].[TABLA_CAI_PUNTO_EMISION]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION], [ESTABLECIMIENTO])
REFERENCES [dbo].[CAI_ESTABLECIMIENTO] ([CODIGO_DE_COMPANIA], [NUMERO_DE_DECLARACION], [ESTABLECIMIENTO])
GO

ALTER TABLE [dbo].[TABLA_CAI_RETENCION_CONTROL]  WITH CHECK ADD FOREIGN KEY([CODIGO_BIC])
REFERENCES [dbo].[BASE_INFO_CENTRAL] ([CODIGO_BIC])
GO

ALTER TABLE [dbo].[TABLA_CAI_RETENCION_CONTROL]  WITH CHECK ADD FOREIGN KEY([PREFIJO_PARTIDA_CONTABLE])
REFERENCES [dbo].[NUMERACION_PARTIDAS] ([PREFIJO_PARTIDA_CONTABLE])
GO

ALTER TABLE [dbo].[TABLA_CAI_RETENCIONES_CAT]  WITH CHECK ADD FOREIGN KEY([PREFIJO_PARTIDA_CONTABLE], [NUMERO_DE_PARTIDA])
REFERENCES [dbo].[TABLA_CAI_RETENCION_CONTROL] ([PREFIJO_PARTIDA_CONTABLE], [NUMERO_DE_PARTIDA])
GO


