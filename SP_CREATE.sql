Create Proc AlumnoCrearActualizar
@ID_alumno int,
@Nombre varchar(45),
@Apellidos varchar(45),
@Edad int,
@Nivel varchar(25),
@Mail varchar(46),
@Stat varchar(40),
@Matricula varchar(25)

AS
BEGIN
IF(@ID_alumno = 0)
	BEGIN
	INSERT INTO Tbl_Alumnos 
	VALUES(@Nombre,@Apellidos,@Edad,@Nivel,@Mail,@Stat,@Matricula)
END
ELSE
	BEGIN
	UPDATE Tbl_Alumnos
	SET
	 Nombre = @Nombre,
	 Apellidos = @Apellidos,
	 Edad = @Edad,
	 Nivel = @Nivel,
	 Mail = @Mail,
	 Stat = @Stat,
	 Matricula = @Matricula
	 WHERE ID_alumno = @ID_alumno
	 END
END