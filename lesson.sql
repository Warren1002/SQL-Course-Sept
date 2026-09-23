/*
Example lesson stub
some change
*/
SELECT   ps.PatientId,
         ps.AdmittedDate,
         ps.DischargeDate,
         ps.hospital,
         ps.Ward,
         ps.Ethnicity,
         DATEDIFF(day, ps.AdmittedDate, ps.DischargeDate) AS LOS
FROM     PatientStay AS ps
WHERE    ps.Hospital IN ('Kingston', 'Pruh')
         AND --and ps.ward Like '%surgery%'
         ps.AdmittedDate BETWEEN DATEFROMPARTS(2024, 2, 28) AND DATEFROMPARTS(2024, 3, 01)
ORDER BY LOS DESC, Ps.AdmittedDate DESC;

SELECT DATEFROMPARTS(2024, 2, 29);

SELECT   ps.Hospital,
         ps.Ward,
         count(*) AS NumberofPatients,
         Sum(ps.tariff) AS totalTariff,
         MAX(ps.tariff) AS BiggestTariff
FROM     PatientStay AS ps
GROUP BY ps.Hospital, ps.Ward
HAVING   Sum(ps.tariff) >= 10
ORDER BY totalTariff DESC;