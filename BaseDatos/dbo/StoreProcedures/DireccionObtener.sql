CREATE PROCEDURE [dbo].DireccionObtener
@IdDireccion INT=NULL

AS BEGIN
	SET NOCOUNT ON

	SELECT

	        CP.IdCatalogoProvincia
		,	CP.NombreCatalogoProvincia

		,	D.IdDireccion
		,   D.DireccionExacta
		,   D.Estado

		,   CD.IdCatalogoDistrito
		,	CD.NombreCatalogoDistrito
	
		,   CC.IdCatalogoCanton
		,	CC.NombreCatalogoCanton
		

		,   P.IdPersona
		,	P.Nombre
	
				

	FROM dbo.Direccion D
	 INNER JOIN dbo.CatalogoProvincia CP
         ON D.IdCatalogoProvincia = CP.IdCatalogoProvincia
     INNER JOIN dbo.CatalogoCanton CC
         ON D.IdCatalogoCanton = CC.IdCatalogoCanton
	 INNER JOIN dbo.CatalogoDistrito CD
         ON D.IdCatalogoDistrito = CD.IdCatalogoDistrito
	 INNER JOIN dbo.Persona P
         ON D.IdPersona = P.IdPersona
	WHERE
	     (@IdDireccion IS NULL OR IdDireccion=@IdDireccion)

END