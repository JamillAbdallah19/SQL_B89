CREATE VIEW RemesasFallidasPorMerchant AS
SELECT 
    m.Nombre_Merchant,
    COUNT(r.ID_Remesa) AS Cantidad_Remesas_Fallidas
FROM 
    Remesa r
JOIN 
    Merchant m ON r.ID_Merchant = m.ID_Merchant
WHERE 
    r.Estado = 'fallido'  -- criterio
    AND r.Fecha_Creacion >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)  -- ultimo mes 
GROUP BY 
    m.Nombre_Merchant;


CREATE VIEW Top10Beneficiarios AS
SELECT 
    b.ID_Beneficiario,
    b.Nombre_Beneficiario,
    b.Tipo_Documento,
    b.Num_Documento,
    b.Email_Beneficiario,
    b.Tel_Beneficiario,
    b.Cta_Bancaria,
    COUNT(v.ID_Remesa) AS Cantidad_Remesas_Recibidas
FROM 
    Validacion v
JOIN 
    Beneficiario b ON v.ID_Beneficiario = b.ID_Beneficiario
JOIN 
    Remesa r ON v.ID_Remesa = r.ID_Remesa
WHERE 
    r.Fecha_Creacion >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)  -- ultimo mes
GROUP BY 
    b.ID_Beneficiario
ORDER BY 
    Cantidad_Remesas_Recibidas DESC
LIMIT 10;


