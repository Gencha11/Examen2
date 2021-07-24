CREATE PROCEDURE dbo.PersonaInsertar
    @IdPersona INT,
	@Cedula varchar(250)	,
	@Nombre varchar(250)	,
	@Primer_Apellido varchar(250),
	@Segundo_Apellido varchar(250),
	@FechaNacimiento DATE,
	@TieneHijos BIT ,
	@Cuantos VARCHAR(1000)= NULL,
	@Estado BIT 
	
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
		INSERT INTO dbo.Persona 
		(
		  IdPersona
	    , Cedula
	    , Nombre 
	    , Primer_Apellido
	    , Segundo_Apellido 
	    , FechaNacimiento 
		, TieneHijos
		, Cuantos
		, Estado
		)
		VALUES
		(
		 @IdPersona
		, @Cedula
	    , @Nombre 
	    , @Primer_Apellido
	    , @Segundo_Apellido 
	    , @FechaNacimiento 
		, @TieneHijos
		, @Cuantos
		, @Estado
		)


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END