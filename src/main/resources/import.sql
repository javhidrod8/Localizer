-- One admin user, named admin1 with passwor 4dm1n and authority admin
INSERT INTO users(username,password,enabled) VALUES ('admin1','4dm1n',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (1,'admin1','admin');
-- One owner user, named owner1 with passwor 0wn3r
INSERT INTO users(username,password,enabled) VALUES ('owner1','0wn3r',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (2,'owner1','owner');
-- One vet user, named vet1 with passwor v3t
INSERT INTO users(username,password,enabled) VALUES ('vet1','v3t',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (3,'vet1','veterinarian');

-- Tolerancias
INSERT INTO intolerancias(nombre) VALUES ('GLUTEN');
INSERT INTO intolerancias(nombre) VALUES ('LACTEOS');
INSERT INTO intolerancias(nombre) VALUES ('FRUCTOSA');
INSERT INTO intolerancias(nombre) VALUES ('SACAROSA');
INSERT INTO intolerancias(nombre) VALUES ('SULFITOS');
INSERT INTO intolerancias(nombre) VALUES ('HUEVOS');
INSERT INTO intolerancias(nombre) VALUES ('PESCADO');
INSERT INTO intolerancias(nombre) VALUES ('CRUSTACEO');
INSERT INTO intolerancias(nombre) VALUES ('MIEL');
INSERT INTO intolerancias(nombre) VALUES ('SOJA');
INSERT INTO intolerancias(nombre) VALUES ('CASCARA');
INSERT INTO intolerancias(nombre) VALUES ('APIO');
INSERT INTO intolerancias(nombre) VALUES ('MOSTAZA');
INSERT INTO intolerancias(nombre) VALUES ('SESAMO');
INSERT INTO intolerancias(nombre) VALUES ('ALTRAMUCES');
INSERT INTO intolerancias(nombre) VALUES ('MOLUSCOS');

-- Cracion de tienda y producto

INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('calle', '123', 'decripcion', 'nombre', 'provincia', '123456789');
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('descripcion', 'https://gourmedia.es/wp-content/uploads/2017/01/1613870_1413802075585274_8922380069996054973_n.jpg', 'marca', 'nombre', 2.20, 1, true, 1);
INSERT INTO productos(descripcion,imagen,marca,nombre,preferencia,verificado,tienda_id) VALUES ('pescadito frito nyan nyan','https://gourmedia.es/wp-content/uploads/2017/01/1613870_1413802075585274_8922380069996054973_n.jpg','marina','pescado frito', 2.20 ,1,true,1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('descripcion', 'https://gourmedia.es/wp-content/uploads/2017/01/1613870_1413802075585274_8922380069996054973_n.jpg', 'marca', 'nombre2', 2.20, 1, true, 1);
INSERT INTO productos(descripcion,imagen,marca,nombre,preferencia,verificado,tienda_id) VALUES ('pescadito frito nyan nyan','https://gourmedia.es/wp-content/uploads/2017/01/1613870_1413802075585274_8922380069996054973_n.jpg','marina','pescado frito2', 2.20 ,1,true,1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('descripcion', 'https://gourmedia.es/wp-content/uploads/2017/01/1613870_1413802075585274_8922380069996054973_n.jpg', 'marca', 'nombre3', 2.20, 1, true, 1);
INSERT INTO productos(descripcion,imagen,marca,nombre,preferencia,verificado,tienda_id) VALUES ('pescadito frito nyan nyan','https://gourmedia.es/wp-content/uploads/2017/01/1613870_1413802075585274_8922380069996054973_n.jpg','marina','pescado frito3', 2.20 ,1,true,1);

INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,3);