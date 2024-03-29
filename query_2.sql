SELECT 
    AREA_CURSO,
    COUNT(*) AS TOTAL,
    100 * COUNT(*) / (SELECT COUNT(*) FROM CURSO) AS PORCENTAGEM
FROM
    CURSO
WHERE
    SITUACAO = 'Em atividade'
GROUP BY AREA_CURSO
ORDER BY 2 DESC;
