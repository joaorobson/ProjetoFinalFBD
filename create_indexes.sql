CREATE INDEX COD_CURSO_index ON CURSO(COD_CURSO);

CREATE INDEX COD_INSTITUICAO_index ON INSTITUICAO(COD_INSTITUICAO);

CREATE INDEX COD_MUNICIPIO_index ON CURSO(COD_MUNICIPIO);

CREATE INDEX fks_MUNICIPIO_has_CURSO_index 
ON MUNICIPIO_has_CURSO(CURSO_COD_CURSO, MUNICIPIO_COD_MUNICIPIO);
