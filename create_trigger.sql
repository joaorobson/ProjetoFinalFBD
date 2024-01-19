DELIMITER //

CREATE TRIGGER trg_check_municipio_has_curso
BEFORE INSERT ON MUNICIPIO_has_CURSO
FOR EACH ROW
BEGIN
  DECLARE municipio_count INT;
  DECLARE curso_count INT;

  -- Check if MUNICIPIO_COD_MUNICIPIO exists in MUNICIPIO table
  CALL GetMunicipioCount(NEW.MUNICIPIO_COD_MUNICIPIO, municipio_count);
  -- Check if CURSO_COD_CURSO exists in CURSO table
  CALL GetCursoCount(NEW.CURSO_COD_CURSO, curso_count);

  -- If either the MUNICIPIO or CURSO doesn't exist, prevent the insertion
  IF municipio_count = 0 OR curso_count = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid MUNICIPIO_COD_MUNICIPIO or CURSO_COD_CURSO';
  END IF;
END //

DELIMITER ;
