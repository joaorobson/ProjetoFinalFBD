DELIMITER //

CREATE PROCEDURE GetCursoCount(IN in_cod_curso INT, OUT out_curso_count INT)
BEGIN
  -- Declare variable to store the count
  DECLARE curso_count INT;

  -- Check the count of rows with the specified COD_CURSO in the CURSO table
  SELECT COUNT(*) INTO curso_count FROM CURSO WHERE COD_CURSO = in_cod_curso;

  -- Set the OUT parameter
  SET out_curso_count = curso_count;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetMunicipioCount(IN in_municipio_cod INT, OUT out_municipio_count INT)
BEGIN
  -- Declare variable to store the count
  DECLARE municipio_count INT;

  -- Check the count of rows with the specified COD_MUNICIPIO in the MUNICIPIO table
  SELECT COUNT(*) INTO municipio_count FROM MUNICIPIO WHERE COD_MUNICIPIO = in_municipio_cod;

  -- Set the OUT parameter
  SET out_municipio_count = municipio_count;
END //

DELIMITER ;
