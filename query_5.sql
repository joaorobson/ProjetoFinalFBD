SELECT 
  REGIAO, 
  COUNT(DISTINCT COD_INSTITUICAO) AS NUM_INSTITUICOES_AVALIADAS, 
  ROUND(
    AVG(CONCEITO_ENADE), 
    2
  ) AS MEDIA_CONCEITO_ENADE, 
  MAX(CONCEITO_ENADE) AS CONCEITO_ENADE_MAX, 
  MIN(CONCEITO_ENADE) AS CONCEITO_ENADE_MIN, 
  ROUND(
    STD(CONCEITO_ENADE), 
    2
  ) AS CONCEITO_ENADE_STD_DEV 
FROM 
  CURSO C 
  JOIN MUNICIPIO_has_CURSO MC ON C.COD_CURSO = MC.CURSO_COD_CURSO 
  JOIN MUNICIPIO M ON MC.MUNICIPIO_COD_MUNICIPIO = M.COD_MUNICIPIO 
WHERE 
  C.SITUACAO = 'Em atividade' 
  AND CONCEITO_ENADE IS NOT NULL 
  AND REGIAO != 'IGNORADO/EXTERIOR' 
GROUP BY 
  REGIAO 
ORDER BY 
  REGIAO;