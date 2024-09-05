DELIMITER //

CREATE PROCEDURE InsertarRemesa(
    IN p_Monto DECIMAL(10, 2),
    IN p_Moneda VARCHAR(3),
    IN p_Fecha_Creacion DATETIME,
    IN p_Estado VARCHAR(20),
    IN p_ID_Merchant INT,
    IN p_Tipo_Documento_Remitente VARCHAR(10),
    IN p_Num_Documento_Remitente VARCHAR(20),
    IN p_Nombre_Remitente VARCHAR(100),
    IN p_Email_Remitente VARCHAR(100),
    IN p_Tel_Remitente VARCHAR(15),
    IN p_Tipo_Documento_Beneficiario VARCHAR(10),
    IN p_Num_Documento_Beneficiario VARCHAR(20),
    IN p_Nombre_Beneficiario VARCHAR(100),
    IN p_Email_Beneficiario VARCHAR(100),
    IN p_Tel_Beneficiario VARCHAR(15),
    IN p_Cta_Bancaria VARCHAR(30),
    IN p_Resultado VARCHAR(20),
    IN p_Fecha_Validacion DATETIME,
    IN p_ID_Proveedor INT
)
BEGIN
    DECLARE v_ID_Remitente INT;
    DECLARE v_ID_Beneficiario INT;
    DECLARE v_ID_Remesa INT;
    
    -- Insertar Remitente
    INSERT INTO Remitente (Tipo_Documento, Num_Documento, Nombre_Remitente, Email_Remitente, Tel_Remitente)
    VALUES (p_Tipo_Documento_Remitente, p_Num_Documento_Remitente, p_Nombre_Remitente, p_Email_Remitente, p_Tel_Remitente);
    
    SET v_ID_Remitente = LAST_INSERT_ID();
    
    -- Insertar Beneficiario
    INSERT INTO Beneficiario (Tipo_Documento, Num_Documento, Nombre_Beneficiario, Email_Beneficiario, Tel_Beneficiario, Cta_Bancaria)
    VALUES (p_Tipo_Documento_Beneficiario, p_Num_Documento_Beneficiario, p_Nombre_Beneficiario, p_Email_Beneficiario, p_Tel_Beneficiario, p_Cta_Bancaria);
    
    SET v_ID_Beneficiario = LAST_INSERT_ID();
    
    -- Insertar Remesa
    INSERT INTO Remesa (Monto, Moneda, Fecha_Creacion, Estado, ID_Merchant)
    VALUES (p_Monto, p_Moneda, p_Fecha_Creacion, p_Estado, p_ID_Merchant);
    
    SET v_ID_Remesa = LAST_INSERT_ID();
    
    -- Insertar Validación
    INSERT INTO Validacion (Resultado, Fecha_Validacion, ID_Remitente, ID_Beneficiario, ID_Proveedor)
    VALUES (p_Resultado, p_Fecha_Validacion, v_ID_Remitente, v_ID_Beneficiario, p_ID_Proveedor);
    
    -- Finalización
    SELECT 'Remesa insertada con éxito' AS Mensaje, v_ID_Remesa AS ID_Remesa;
END //

DELIMITER ;
