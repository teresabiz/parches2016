/****** Object:  Table [dbo].[LIQUIDACION_DE_COMPRA_DOCGTO]    Script Date: 5/27/2016 2:48:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LIQUIDACION_DE_COMPRA_DOCGTO](
	[PREFIJO_PARTIDA_CONTABLE] [char](6) NOT NULL,
	[NUMERO_DE_LIQUIDACION] [int] NOT NULL,
	[CODIGO_BIC] [char](8) NOT NULL,
	[DOCUMENTO_ORIGEN_PROVEEDO] [char](25) NOT NULL,
	[NUMERO_DE_COMPRA] [bigint] NOT NULL,
	[FECHA_DE_FACTURA] [datetime] NULL,
	[CODIGO_DE_MONEDA] [char](2) NULL,
	[CODIGO_FORMAS_PAGO] [char](2) NULL,
	[DESCRIPCION_PARTIDA_DETAL] [char](512) NULL,
	[TOTAL_IMPUESTOS_ORIGEN] [money] NULL,
	[IMPUESTO_SOBRE_VENTAS] [money] NULL,
	[FLETES_MONEDA_ORIGEN] [money] NULL,
	[SEGUROS_MONEDA_ORIGEN] [money] NULL,
	[CUENTA_GASTOS_ORIGEN] [money] NULL,
	[SOBRANTES_MONEDA_ORIGEN] [money] NULL,
	[FALTANTES_MONEDA_ORIGEN] [money] NULL,
	[GASTOS_BANCARIOS_ORIGEN] [money] NULL,
	[OTROS_GASTOS_ORIGEN] [money] NULL,
	[ACARREO_MONEDA_ORIGEN] [money] NULL,
	[ALMACENAJE_MONEDA_ORIGEN] [money] NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[PREFIJO_PARTIDA_CONTABLE] ASC,
	[NUMERO_DE_LIQUIDACION] ASC,
	[CODIGO_BIC] ASC,
	[DOCUMENTO_ORIGEN_PROVEEDO] ASC,
	[NUMERO_DE_COMPRA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[LIQUIDACION_DE_COMPRA_DOCGTO]  WITH CHECK ADD FOREIGN KEY([CODIGO_BIC])
REFERENCES [dbo].[PROVEEDOR_TABLA] ([CODIGO_BIC])
GO

ALTER TABLE [dbo].[LIQUIDACION_DE_COMPRA_DOCGTO]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_MONEDA])
REFERENCES [dbo].[MONEDA_TABLA] ([CODIGO_DE_MONEDA])
GO

ALTER TABLE [dbo].[LIQUIDACION_DE_COMPRA_DOCGTO]  WITH CHECK ADD FOREIGN KEY([CODIGO_FORMAS_PAGO])
REFERENCES [dbo].[FORMAS_DE_PAGO] ([CODIGO_FORMAS_PAGO])
GO

ALTER TABLE [dbo].[LIQUIDACION_DE_COMPRA_DOCGTO]  WITH CHECK ADD FOREIGN KEY([PREFIJO_PARTIDA_CONTABLE], [NUMERO_DE_LIQUIDACION])
REFERENCES [dbo].[LIQUIDACION_COMPRA_CONTROL] ([PREFIJO_PARTIDA_CONTABLE], [NUMERO_DE_LIQUIDACION])
GO
