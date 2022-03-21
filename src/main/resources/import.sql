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

INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Mainomiedes, 9', '41009', 'Tienda de alimentacion', 'Alimentacion Carmen', 'Sevilla', '647654945');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Francos, 12, 6', '41004', 'Tienda de alimentacion', 'Taste of America', 'Sevilla', '955286486');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Verano, 8', '41009', 'Tienda de alimentacion', 'Alimentacion y Chuches Arco Iris', 'Sevilla', '654654654');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Avenida de la Barzola, 46', '41008', 'Tienda de alimentacion', 'Alimentacion Chari', 'Sevilla', '647654876');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Grupo Macarena Tres Huertas, 9', '41009', 'Tienda de alimentacion', 'Alimentacion Titi', 'Sevilla', '635903624');

-- Tienda 1
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Pasta de tipo penne rigate, 500g', 'https://www.barilla.com//-/media/images/es_es/products/groups/ranges/classic-es/_0015_3df_3030030473_1000012623pennerig_500gintl.png', 'Barilla', 'Pasta Penne Rigate, 500g', 1.66, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Zanahoria fresca, 1kg', 'https://static.carrefour.es/hd_510x_/img_pim_food/235422_00_1.jpg', 'Carrefour', 'Zanahoria, 1kg', 0.65, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Brócoli fresco, 500g', 'https://static.carrefour.es/hd_510x_/img_pim_food/078932_00_1.jpg', 'Carrefour', 'Brócoli, 500g', 1.19, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Pasta de semola de trigo duro, Contiene gluten, Forma de espiral, Almacenar en lugar fresco y seco', 'https://m.media-amazon.com/images/I/71yL5t+yI4S._AC_SL1500_.jpg', 'Garofalo', 'Pasta Elicoidale, 500g', 1.79, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Lavazza Café en Grano, Qualità Oro Perfect Symphony, Café Espresso 100% Arábica Redondo y Aromático, Paquete de 1 Kg', 'https://m.media-amazon.com/images/I/61KhzYvBGSL._AC_SL1500_.jpg', 'Lavazza', 'Café en Grano, Qualitá Oro, Café Espresso, 1kg', 14.48, 1, true, 1);
-- Tienda 2
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Kinder Bueno, 43g', 'https://es.openfoodfacts.org/images/products/800/050/003/7560/front_es.199.400.jpg', 'Kinder', 'Kinder Bueno', 1.5, 3, true, 2);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Digestive Muesli, 365g', 'https://es.openfoodfacts.org/images/products/841/037/602/6979/front_es.79.400.jpg', 'Gullon', 'Digestive Muesli', 1.25, 3, true, 2);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Choco Flakes, 550g', 'https://es.openfoodfacts.org/images/products/843/416/548/2845/front_es.25.400.jpg', 'Cuetara', 'Choco Flakes', 2.5, 3, true, 2);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Garofalo Pasta Penne Ziti Rigate Pasta N.70, 500g', 'https://m.media-amazon.com/images/I/81TTsbyloIL._AC_SL1500_.jpg', 'Garofalo', 'Pasta Penne Ziti Rigate Pasta N.70, 500g', 5.96, 1, true, 2);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Central Lechera Asturiana Leche Entera, 6 x 1 L', 'https://m.media-amazon.com/images/I/81uq8Z+YGBL._AC_SL1500_.jpg	', 'Central Lechera Asturiana', 'Leche Entera, 6x1 L', 5.96, 1, true, 2);
-- Tienda 3
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Sos Arroz Redondo, 1 Kg', 'https://m.media-amazon.com/images/I/71r5m+wvvcL._AC_SL1500_.jpg', 'SOS', 'Arroz Redondo, 1 Kg', 4.98, 1, true, 3);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Crunchy, 100g', 'https://es.openfoodfacts.org/images/products/841/007/680/1180/front_es.15.400.jpg', 'Nature Valley', 'Crunchy',3.78, 3, true, 3);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Fabada, 435g', 'https://es.openfoodfacts.org/images/products/841/007/680/1180/front_es.15.400.jpg', 'Litoral', 'Fabada', 1.99, 3, true, 3);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Jamon cocido, 115g', 'https://es.openfoodfacts.org/images/products/848/000/039/0325/front_es.19.400.jpg', 'Campofrio', 'Jamon cocido', 3.48, 3, true, 3);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Filipinos chocolate blanco, 135g', 'https://es.openfoodfacts.org/images/products/848/000/039/0325/front_es.19.400.jpg', 'Artiach', 'Filipinos chocolate blanco', 1.75, 3, true, 3);
-- Tienda 4
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Spaghetti, 500g', 'https://es.openfoodfacts.org/images/products/20003463/front_en.98.400.jpg', 'Combino', 'Spaghetti', 4.50, 2, true, 4);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Bifrutas Tropical, 300ml', 'https://es.openfoodfacts.org/images/products/20003463/front_en.98.400.jpg', 'Pascual', 'Bifrutas Tropical',3.23, 1, true, 4);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Ligeresa, 225ml', 'https://es.openfoodfacts.org/images/products/20003463/front_en.98.400.jpg', 'Ligeresa', 'Mayonesa', 2.76, 1, true, 4);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Helado con vainilla de Madagascar recubierto de chocolate con leche, 264g', 'https://es.openfoodfacts.org/images/products/871/410/063/5674/front_es.85.400.jpg', 'Magnum', 'Helados Mini Classic', 5.50, 3, true, 4);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Cerveza sin alcohol, 250ml', 'https://es.openfoodfacts.org/images/products/871/200/005/0023/front_fr.31.400.jpg', 'Heineken', 'Cerveza sin alcohol', 0.87, 3, true, 4);
-- Tienda 5
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Margarina con sal, 500g', 'https://es.openfoodfacts.org/images/products/871/920/003/9353/front_es.27.400.jpg', 'Tulipan', 'Margarina con sal', 3.23, 1, true, 5);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Mini Campurrianas', 'https://es.openfoodfacts.org/images/products/871/920/003/9353/front_es.27.400.jpg', 'Cuetara', 'Mini Campurrianas',2.76, 3, true, 5);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Aquarius Naranja', 'https://es.openfoodfacts.org/images/products/544/900/013/3847/front_es.110.400.jpg', 'Aquarius', 'Aquarius Naranja', 0.89, 3, true, 5);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Hamburguesa Vegetariana, 200g', 'https://es.openfoodfacts.org/images/products/544/900/013/3847/front_es.110.400.jpg', 'Vemondo', 'Hamburguesa Vegana', 5.25, 2, true, 5);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Bifidus natural edulcorado sin gluten, 500g', 'https://es.openfoodfacts.org/images/products/841/050/001/2120/front_es.12.400.jpg', 'Danone', 'Bifidus', 1.34, 3, true, 5);

INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,3);