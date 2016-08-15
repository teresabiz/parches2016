DECLARE @grupo char(10), @prefijo char(6), @partida int, @descripcion char(512), @documento char(25), @fechapda datetime, @numerodetalle int, @valorf money, @valorr money, @dbf money, @crf money, @dbr money, @crr money, @cuenta char(25), @anioperiodo int, @numeroperiodo smallint, @tipogasto char(6), @unidades money, @tasacambio money, @aniociclo int, @ciclo int, @finca char(8), @laguna char(15), @Hectareas Float, @CentroCosto char(6), @CentroCostoLaguna Char(6),
@Etapa int
Declare lineasdirectas_cursor SCROLL CURSOR FOR 
SELECT     A.CODIGO_CENTRO_DE_COSTO, A.PREFIJO_PARTIDA_CONTABLE, A.NUMERO_DE_PARTIDA, A.DESCRIPCION_PARTIDA_DETAL, 
                      A.DOCUMENTO_PARTIDA_DETALLE, A.FECHA_DE_PARTIDA_DETALLE, A.NUMERO_TRN_DIARIO_DETALLE, A.VALOR_TRANSACCION_ORIGEN, 
                      A.VALOR_TRANSACCION_ORIG2JT, A.FINANCIERA_VALOR_TRANSACC, A.FINANCIERA_VALOR_TRANS3Q3, A.REEXPRESION_VALOR_TRANSAC, 
                      A.REEXPRESION_VALOR_TRAN3Q6, A.CODIGO_DE_CUENTA, A.ANO_DEL_PERIODO, A.NUMERO_DEL_PERIODO, A.CODIGO_TIPO_DE_GASTO, 
                      A.UNIDADES, A.VALOR_TASA_DE_CAMBIO
FROM         TRN_CONTABLE_HISTORIC3N9T A INNER JOIN CATALOGO_CONTABLE_DATOS B ON A.CODIGO_DE_CUENTA = B.CODIGO_DE_CUENTA
WHERE     (B.MODULO_DISTRIBUCION_CONTABLE in ('1','3')) AND (A.CODIGO_CENTRO_DE_COSTO <> '') AND (A.PREFIJO_PARTIDA_CONTABLE = '_IAF') AND (A.NUMERO_DE_PARTIDA = 284)
--and A.NUMERO_TRN_DIARIO_DETALLE = 102
ORDER BY A.PREFIJO_PARTIDA_CONTABLE, A.NUMERO_DE_PARTIDA, A.NUMERO_TRN_DIARIO_DETALLE
OPEN lineasdirectas_cursor
	FETCH NEXT FROM lineasdirectas_cursor INTO @CentroCosto, @prefijo, @partida, @descripcion, @documento, @fechapda, @numerodetalle, @valorf, @valorr, @dbf, @crf, @dbr, @crr, @cuenta, @anioperiodo, @numeroperiodo, @tipogasto, @unidades, @tasacambio
	WHILE @@FETCH_STATUS = 0
	BEGIN
	Set @grupo = ''
	Set @aniociclo = 0
	Set @ciclo = 0
	set @finca = ''
	set @laguna = ''
	set @Hectareas = 0
	SELECT     @aniociclo =D.AÑO_DEL_CICLO, @ciclo = D.NUMERO_DE_CICLO, @finca = D.CODIGO_BIC, @laguna =D.LAGUNA, @Hectareas = D.HECTAREAS_PROCESADAS_HECT, @CentroCostoLaguna = C.CODIGO_CENTRO_DE_COSTO
	FROM         LAGUNA_X_PRODUCTOR_TABLA C LEFT OUTER JOIN
                 CICLO_DE_FINCA_LAGUNA_PHT D ON C.CODIGO_BIC COLLATE DATABASE_DEFAULT = D.CODIGO_BIC COLLATE DATABASE_DEFAULT AND C.LAGUNA COLLATE DATABASE_DEFAULT = D.LAGUNA COLLATE DATABASE_DEFAULT
	WHERE     (C.CODIGO_CENTRO_DE_COSTO = @CentroCosto) AND (D.FECHA_DE_INICIO <= @fechapda) AND 
                      (D.FECHA_DE_CIERRE >= @fechapda)
	ORDER BY D.NUMERO_DE_CICLO DESC
	SELECT @Etapa = ORDEN_ETAPA_CULTIVO
	FROM  COP_ETAPAS_CULTIVO_FECHAS
	WHERE  (FECHA_DE_INICIO <= @fechapda) AND (FECHA_DE_CIERRE >= @fechapda) AND 
                      (CODIGO_BIC = @finca) AND (LAGUNA = @laguna)
	if @finca = '' or @finca is null
	begin
		Set @aniociclo = 0 Set @ciclo = 0 set @finca = '' set @laguna = '' set @Hectareas = 0 set @Etapa = 0
	end
	if EXISTS (SELECT * FROM LAGUNA_X_PRODUCTOR_TABLA WHERE CODIGO_CENTRO_DE_COSTO = @CentroCosto)
	begin	
		insert into TRN_CONTABLE_HISTORIC3N9T_CEF
		select 'NG', @prefijo, @partida, @descripcion, @documento, @fechapda, @numerodetalle, @valorf, @valorr, @dbf, @crf, @dbr, @crr, @cuenta, @anioperiodo, @numeroperiodo, @tipogasto, @unidades, @tasacambio, @aniociclo, @ciclo, @finca, @laguna, @Hectareas, @grupo, @CentroCosto, @numerodetalle, @Etapa 
	end
	FETCH NEXT FROM lineasdirectas_cursor INTO @CentroCosto, @prefijo, @partida, @descripcion, @documento, @fechapda, @numerodetalle, @valorf, @valorr, @dbf, @crf, @dbr, @crr, @cuenta, @anioperiodo, @numeroperiodo, @tipogasto, @unidades, @tasacambio
END
CLOSE lineasdirectas_cursor
DEALLOCATE lineasdirectas_cursor