Create Proc VistaPorId
@ID_alumno int
AS
	BEGIN
	SELECT *
	FROM Tbl_Alumnos
	WHERE ID_alumno = @ID_alumno
	END