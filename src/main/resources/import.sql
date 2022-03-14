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
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Pasta de tipo penne rigate, 500g', 'https://www.barilla.com//-/media/images/es_es/products/groups/ranges/classic-es/_0015_3df_3030030473_1000012623pennerig_500gintl.png', 'Barilla', 'Pasta Penne Rigate', 1.66, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Zanahoria fresca, 1kg', 'https://static.carrefour.es/hd_510x_/img_pim_food/235422_00_1.jpg', 'Carrefour', 'Zanahoria', 0.65, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Brócoli fresco, 500g', 'https://static.carrefour.es/hd_510x_/img_pim_food/078932_00_1.jpg', 'Carrefour', 'Brócoli', 1.19, 1, true, 1);

INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,3);