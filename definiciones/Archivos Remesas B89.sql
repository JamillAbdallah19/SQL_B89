CREATE TABLE Merchant (
    ID_Merchant INT PRIMARY KEY,
    Nombre_Merchant VARCHAR(100),
    Email_Merchant VARCHAR(100),
    Tel_Merchant VARCHAR(15)
);

CREATE TABLE Remesa (
    ID_Remesa INT PRIMARY KEY,
    Monto DECIMAL(10, 2),
    Moneda VARCHAR(3),
    Fecha_Creacion DATETIME,
    Estado VARCHAR(20),
    ID_Merchant INT,
    FOREIGN KEY (ID_Merchant) REFERENCES Merchant(ID_Merchant)
);

CREATE TABLE Remitente (
    ID_Remitente INT PRIMARY KEY,
    Tipo_Documento VARCHAR(10),
    Num_Documento VARCHAR(20),
    Nombre_Remitente VARCHAR(100),
    Email_Remitente VARCHAR(100),
    Tel_Remitente VARCHAR(15),
    UNIQUE KEY (ID_Remitente)
);

CREATE TABLE Beneficiario (
    ID_Beneficiario INT PRIMARY KEY,
    Tipo_Documento VARCHAR(10),
    Num_Documento VARCHAR(20),
    Nombre_Beneficiario VARCHAR(100),
    Email_Beneficiario VARCHAR(100),
    Tel_Beneficiario VARCHAR(15),
    Cta_Bancaria VARCHAR(30),
    UNIQUE KEY (ID_Beneficiario)
);

CREATE TABLE Validacion (
    ID_Validacion INT PRIMARY KEY,
    Resultado VARCHAR(20),
    Fecha_Validacion DATETIME,
    ID_Remitente INT,
    ID_Beneficiario INT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Remitente) REFERENCES Remitente(ID_Remitente),
    FOREIGN KEY (ID_Beneficiario) REFERENCES Beneficiario(ID_Beneficiario),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor_de_Validacion(ID_Proveedor)
);

CREATE TABLE Proveedor_de_Validacion (
    ID_Proveedor INT PRIMARY KEY,
    Nombre_Proveedor VARCHAR(100),
    UNIQUE KEY (ID_Proveedor)
);

