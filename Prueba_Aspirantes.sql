CREATE DATABASE VENTAS;
USE VENTAS;				/*Ejecutar al INICIO despues de conectar el servidor*/
SELECT * FROM Articulo; 
SELECT * FROM Unidad_Venta;
SELECT * FROM Venta;
SELECT * FROM Usuario;

SELECT SUM(articulo.COSTO * venta.CANTIDAD) AS TOTAL_Ventas		/*Monto Total vendido de la tabla Venta*/
FROM Venta venta										
JOIN Articulo articulo ON venta.ID_Articulo = articulo.ID_ARTICULO;	

SELECT usuario.NOMBRE, usuario.APELLIDO, SUM(articulo.COSTO * venta.CANTIDAD)  AS TOTAL_Ventas		
FROM Venta venta
JOIN Articulo articulo ON venta.ID_ARTICULO = articulo.ID_ARTICULO
JOIN Usuario usuario ON venta.Usuario_Venta = usuario.ID_USUARIO
WHERE MONTH(venta.FECHA_VENTA) = 9 AND YEAR(venta.FECHA_VENTA) = 2024	/*Nombre y Apellido del Usuario que ingreso más dinero en el mes de Septiembre*/
GROUP BY usuario.ID_USUARIO, usuario.NOMBRE, usuario.APELLIDO
ORDER BY TOTAL_Ventas DESC
LIMIT 1;

SELECT articulo.DESCRIPCION, unidad_venta.DESCRIPCION AS UNIDAD_VENTA, SUM(venta.CANTIDAD) AS TOTAL_Vendido		
FROM Venta venta
JOIN Articulo articulo ON venta.ID_ARTICULO = articulo.ID_ARTICULO
JOIN UNIDAD_VENTA unidad_venta ON articulo.UNIDAD_VENTA = unidad_venta.ID_UNIDAD_VENTA
WHERE MONTH(venta.FECHA_VENTA) = 9 AND YEAR(venta.FECHA_VENTA) = 2024		/*Producto que se vendió más en Septiembre con su unidad de venta*/
GROUP BY articulo.ID_ARTICULO, articulo.DESCRIPCION, unidad_venta.DESCRIPCION
ORDER BY TOTAL_Vendido DESC
LIMIT 1;

