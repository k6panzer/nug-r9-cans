SELECT     TOP (100) PERCENT CID,
                          (SELECT     COUNT(CASE_NO) AS Expr1
                            FROM          dbo.t_Client_EncounterData AS CountCrisis
                            WHERE      (CRISIS_IND = 'Y') AND (CASE_NO = dbo.t_Client.CID) AND (CAST(SERVICE_DT AS datetime) BETWEEN CONVERT(DATETIME, '2012-07-31 00:00:00', 102) 
                                                   AND CONVERT(DATETIME, '2013-07-31 00:00:00', 102)) AND (SUBSTRING(GRID_CD, 1, 1) = '1')) AS CrisisCount
FROM         dbo.t_Client
ORDER BY CID
