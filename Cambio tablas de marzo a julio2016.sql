


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

/****** Object:  Table [dbo].[ORDEN_DE_COMPRA_DATOS]    Script Date: 05/03/2016 10:18:51 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ORDEN_DE_COMPRA_DATOS](
	[NUMERO_ORDEN_DE_COMPRA] [int] NOT NULL,
	[CODIGO_DE_AGENCIA] [int] NOT NULL,
	[NUMERO_DE_LINEA] [int] NOT NULL,
	[NOMBRE_MARCA] [char](20) NULL,
	[NOMBRE_MODELO] [char](20) NULL,
	[CODIGO_ALTERNO_DE_ARTICUL] [char](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[NUMERO_ORDEN_DE_COMPRA] ASC,
	[CODIGO_DE_AGENCIA] ASC,
	[NUMERO_DE_LINEA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ORDEN_DE_COMPRA_DATOS]  WITH CHECK ADD FOREIGN KEY([NUMERO_ORDEN_DE_COMPRA], [CODIGO_DE_AGENCIA], [NUMERO_DE_LINEA])
REFERENCES [dbo].[ORDEN_COMPRA_DET] ([NUMERO_ORDEN_DE_COMPRA], [CODIGO_DE_AGENCIA], [NUMERO_DE_LINEA])
GO







/****** Object:  Table [dbo].[SOLICITUD_REQ_DE_COMPRA_DT_DA]    Script Date: 05/03/2016 10:17:46 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SOLICITUD_REQ_DE_COMPRA_DT_DA](
	[PREFIJO_PARTIDA_CONTABLE] [char](6) NOT NULL,
	[NUMERO_SOLICITUD_COMPRA] [int] NOT NULL,
	[LINEA] [int] NOT NULL,
	[CODIGO_ALTERNO_DE_ARTICUL] [char](15) NULL,
	[NOMBRE_MARCA] [char](20) NULL,
	[NOMBRE_MODELO] [char](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PREFIJO_PARTIDA_CONTABLE] ASC,
	[NUMERO_SOLICITUD_COMPRA] ASC,
	[LINEA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SOLICITUD_REQ_DE_COMPRA_DT_DA]  WITH CHECK ADD FOREIGN KEY([PREFIJO_PARTIDA_CONTABLE], [NUMERO_SOLICITUD_COMPRA], [LINEA])
REFERENCES [dbo].[SOLICITUD_REQ_DE_COMPRA_DT] ([PREFIJO_PARTIDA_CONTABLE], [NUMERO_SOLICITUD_COMPRA], [LINEA])
GO




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
ALTER TABLE dbo.EMPLEADO_DATOS_ADICIONALES ADD
	ENCARGADO_CODIGO_BIC char(8) NULL,
	HORA_ADICION datetime NULL,
	FECHA_ADICION datetime NULL,
	USUARIO_ADICION varchar(128) NULL,
	HORA_ULTIMO_CAMBIO datetime NULL,
	FECHA_ULTIMO_CAMBIO datetime NULL,
	USUARIO_ULTIMO_CAMBIO varchar(128) NULL
GO
ALTER TABLE dbo.EMPLEADO_DATOS_ADICIONALES SET (LOCK_ESCALATION = TABLE)
GO
COMMIT


update EMPLEADO_DATOS_ADICIONALES
set ENCARGADO_CODIGO_BIC = ''
go 

/****** Object:  View [dbo].[ORDEN_COMPRA_U_PRECIO]    Script Date: 08/11/2016 10:29:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ORDEN_COMPRA_U_PRECIO]
AS
SELECT  A.NUMERO_ORDEN_DE_COMPRA, A.CODIGO_DE_AGENCIA, A.NUMERO_DE_LINEA, A.CODIGO_DE_ARTICULO, A.DESCRIPCION_DEL_ARTICULO, A.CODIGO_DE_EMPAQUE, 
A.CODIGO_UNIDAD_DE_MEDIDA, A.CANTIDAD_A_COMPRAR, A.VALOR_TOTAL, A.IMPUESTO_INCLUIDO, A.COMENTARIOS, A.EXENTA, A.TIPO_DE_ARTICULO_A_COMPRA, 
A.NUMERO_DE_COTIZACION, A.CODIGO_BIC, A.NUMERO_DE_RESOLUCION_DEI, A.LINEA, A.DESCUENTO, A.PORCENTAJE_DE_DESCUENTO, A.VALOR_DEL_IMPUESTO, 
A.CODIGO_DE_PROYECTO, A.COMPRADO_TOTALMENTE_SINO,
ISNULL((SELECT TOP 1 (ORDEN_COMPRA_DET.VALOR_TOTAL+ORDEN_COMPRA_DET.VALOR_DEL_IMPUESTO - ORDEN_COMPRA_DET.DESCUENTO)/ORDEN_COMPRA_DET.CANTIDAD_A_COMPRAR
FROM ORDEN_COMPRA_DET INNER JOIN
ORDEN_COMPRA_CTRL ON ORDEN_COMPRA_DET.NUMERO_ORDEN_DE_COMPRA = ORDEN_COMPRA_CTRL.NUMERO_ORDEN_DE_COMPRA AND 
ORDEN_COMPRA_DET.CODIGO_DE_AGENCIA = ORDEN_COMPRA_CTRL.CODIGO_DE_AGENCIA
WHERE (ORDEN_COMPRA_DET.CODIGO_DE_AGENCIA = A.CODIGO_DE_AGENCIA) AND (ORDEN_COMPRA_DET.CODIGO_DE_ARTICULO = A.CODIGO_DE_ARTICULO) AND (ORDEN_COMPRA_DET.CODIGO_DE_EMPAQUE = A.CODIGO_DE_EMPAQUE) AND 
(ORDEN_COMPRA_DET.CODIGO_UNIDAD_DE_MEDIDA = A.CODIGO_UNIDAD_DE_MEDIDA) AND (ORDEN_COMPRA_CTRL.FECHA_DE_ORDEN <= B.FECHA_DE_ORDEN) AND (ORDEN_COMPRA_CTRL.NUMERO_ORDEN_DE_COMPRA <> A.NUMERO_ORDEN_DE_COMPRA)
ORDER BY ORDEN_COMPRA_CTRL.FECHA_DE_ORDEN DESC, ORDEN_COMPRA_CTRL.NUMERO_ORDEN_DE_COMPRA DESC),0) AS ULTIMO_PRECIO
FROM ORDEN_COMPRA_DET AS A INNER JOIN ORDEN_COMPRA_CTRL AS B ON A.NUMERO_ORDEN_DE_COMPRA = B.NUMERO_ORDEN_DE_COMPRA
AND A.CODIGO_DE_AGENCIA = B.CODIGO_DE_AGENCIA
WHERE (A.TIPO_DE_ARTICULO_A_COMPRA = 1)
GO




/*
Missing Index Details from SQLQuery2.sql - RCASTILLO-PC\SODISARC.BIT_PROIMA (RCASTILLO-PC\RCASTILLO (52))
The Query Processor estimates that implementing the following index could improve the query cost by 97.6815%.
*/



CREATE NONCLUSTERED INDEX [REM_FACT]
ON [dbo].[FACTURA_DIARIA_CONTROL] ([STATUS_DE_LA_FACTURA],[FECHA_DE_FACTURA])
INCLUDE ([PREFIJO_PARTIDA_CONTABLE],[NUMFACTURA],[CODIGO_BIC])
GO



/*
Missing Index Details from SQLQuery5.sql - RCASTILLO-PC\SODISARC.BIT_PROIMA (RCASTILLO-PC\RCASTILLO (63))
The Query Processor estimates that implementing the following index could improve the query cost by 62.1717%.
*/



CREATE NONCLUSTERED INDEX [REM_TRF]
ON [dbo].[TRANSFERENCIA_INVENTA3E4T] ([FECHA_TRANSFERENCIA_RECIB],[CANTIDAD_RECIBIDA])
INCLUDE ([NUMERO_DE_TRANSFERENCIA],[CODIGO_DE_ARTICULO],[NUMERO_DE_LINEA],[CODIGO_DE_EMPAQUE],[CODIGO_UNIDAD_DE_MEDIDA],[BODEGA_ORIGEN_CODIGO_DE_B],[BODEGA_DESTINO_CODIGO_DE],[CODIGO_LOTE_SERIE],[LOTE],[FECHA_TRANSFERENCIA_ENTRE],[CANTIDAD_A_TRANSFERIR],[VALOR_TOTAL_TRANSFERIDO],[VALOR_TOTAL_RECIBIDO],[CODIGO_DE_PROYECTO])
GO

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
ALTER TABLE dbo.REQUISICION_DE_INVENTARIO_DT_GRD ADD
	CANTIDAD_ENTREGADA_11_CAN money NULL,
	CANTIDAD_ENTREGADA_12_CAN money NULL,
	CANTIDAD_ENTREGADA_13_CAN money NULL,
	CANTIDAD_ENTREGADA_14_CAN money NULL,
	CANTIDAD_ENTREGADA_15_CAN money NULL,
	CANTIDAD_ENTREGADA_16_CAN money NULL,
	CANTIDAD_ENTREGADA_17_CAN money NULL,
	CANTIDAD_ENTREGADA_18_CAN money NULL,
	CANTIDAD_ENTREGADA_19_CAN money NULL,
	CANTIDAD_ENTREGADA_20_CAN money NULL
GO
ALTER TABLE dbo.REQUISICION_DE_INVENTARIO_DT_GRD SET (LOCK_ESCALATION = TABLE)
GO
COMMIT



/**/
ALTER TABLE dbo.OI_ACTIVIDAD ADD
                ID_ACTIVIDAD_1 char(8) NULL,
                ID_ACTIVIDAD_2 char(8) NULL,
                ID_ACTIVIDAD_3 char(8) NULL
GO

UPDATE       OI_ACTIVIDAD
SET                ID_ACTIVIDAD_1 = ' ', ID_ACTIVIDAD_2 = ' ', ID_ACTIVIDAD_3 = ' '

GO





/****** Object:  View [dbo].[OI_ACTIV_SUBACTIV]    Script Date: 05/10/2016 15:25:11 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[OI_ACTIV_SUBACTIV]'))
DROP VIEW [dbo].[OI_ACTIV_SUBACTIV]
GO

/****** Object:  View [dbo].[OISUBACTIVIDAD]    Script Date: 05/10/2016 15:25:11 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[OISUBACTIVIDAD]'))
DROP VIEW [dbo].[OISUBACTIVIDAD]
GO

/****** Object:  View [dbo].[OIACTIVIDADES]    Script Date: 05/10/2016 15:25:11 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[OIACTIVIDADES]'))
DROP VIEW [dbo].[OIACTIVIDADES]
GO



/****** Object:  View [dbo].[OI_ACTIV_SUBACTIV]    Script Date: 05/10/2016 15:25:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OI_ACTIV_SUBACTIV]
AS
SELECT     ID_DE_PROYECTO, ANO_DEL_PERIODO, COMPONENTE, ACTIVIDAD_ORGANISMO, NIVEL_DE_ACTIVIDAD, NOMBRE_DE_ACTIVIDAD, DESCRIPCION_ACTIVIDAD, RESPONSABLE_INSTITUCIONAL, 
                      FECHA_DE_INICIO, FECHA_DE_FINALIZACION, MONEDA_ORIGEN_CODIGO_DE_M, PRESUPUESTO_ORIGEN, PRESUPUESTO_FINANCIERO, PRESUPUESTO_REEXPRESADO, 
                      VALOR_DEL_RESULTADO, UNIDAD_DE_MEDIDA_DEL_RESU, ESTATUS_DE_ACTIVIDAD, CATEGORIA, OBJETO_DEL_GASTO, ID_ACTIVIDAD_1 AS Activ, ID_ACTIVIDAD_2 AS subactiv, 
                      ID_ACTIVIDAD_3
FROM         dbo.OI_ACTIVIDAD
WHERE     (NIVEL_DE_ACTIVIDAD = '3')

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[35] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 4
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OI_ACTIVIDAD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 18
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 40
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 3585
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OI_ACTIV_SUBACTIV'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OI_ACTIV_SUBACTIV'
GO

/****** Object:  View [dbo].[OISUBACTIVIDAD]    Script Date: 05/10/2016 15:25:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OISUBACTIVIDAD]
AS
SELECT     ID_DE_PROYECTO, ANO_DEL_PERIODO, COMPONENTE, ACTIVIDAD_ORGANISMO, NIVEL_DE_ACTIVIDAD, NOMBRE_DE_ACTIVIDAD, DESCRIPCION_ACTIVIDAD, RESPONSABLE_INSTITUCIONAL, 
                      FECHA_DE_INICIO, FECHA_DE_FINALIZACION, MONEDA_ORIGEN_CODIGO_DE_M, PRESUPUESTO_ORIGEN, PRESUPUESTO_FINANCIERO, PRESUPUESTO_REEXPRESADO, 
                      VALOR_DEL_RESULTADO, UNIDAD_DE_MEDIDA_DEL_RESU, ESTATUS_DE_ACTIVIDAD, CATEGORIA, OBJETO_DEL_GASTO, ID_ACTIVIDAD_1 AS ACTIV, ID_ACTIVIDAD_2, ID_ACTIVIDAD_3
FROM         dbo.OI_ACTIVIDAD
WHERE     (NIVEL_DE_ACTIVIDAD = '2')

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[45] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OI_ACTIVIDAD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 203
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 13
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 3975
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OISUBACTIVIDAD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OISUBACTIVIDAD'
GO

/****** Object:  View [dbo].[OIACTIVIDADES]    Script Date: 05/10/2016 15:25:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OIACTIVIDADES]
AS
SELECT     ID_DE_PROYECTO, ANO_DEL_PERIODO, COMPONENTE, ACTIVIDAD_ORGANISMO, NIVEL_DE_ACTIVIDAD, NOMBRE_DE_ACTIVIDAD, DESCRIPCION_ACTIVIDAD, RESPONSABLE_INSTITUCIONAL, 
                      FECHA_DE_INICIO, FECHA_DE_FINALIZACION, MONEDA_ORIGEN_CODIGO_DE_M, PRESUPUESTO_ORIGEN, PRESUPUESTO_FINANCIERO, PRESUPUESTO_REEXPRESADO, 
                      VALOR_DEL_RESULTADO, UNIDAD_DE_MEDIDA_DEL_RESU, ESTATUS_DE_ACTIVIDAD, CATEGORIA, OBJETO_DEL_GASTO, ID_ACTIVIDAD_1, ID_ACTIVIDAD_2, ID_ACTIVIDAD_3
FROM         dbo.OI_ACTIVIDAD
WHERE     (NIVEL_DE_ACTIVIDAD = '1')

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[11] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OI_ACTIVIDAD"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 174
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 15
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OIACTIVIDADES'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OIACTIVIDADES'
GO





/****** Object:  Table [dbo].[TRN_CONVERSION_DETALLE]    Script Date: 05/03/2016 09:45:33 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TRN_CONVERSION_DETALLE](
	[DEFINICION_DEL_PROCESO] [char](6) NOT NULL,
	[CORRELATIVO_ICP] [int] NOT NULL,
	[CORRELATIVO] [int] NOT NULL,
	[CODIGO_DE_AGENCIA] [int] NOT NULL,
	[ANO_DE_INVENTARIO] [int] NULL,
	[CODIGO_DE_ARTICULO] [char](15) NULL,
	[CODIGO_DE_EMPAQUE] [char](6) NULL,
	[CODIGO_UNIDAD_DE_MEDIDA] [char](6) NULL,
	[UNIDAD_MEDIDA_BASE] [char](6) NULL,
	[CODIGO_DE_BODEGA] [char](2) NULL,
	[CODIGO_LOTE_SERIE] [char](25) NULL,
	[LOTE] [int] NULL,
	[VALOR_DEBITO_MONEDA_ORIGE] [money] NULL,
	[VALOR_DEBITO_MONEDA_FINAN] [money] NULL,
	[VALOR_DEBITO_MONEDA_REEXP] [money] NULL,
	[UNIDADES_DEBITO_INV] [money] NULL,
	[CANTIDAD_ENTREGADA] [money] NULL,
	[CODIGO_BIC] [char](8) NULL,
 CONSTRAINT [PK__TRN_CONV__9F64E35224FE1D0A] PRIMARY KEY CLUSTERED 
(
	[DEFINICION_DEL_PROCESO] ASC,
	[CORRELATIVO_ICP] ASC,
	[CORRELATIVO] ASC,
	[CODIGO_DE_AGENCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO





/***/
/*Eliminar las llaves primarias*/
DECLARE  @constraintname SYSNAME, @objectid VARCHAR(100),
           @sqlcmd         VARCHAR(1024)
DECLARE CONSTRAINTSCURSOR CURSOR  FOR
SELECT CONSTRAINT_NAME, TABLE_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1
AND table_name = 'TRN_CONVERSION_DETALLE'
GROUP BY CONSTRAINT_NAME, TABLE_NAME
OPEN CONSTRAINTSCURSOR
FETCH NEXT FROM CONSTRAINTSCURSOR
INTO @constraintname, @objectid
WHILE (@@FETCH_STATUS = 0)
BEGIN
    SELECT @sqlcmd = 'ALTER TABLE ' + @objectid + ' DROP CONSTRAINT ' + @constraintname
    EXEC( @sqlcmd)
    FETCH NEXT FROM CONSTRAINTSCURSOR
    INTO @constraintname, @objectid
END
CLOSE CONSTRAINTSCURSOR
DEALLOCATE CONSTRAINTSCURSOR

/*Actualizar el Valor a Blanco*/
UPDATE    TRN_CONVERSION_DETALLE
SET              CODIGO_BIC = ''
WHERE     (CODIGO_BIC IS NULL)

/*Actualizar el campo a Not null*/
ALTER TABLE TRN_CONVERSION_DETALLE ALTER COLUMN CODIGO_BIC INTEGER NOT NULL

/*Poner las Nuevas Llaves*/
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
ALTER TABLE dbo.TRN_CONVERSION_DETALLE ADD CONSTRAINT
	PK_TRN_CONVERSION_DETALLE PRIMARY KEY CLUSTERED 
	(
	DEFINICION_DEL_PROCESO,
	CORRELATIVO_ICP,
	CORRELATIVO,
	CODIGO_DE_AGENCIA,
	CODIGO_BIC
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TRN_CONVERSION_DETALLE SET (LOCK_ESCALATION = TABLE)
GO
COMMIT



/***/
/*Eliminar las llaves primarias*/
DECLARE  @constraintname SYSNAME, @objectid VARCHAR(100),
           @sqlcmd         VARCHAR(1024)
DECLARE CONSTRAINTSCURSOR CURSOR  FOR
SELECT CONSTRAINT_NAME, TABLE_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1
AND table_name = 'TRN_CONVERSION_DETALLE'
GROUP BY CONSTRAINT_NAME, TABLE_NAME
OPEN CONSTRAINTSCURSOR
FETCH NEXT FROM CONSTRAINTSCURSOR
INTO @constraintname, @objectid
WHILE (@@FETCH_STATUS = 0)
BEGIN
    SELECT @sqlcmd = 'ALTER TABLE ' + @objectid + ' DROP CONSTRAINT ' + @constraintname
    EXEC( @sqlcmd)
    FETCH NEXT FROM CONSTRAINTSCURSOR
    INTO @constraintname, @objectid
END
CLOSE CONSTRAINTSCURSOR
DEALLOCATE CONSTRAINTSCURSOR

/*Actualizar el Valor a Blanco*/
UPDATE    TRN_CONVERSION_DETALLE
SET              CODIGO_BIC = ''
WHERE     (CODIGO_BIC IS NULL)

/*Actualizar el campo a Not null*/
ALTER TABLE TRN_CONVERSION_DETALLE ALTER COLUMN CODIGO_BIC INTEGER NOT NULL

/*Poner las Nuevas Llaves*/
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
ALTER TABLE dbo.TRN_CONVERSION_DETALLE ADD CONSTRAINT
	PK_TRN_CONVERSION_DETALLE PRIMARY KEY CLUSTERED 
	(
	DEFINICION_DEL_PROCESO,
	CORRELATIVO_ICP,
	CORRELATIVO,
	CODIGO_DE_AGENCIA,
	CODIGO_BIC
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TRN_CONVERSION_DETALLE SET (LOCK_ESCALATION = TABLE)
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
ALTER TABLE dbo.LIQUIDACION_COMPRA_DETALLE ADD
	DOCUMENTO_ORIGEN_PROVEEDO char(25) NULL
GO
ALTER TABLE dbo.LIQUIDACION_COMPRA_DETALLE SET (LOCK_ESCALATION = TABLE)
GO
COMMIT


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

/***/
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
ALTER TABLE dbo.PUESTO_PHYSICAL_TABLE ADD
	CODIGO_CENTRO_DE_COSTO char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	AGRUPACION_CENTRO_DE_COSTO char(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CODIGO_TIPO_DE_GASTO char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CODIGO_DE_AGENCIA int NULL
GO
ALTER TABLE dbo.PUESTO_PHYSICAL_TABLE SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

/***/
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
ALTER TABLE NIVEL_DE_EDUCACION_TABLA

ALTER COLUMN NOMBRE_NIVEL_EDUCATIVO char(250)
GO
ALTER TABLE dbo.NIVEL_DE_EDUCACION_TABLA SET (LOCK_ESCALATION = TABLE)
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
ALTER TABLE HABILIDADES_PHYSICAL_TABT

ALTER COLUMN DESCRIPCION_DE_HABILIDAD char(250)
GO
ALTER TABLE dbo.HABILIDADES_PHYSICAL_TABT SET (LOCK_ESCALATION = TABLE)
GO
COMMIT



/****** Object:  Table [dbo].[PUESTO_EDUCACION_REQUERIT]    Script Date: 06/07/2016 11:51:38 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PUESTO_EDUCACION_REQUERIT](
	[CODIGO_DE_PUESTO] [char](6) NOT NULL,
	[NIVEL_DE_EDUCACION] [char](2) NOT NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_DE_PUESTO] ASC,
	[NIVEL_DE_EDUCACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PUESTO_EDUCACION_REQUERIT]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_PUESTO])
REFERENCES [dbo].[PUESTO_PHYSICAL_TABLE] ([CODIGO_DE_PUESTO])
GO

ALTER TABLE [dbo].[PUESTO_EDUCACION_REQUERIT]  WITH CHECK ADD FOREIGN KEY([NIVEL_DE_EDUCACION])
REFERENCES [dbo].[NIVEL_DE_EDUCACION_TABLA] ([NIVEL_DE_EDUCACION])
GO


/****** Object:  Table [dbo].[PUESTO_HABILIDADES_REQUET]    Script Date: 06/07/2016 11:52:45 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PUESTO_HABILIDADES_REQUET](
	[CODIGO_DE_PUESTO] [char](6) NOT NULL,
	[CODIGO_DE_HABILIDAD] [char](6) NOT NULL,
	[HORA_ADICION] [datetime] NULL,
	[FECHA_ADICION] [datetime] NULL,
	[USUARIO_ADICION] [varchar](128) NULL,
	[HORA_ULTIMO_CAMBIO] [datetime] NULL,
	[FECHA_ULTIMO_CAMBIO] [datetime] NULL,
	[USUARIO_ULTIMO_CAMBIO] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODIGO_DE_PUESTO] ASC,
	[CODIGO_DE_HABILIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PUESTO_HABILIDADES_REQUET]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_HABILIDAD])
REFERENCES [dbo].[HABILIDADES_PHYSICAL_TABT] ([CODIGO_DE_HABILIDAD])
GO

ALTER TABLE [dbo].[PUESTO_HABILIDADES_REQUET]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_PUESTO])
REFERENCES [dbo].[PUESTO_PHYSICAL_TABLE] ([CODIGO_DE_PUESTO])
GO


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




/****** Object:  Table [dbo].[PUESTO_EXPERIENCIA_REQUET]    Script Date: 06/07/2016 11:52:02 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PUESTO_EXPERIENCIA_REQUET](
	[CODIGO_DE_PUESTO] [char](6) NOT NULL,
	[NUMERO_LINEA] [numeric](9, 0) NOT NULL,
	[PUESTO_EXPERIENCI_REQUERI] [varchar](1024) NULL,
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

ALTER TABLE [dbo].[PUESTO_EXPERIENCIA_REQUET]  WITH CHECK ADD FOREIGN KEY([CODIGO_DE_PUESTO])
REFERENCES [dbo].[PUESTO_PHYSICAL_TABLE] ([CODIGO_DE_PUESTO])
GO
















