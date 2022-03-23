-- One admin user, named admin1 with passwor 4dm1n and authority admin
INSERT INTO users(username,password,enabled) VALUES ('admin1','4dm1n',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (1,'admin1','admin');
-- One owner user, named owner1 with passwor 0wn3r
INSERT INTO users(username,password,enabled) VALUES ('owner1','0wn3r',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (2,'owner1','owner');
-- One vet user, named vet1 with passwor v3t
INSERT INTO users(username,password,enabled) VALUES ('vet1','v3t',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (3,'vet1','veterinarian');
-- Un usuario cliente, llamado cliente1 con la contraseña cli1
INSERT INTO users(username,password,enabled) VALUES ('cliente1','cli1',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (4,'cliente1','cliente');
-- Un usuario cliente, llamado cliente2 con la contraseña cli2
INSERT INTO users(username,password,enabled) VALUES ('cliente2','cli2',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (5,'cliente2','cliente');
-- Un usuario vendedor, llamado vendedor1 con la contraseña vend1
INSERT INTO users(username,password,enabled) VALUES ('vendedor1','vend1',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (6,'vendedor1','vendedor');
-- Un usuario vendedor, llamado vendedor2 con la contraseña vend2
INSERT INTO users(username,password,enabled) VALUES ('vendedor2','vend2',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (7,'vendedor2','vendedor');
-- Un usuario nutricionista, llamado nutricionista1 con la contraseña nut1
INSERT INTO users(username,password,enabled) VALUES ('nutricionista1','nut1',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (8,'nutricionista1','nutricionista');


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

-- Creacion de tienda y producto


INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Mainomiedes, 9', '41009', 'Tienda de alimentacion', 'Alimentacion Carmen', 'Sevilla', '647654945');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Francos, 12, 6', '41004', 'Tienda de alimentacion', 'Taste of America', 'Sevilla', '955286486');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Verano, 8', '41009', 'Tienda de alimentacion', 'Alimentacion y Chuches Arco Iris', 'Sevilla', '654654654');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Avenida de la Barzola, 46', '41008', 'Tienda de alimentacion', 'Alimentacion Chari', 'Sevilla', '647654876');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Grupo Macarena Tres Huertas, 9', '41009', 'Tienda de alimentacion', 'Alimentacion Titi', 'Sevilla', '635903624');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Miguel Mañara, 6', '41001', 'Tienda de ultramarinos', 'Tienda Vending Murillo Sevilla', 'Sevilla', '954216095');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle San Eloy, 2', '41002', 'Tienda de alimentacion', 'La Alacena de San Eloy', 'Sevilla', '954215580');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Regina, 24', '41003', 'Tienda de alimentacion', 'La Despensa Ecologica', 'Sevilla', '954221593');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Plaza San Marcos, 3', '41004', 'Tienda de ultramarinos', 'El Rincon Sagrado', 'Sevilla', '717167160');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Avenida Jose Laguillo, 27', '41005', 'Tienda de alimentacion', 'Fruteria y alimentacion El Semeruco', 'Sevilla', '671217460');
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
-- Tienda 6
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Yaourt nature - Le Nature - 500g', 'https://es.openfoodfacts.org/images/products/303/349/000/4521/front_fr.85.400.jpg', 'Danone', 'Yaourt nature - Danone', 3.25, 3, true, 6);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Queso Crema Philadelphia Original - 150 g', 'https://es.openfoodfacts.org/images/products/762/230/044/1937/front_es.109.400.jpg', 'Kraft', 'Queso Crema Philadelphia Original', 1.63, 3, true, 6);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Barilla sauce tomates basilic - 400 g', 'https://es.openfoodfacts.org/images/products/807/680/951/3722/front_fr.153.400.jpg', 'Barilla', 'Barilla sauce tomates basilic', 1.89, 3, true, 6);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Caldo casero de pollo - Gallina Blanca - 1 L', 'https://es.openfoodfacts.org/images/products/841/030/034/9051/front_es.59.400.jpg', 'Gallina Blanca', 'Caldo casero de pollo', 1.32, 3, true, 6);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Pan de molde grande - Bimbo - 368 g', 'https://es.openfoodfacts.org/images/products/841/260/001/2185/front_es.4.400.jpg', 'Bimbo', 'Pan de molde grande', 1.56, 3, true, 6);
-- Tienda 7
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Ristorante Pizza Tonno - Dr. Oetker - 355 g', 'https://es.openfoodfacts.org/images/products/400/172/481/9301/front_de.8.400.jpg', 'Dr. Oetker', 'Ristorante Pizza Tonno', 2.13, 3, true, 7);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Cola Cao El Original - 383 g', 'https://es.openfoodfacts.org/images/products/841/001/447/8733/front_es.59.400.jpg', 'ColaCao', 'ColaCao', 3.34, 3, true, 7);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Diet Nature María sin azúcares - Gullón - 400 g', 'https://es.openfoodfacts.org/images/products/841/037/601/0701/front_es.83.400.jpg', 'Gullon', 'Diet Nature María sin azúcares', 2.60, 3, true, 7);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Crema de chocolate - LU - 300 g', 'https://es.openfoodfacts.org/images/products/762/221/020/4424/front_es.69.400.jpg', 'LU', 'Crema de chocolate', 1.69, 3, true, 7);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Original - Pringles - 165 g', 'https://es.openfoodfacts.org/images/products/505/399/012/7726/front_es.69.400.jpg', 'Pringles', 'Original - Pringles', 1.14, 3, true, 7);
-- Tienda 8
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Gazpacho - Alvalle - 1 L', 'https://es.openfoodfacts.org/images/products/541/018/803/1072/front_fr.132.400.jpg', 'Alvalle', 'Gazpacho', 1.32, 3, true, 8);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Crema de calabaza - Knorr', 'https://es.openfoodfacts.org/images/products/871/716/388/9152/front_es.25.400.jpg', 'Knorr', 'Crema de calabaza', 1.29, 3, true, 8);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Crema de Alicia con calabaza, zanahoria y guisantes - Knorr', 'https://es.openfoodfacts.org/images/products/871/716/388/9091/front_es.18.400.jpg', 'Knorr', 'Crema de Alicia con calabaza, zanahoria y guisantes', 1.37, 3, true, 8);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Fresas - Fresón de Palos - 500 g', 'https://es.openfoodfacts.org/images/products/840/004/803/3503/front_es.41.400.jpg', 'Fresón de Palos', 'Fresas', 1.75, 3, true, 8);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Judías verdes planas - Ybarra - 660 g', 'https://es.openfoodfacts.org/images/products/841/008/652/0057/front_es.10.400.jpg', 'Ybarra', 'Judías verdes planas', 1.45, 3, true, 8);
-- Tienda 9
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Empanados de verduras vegetarianos - My Best Veggie - 200 g', 'https://es.openfoodfacts.org/images/products/20330736/front_de.4.400.jpg', 'My Best Veggie', 'Empanados de verduras vegetarianos', 2.94, 3, true, 9);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Lentejas con verduras - Litoral - 430 g', 'https://es.openfoodfacts.org/images/products/761/303/466/5676/front_es.6.400.jpg', 'Litoral', 'Lentejas con verduras', 2.37, 3, true, 9);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Maiz dulce - Bonduelle - 150 g', 'https://es.openfoodfacts.org/images/products/841/037/511/0228/front_es.39.400.jpg', 'Bonduelle', 'Maiz dulce', 1.29, 3, true, 9);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Tomate triturado - Freshona', 'https://es.openfoodfacts.org/images/products/405/648/916/8683/front_es.3.400.jpg', 'Freshona', 'Tomate triturado', 1.87, 3, true, 9);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Lechuga baby - Lucas - 4ud', 'https://es.openfoodfacts.org/images/products/843/600/618/0002/front_fr.25.400.jpg', 'Lucas', 'Lechuga baby', 1.18, 3, true, 9);
-- Tienda 10
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Yogurt artesanal cremoso con fresas sin gluten - Pastoret - 500 g', 'https://es.openfoodfacts.org/images/products/842/479/010/7046/front_es.23.400.jpg', 'Pastoret', 'Yogur artesanal cremoso con fresas sin gluten', 2.58, 3, true, 10);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Yogurt con frutas - Gutbio - 150 g', 'https://es.openfoodfacts.org/images/products/24069052/front_es.49.400.jpg', 'Gutbio', 'Yogurt con frutas', 1.63, 3, true, 10);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Aguacate - Avoax - 700 g', 'https://es.openfoodfacts.org/images/products/20462062/front_es.10.400.jpg', 'Avoax', 'Aguacate', 1.31, 3, true, 10);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Aceite de coco virgen extra - Nat Sanno - 450 g', 'https://es.openfoodfacts.org/images/products/843/654/219/3474/front_es.26.400.jpg', 'Nat Sanno', 'Aceite de coco virgen extra', 3.05, 3, true, 10);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Mermelada de frambuesas - La Vieja Fabrica', 'https://es.openfoodfacts.org/images/products/841/013/402/3646/front_es.19.400.jpg', 'La Vieja Fabrica', 'Mermelada de frambuesas', 2.69, 3, true, 10);

-- Tienda 1
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (4,1);
-- Tienda 2
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (6,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (6,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (6,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (6,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (7,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (7,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (8,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (8,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (8,5);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (8,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (8,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (8,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (9,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (9,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (10,2);
-- Tienda 3
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (12,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (12,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (12,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (15,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (15,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (15,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (15,6);
-- Tienda 4
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (16,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (16,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (17,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (18,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (18,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (18,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (19,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (19,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (20,1);
-- Tienda 5
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (21,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (21,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (22,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (22,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (22,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (22,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (22,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (24,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (24,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (21,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (24,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (25,2);
-- Tienda 6
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (26,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (27,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (29,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (29,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (29,7);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (29,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (29,8);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (29,16);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (30,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (30,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (30,14);
-- Tienda 7
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (31,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (31,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (31,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (31,7);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (32,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,5);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,14);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (34,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (34,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (34,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (34,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (35,1);
-- Tienda 8
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (37,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (37,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (37,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (37,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (37,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (38,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (38,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (38,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (38,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (38,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (38,12);
-- Tienda 9
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,15);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (44,1);
-- Tienda 10
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (46,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (47,2);

