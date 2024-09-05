Branch - Definciones: 
Contiene el ERR de remesas para B89 en formato .png & SQL Text file 
Contiene 6 archivos DDL de las tablas Merchant, Remesa, Remitente, Validación, Porveedor de validación y Beneficiario para la creación y relación entre las mismas (ERR).
Branch - operaciones: 
Contiene un SP que permite recibir información de la remesa y que se guarde en cada tabla. 
contiene las vistas para consultar la cantidad de remesas por merchant que no puedieron ser procesadas el ultimo mes y otra que muestre la información de los 10 clientes que recibieron más remesas el último mes. 

Preguntas Conceptuales
¿qué gráficos y filtros usarías para presentarlos de manera amigable pero entendible? 

Respuesta: 

El gráfico ideal para presentar la cantidad de remesas no procesadas sería un gráfico de barras horizontal, ya que este gráfico nos facilitará la comparación directa entro los diferentes merchants. 
En materia de filtros, podríamos aplicar los siguientes: rango de fecha, estado de remesa y ID_Merchant.
Por otro lado, para representar a los 10 beneficiarios con la mayor cantidad de remesas recibidas, un grafico de barras vertical sería lo óptimo adjudicando el eje x al nombre del beneficiario y al eje y la cantidad de remesa. 
Los filtros convenientes serían: rango de fecha, Tipo_Documento y Moneda.
