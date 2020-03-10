Create Proc EliminarPorId
@ID_alumno int
AS
	BEGIN
	DELETE FROM Tbl_Alumnos
	WHERE ID_alumno = @ID_alumno
	END