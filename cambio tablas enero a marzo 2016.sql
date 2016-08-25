CREATE TABLE [dbo].[ORDEN_COMPRA_CTRL_N](
	[CODIGO_DE_AGENCIA] [int] NOT NULL,
	[NUMERO_ORDEN_DE_COMPRA] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_DE_AGENCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ORDEN_COMPRA_CTRL_N]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_AGENCIA])
REFERENCES [dbo].[AGENCIA] ([CODIGO_DE_AGENCIA])
GO


BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.EMPLEADO_TIEMPOS_RELOJ_OTROS ADD
	CODIGO_CENTRO_DE_COSTO char(6) NULL,
	AGRUPACION_CENTRO_DE_COSTO char(10) NULL,
	HORA_ADICION datetime NULL,
	FECHA_ADICION datetime NULL,
	USUARIO_ADICION varchar(128) NULL,
	HORA_ULTIMO_CAMBIO datetime NULL,
	FECHA_ULTIMO_CAMBIO datetime NULL,
	USUARIO_ULTIMO_CAMBIO varchar(128) NULL
GO
ALTER TABLE dbo.EMPLEADO_TIEMPOS_RELOJ_OTROS SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.EMPLEADO_TIEMPOS_TABLA ADD
	CODIGO_CENTRO_DE_COSTO char(6) NULL,
	AGRUPACION_CENTRO_DE_COSTO char(10) NULL,
	HORA_ADICION datetime NULL,
	FECHA_ADICION datetime NULL,
	HORA_ULTIMO_CAMBIO datetime NULL,
	FECHA_ULTIMO_CAMBIO datetime NULL,
	USUARIO_ULTIMO_CAMBIO varchar(128) NULL
GO
ALTER TABLE dbo.EMPLEADO_TIEMPOS_TABLA SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PERIODO_DE_PLANILLA_PDAS ADD
	ORIGEN_PDA_PLANILLA char(1) NULL,
	AUXILIAR_PDA_PLANILLA char(1) NULL
GO
ALTER TABLE dbo.PERIODO_DE_PLANILLA_PDAS SET (LOCK_ESCALATION = TABLE)
GO
COMMIT



/****** Object:  Table [dbo].[TRANSACCIONES_PLA_TEMP_PDA_TG]    Script Date: 12/3/2015 12:47:16 AM ******/
DROP TABLE [dbo].[TRANSACCIONES_PLA_TEMP_PDA_TG]
GO

/****** Object:  Table [dbo].[TRANSACCIONES_PLA_TEMP_PDA_TG]    Script Date: 12/3/2015 12:47:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TRANSACCIONES_PLA_TEMP_PDA_TG](
	[CODIGO_CLASE_DE_PLANILLA] [char](2) NOT NULL,
	[CODIGO_TIPO_DE_PLANILLA] [char](2) NOT NULL,
	[ANO_PLANILLA] [int] NOT NULL,
	[PERIODO_PLANILLA] [int] NOT NULL,
	[TIPO_DEF_TRN_PLANILLA] [char](1) NOT NULL,
	[CODIGO_DE_CUENTA] [char](25) NOT NULL,
	[CODIGO_BIC] [char](8) NOT NULL,
	[CREDITO_RESERVA_CODIGO_DE_CUEN] [char](25) NOT NULL,
	[CODIGO_TIPO_DE_GASTO] [char](6) NOT NULL,
	[VALOR_CALCULO] [money] NULL,
	[CODIGO_DE_AGENCIA] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_CLASE_DE_PLANILLA] ASC,
	[CODIGO_TIPO_DE_PLANILLA] ASC,
	[ANO_PLANILLA] ASC,
	[PERIODO_PLANILLA] ASC,
	[TIPO_DEF_TRN_PLANILLA] ASC,
	[CODIGO_DE_CUENTA] ASC,
	[CODIGO_BIC] ASC,
	[CREDITO_RESERVA_CODIGO_DE_CUEN] ASC,
	[CODIGO_TIPO_DE_GASTO] ASC,
	[CODIGO_DE_AGENCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO




BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.TRN_CONTABLE_HISTORIC3N9T_CEF ADD
	ORDEN_ETAPA_CULTIVO int NULL
GO
ALTER TABLE dbo.TRN_CONTABLE_HISTORIC3N9T_CEF SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

update TRN_CONTABLE_HISTORIC3N9T_CEF
set ORDEN_ETAPA_CULTIVO = 0


