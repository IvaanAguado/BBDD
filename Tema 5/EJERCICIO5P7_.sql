CREATE TABLE fabricantes (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE productos (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio  NUMBER(6,2) NOT NULL,
  id_fabricante NUMBER(3) NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);

INSERT INTO fabricantes VALUES(1, 'Asus');
INSERT INTO fabricantes VALUES(2, 'Lenovo');
INSERT INTO fabricantes VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricantes VALUES(4, 'Samsung');
INSERT INTO fabricantes VALUES(5, 'Seagate');
INSERT INTO fabricantes VALUES(6, 'Crucial');
INSERT INTO fabricantes VALUES(7, 'Gigabyte');
INSERT INTO fabricantes VALUES(8, 'Huawei');
INSERT INTO fabricantes VALUES(9, 'Xiaomi');

INSERT INTO productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-------------------------------------------------------------------------------------------------------------------
--a. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM productos

--b. Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre, precio AS Euros FROM productos;
SELECT nombre, precio AS Dólares FROM productos;

--c. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre),precio FROM productos;

--d. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio FROM productos;

--e. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio) FROM productos;

--f. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNC(precio) FROM productos;

--g. Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT id_fabricante FROM productos;

--h. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT(id_fabricante) FROM productos;

--i. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM productos ORDER BY nombre ASC;

--j. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

--k. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM productos WHERE precio>=400;

--l. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM productos WHERE precio<400;

--m. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT * FROM productos WHERE precio>80 and precio<300;

--n. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT * FROM productos WHERE precio BETWEEN 60 AND 200;

--o. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT * FROM productos WHERE precio>200 AND id_fabricante=6;

--p. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM productos WHERE id IN(1,3,5);

--q. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricantes WHERE nombre LIKE 'S%';

--r. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricantes WHERE nombre LIKE '%e';

--s. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricantes WHERE nombre LIKE '%w%';

-------------------------------------------------------------------------------------------------------------------
--1
SELECT productos.nombre, productos.precio, fabricantes.nombre FROM productos, fabricantes WHERE productos.id_fabricante=fabricantes.id;

--2
SELECT productos.nombre, precio, fabricantes.nombre FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id ORDER BY productos.nombre ASC;

--3
SELECT productos.id, productos.nombre, fabricantes.id FROM productos, fabricantes WHERE productos.id_fabricante=fabricantes.id;

--4
SELECT productos.nombre, productos.precio, fabricantes.nombre FROM productos, fabricantes WHERE productos.id_fabricante = fabricantes.id ORDER BY precio ASC ROWNUM 1;

--5
SELECT productos.nombre, productos.precio, fabricantes.nombre FROM productos, fabricantes WHERE productos.id_fabricante = fabricantes.id ORDER BY precio DESC;

--6
SELECT * FROM productos,fabricantes WHERE productos.id_fabricante = fabricantes.id AND fabricantes.nombre = 'Lenovo';

--7
SELECT * FROM productos,fabricantes WHERE productos.id_fabricante = fabricantes.id AND fabricantes.nombre = 'Crucial' AND precio > 200;

--8
SELECT * FROM productos,fabricantes WHERE productos.id_fabricante = fabricantes.id AND fabricantes.nombre = 'Asus' OR fabricantes.nombre = 'Hewlett-Packard' OR fabricantes.nombre = 'Seagate';

--9
SELECT * FROM productos,fabricantes WHERE productos.id_fabricante = fabricantes.id AND fabricantes.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

--10
SELECT * FROM productos,fabricantes WHERE productos.id_fabricante = fabricantes.id AND fabricantes.nombre LIKE '%e';

--11
SELECT * FROM productos,fabricantes WHERE productos.id_fabricante = fabricantes.id AND fabricantes.nombre LIKE '%w%';

Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por
el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
--12
SELECT productos.nombre,productos.precio,fabricantes.nombre FROM fabricantes,productos WHERE productos.id_fabricante = fabricantes.id 
AND productos.precio>=180 ORDER BY productos.precio DESC,productos.nombre ASC;

-------------------------------------------------------------------------------------------------------------------
--A
SELECT fabricantes.nombre AS Fabricante, productos.nombre AS Producto
FROM fabricantes
LEFT JOIN productos ON fabricantes.id = productos.id_fabricante;

--B
SELECT fabricantes.nombre AS Fabricante
FROM fabricantes
LEFT JOIN productos ON fabricantes.id = productos.id_fabricante
WHERE productos.id_fabricante IS NULL;

--C
Sí, pueden existir productos que no estén relacionados con un fabricante. 
Si la columna id_fabricante en la tabla productos permite valores NULL, 
entonces es posible tener productos que no estén asociados con un fabricante. 
-------------------------------------------------------------------------------------------------------------------
--Consultas resumen
--1) Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(nombre) FROM productos;

--2) Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT id_fabricante) FROM productos;

--3) Calcula la media del precio de todos los productos.
SELECT AVG(precio) FROM productos;

--4) Calcula el precio más barato de todos los productos.
SELECT MIN(precio) FROM productos;

--5) Lista el nombre y el precio del producto más caro.
SELECT MAX(precio) FROM productos;

--6) Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM productos;

--7) Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id AND fabricantes.nombre='Asus';

--8) Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id AND fabricantes.nombre='Asus';

--9) Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id AND fabricantes.nombre='Asus';

--10) Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(precio) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id AND fabricantes.nombre='Asus';

--11) Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id AND fabricantes.nombre='Asus';

--12) Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(*) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id AND fabricantes.nombre='Crucial';

--13) Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos
--columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT fabricantes.nombre, COUNT(*) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id GROUP BY fabricantes.nombre ORDER BY COUNT(*) DESC;

--14) Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT MAX(precio), MIN(precio), AVG(precio) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id GROUP BY fabricantes.nombre;

--15) Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre
--del fabricante, con el identificador del fabricante es suficiente.
SELECT MAX(precio), MIN(precio), AVG(precio) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id GROUP BY fabricantes.nombre HAVING AVG(precio) > 200;

--16) Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior
--a 200€. Es necesario mostrar el nombre del fabricante.
SELECT MAX(precio), MIN(precio), AVG(precio), fabricantes.nombre FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id GROUP BY fabricantes.nombre HAVING AVG(precio) > 200;

--17) Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(*) FROM productos WHERE precio>=180;

--18) Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT fabricantes.nombre, COUNT(*) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id AND precio >= 180 GROUP BY fabricantes.nombre;

--19) Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT id_fabricante, AVG(precio) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id GROUP BY id_fabricante;

--20) Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT fabricantes.nombre, AVG(precio) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id GROUP BY fabricantes.nombre;

--21) Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT AVG(precio), fabricantes.nombre FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id GROUP BY fabricantes.nombre HAVING AVG(precio) >= 150;

--22) Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricantes.nombre, COUNT(*) FROM productos,fabricantes WHERE productos.id_fabricante=fabricantes.id GROUP BY fabricantes.nombre HAVING COUNT(*) >= 2;


-------------------------------------------------------------------------------------------------------------------
--Subconsultas (En la cláusula WHERE)
--Con operadores básicos de comparación
--1
SELECT * FROM productos WHERE productos.id_fabricante = (SELECT id FROM fabricantes WHERE nombre ='Lenovo');

--2
SELECT MAX(precio) FROM productos WHERE productos.precio = (SELECT MAX(productos.precio) FROM productos WHERE productos.id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Lenovo'));

--3
SELECT productos.nombre FROM productos WHERE productos.precio = (SELECT MAX(productos.precio) FROM productos WHERE productos.id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Lenovo')) 
AND id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Lenovo');

--4
SELECT productos.nombre FROM productos WHERE productos.precio = (SELECT MIN(productos.precio) FROM productos WHERE productos.id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Hewlett-Packard')) 
AND id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Hewlett-Packard');

--5
SELECT productos.nombre FROM productos WHERE productos.precio >= (SELECT MAX(productos.precio) FROM productos WHERE productos.id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Lenovo'));

--6
SELECT * FROM productos WHERE productos.precio > (SELECT AVG(productos.precio) FROM productos WHERE productos.id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Asus'))
AND id_fabricante = (SELECT id FROM fabricantes WHERE nombre='Asus');

-------------------------------------------------------------------------------------------------------------------
--Subconsultas con ALL y ANY
--7
SELECT * FROM productos WHERE productos.precio >=ALL (SELECT precio FROM productos);

--8
SELECT * FROM productos WHERE productos.precio <=ALL (SELECT precio FROM productos);

--9
SELECT * FROM fabricantes WHERE id = ANY (SELECT id_fabricante FROM productos);

--10
SELECT * FROM fabricantes WHERE id <>ALL (SELECT id_fabricante FROM productos);

-------------------------------------------------------------------------------------------------------------------
--Subconsultas con IN y NOT IN
--11
SELECT fabricantes.nombre FROM fabricantes WHERE id IN (SELECT productos.id_fabricante FROM productos);

--12
SELECT fabricantes.nombre FROM fabricantes WHERE id NOT IN (SELECT productos.id_fabricante FROM productos);

-------------------------------------------------------------------------------------------------------------------
--Subconsultas con EXISTS y NOT EXISTS
--13
SELECT fabricantes.nombre FROM fabricantes WHERE EXISTS (SELECT id_fabricante FROM productos);

--14
SELECT fabricantes.nombre FROM fabricantes WHERE NOT EXISTS (SELECT * FROM productos WHERE productos.id_fabricante = fabricantes.id);

-------------------------------------------------------------------------------------------------------------------
--Subconsultas correlacionadas
--15
SELECT fabricantes.nombre, productos.nombre, productos.precio FROM productos,fabricantes WHERE fabricantes.id=productos.id_fabricante AND productos.precio = (SELECT MAX(productos.precio) FROM productos WHERE productos.id_fabricante=fabricantes.id);

--16
SELECT * FROM productos P WHERE P.precio >= (SELECT AVG(precio) FROM productos P2 WHERE P.id_fabricante=P2.id_fabricante);

--17
SELECT productos.nombre FROM productos WHERE productos.precio = (SELECT MAX(precio) FROM productos P2,fabricantes WHERE P2.id_fabricante=fabricantes.id AND fabricantes.nombre='Lenovo');

-------------------------------------------------------------------------------------------------------------------
--Subconsultas (En la cláusula HAVING)
--18
SELECT fabricantes.nombre, COUNT(productos.id_fabricante)
FROM fabricantes,productos
WHERE productos.id_fabricante=fabricantes.id 
GROUP BY fabricantes.nombre 
HAVING COUNT(productos.id_fabricante) = (SELECT COUNT(productos.id_fabricante) FROM fabricantes, productos WHERE fabricantes.id=productos.id_fabricante AND fabricantes.nombre='Lenovo');
