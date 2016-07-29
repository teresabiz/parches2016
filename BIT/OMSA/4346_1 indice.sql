/*
Missing Index Details from SQLQuery2.sql - RCASTILLO-PC\SODISARC.BIT_PROIMA (RCASTILLO-PC\RCASTILLO (52))
The Query Processor estimates that implementing the following index could improve the query cost by 97.6815%.
*/



CREATE NONCLUSTERED INDEX [REM_FACT]
ON [dbo].[FACTURA_DIARIA_CONTROL] ([STATUS_DE_LA_FACTURA],[FECHA_DE_FACTURA])
INCLUDE ([PREFIJO_PARTIDA_CONTABLE],[NUMFACTURA],[CODIGO_BIC])
GO

