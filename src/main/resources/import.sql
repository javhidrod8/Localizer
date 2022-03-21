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

-- Creacion de tienda y producto

INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('calle', '123', 'decripcion', 'nombre', 'provincia', '123456789');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Miguel Mañara, 6', '41001', 'Tienda de ultramarinos', 'Tienda Vending Murillo Sevilla', 'Sevilla', '954216095');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle San Eloy, 2', '41002', 'Tienda de alimentacion', 'La Alacena de San Eloy', 'Sevilla', '954215580');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Calle Regina, 24', '41003', 'Tienda de alimentacion', 'La Despensa Ecologica', 'Sevilla', '954221593');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Plaza San Marcos, 3', '41004', 'Tienda de ultramarinos', 'El Rincon Sagrado', 'Sevilla', '717167160');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono) VALUES ('Avenida Jose Laguillo, 27', '41005', 'Tienda de alimentacion', 'Fruteria y alimentacion El Semeruco', 'Sevilla', '671217460');
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Pasta de tipo penne rigate, 500g', 'https://www.barilla.com//-/media/images/es_es/products/groups/ranges/classic-es/_0015_3df_3030030473_1000012623pennerig_500gintl.png', 'Barilla', 'Pasta Penne Rigate, 500g', 1.66, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Zanahoria fresca, 1kg', 'https://static.carrefour.es/hd_510x_/img_pim_food/235422_00_1.jpg', 'Carrefour', 'Zanahoria, 1kg', 0.65, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Brócoli fresco, 500g', 'https://static.carrefour.es/hd_510x_/img_pim_food/078932_00_1.jpg', 'Carrefour', 'Brócoli, 500g', 1.19, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Pasta de semola de trigo duro, Contiene gluten, Forma de espiral, Almacenar en lugar fresco y seco', 'https://m.media-amazon.com/images/I/71yL5t+yI4S._AC_SL1500_.jpg', 'Garofalo', 'Pasta Elicoidale, 500g', 1.79, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Lavazza Café en Grano, Qualità Oro Perfect Symphony, Café Espresso 100% Arábica Redondo y Aromático, Paquete de 1 Kg', 'https://m.media-amazon.com/images/I/61KhzYvBGSL._AC_SL1500_.jpg', 'Lavazza', 'Café en Grano, Qualitá Oro, Café Espresso, 1kg', 14.48, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Garofalo Pasta Penne Ziti Rigate Pasta N.70, 500g', 'https://m.media-amazon.com/images/I/81TTsbyloIL._AC_SL1500_.jpg', 'Garofalo', 'Pasta Penne Ziti Rigate Pasta N.70, 500g', 5.96, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Central Lechera Asturiana Leche Entera, 6 x 1 L', 'https://m.media-amazon.com/images/I/81uq8Z+YGBL._AC_SL1500_.jpg	', 'Central Lechera Asturiana', 'Leche Entera, 6x1 L', 5.96, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Sos Arroz Redondo, 1 Kg', 'https://m.media-amazon.com/images/I/71r5m+wvvcL._AC_SL1500_.jpg', 'SOS', 'Arroz Redondo, 1 Kg', 4.98, 1, true, 1);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Yaourt nature - Le Nature - 500g', 'https://es.openfoodfacts.org/images/products/303/349/000/4521/front_fr.85.400.jpg', 'Danone', 'Yaourt nature - Danone', 3.25, 3, true, 2);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Queso Crema Philadelphia Original - 150 g', 'https://es.openfoodfacts.org/images/products/762/230/044/1937/front_es.109.400.jpg', 'Kraft', 'Queso Crema Philadelphia Original', 1.63, 3, true, 2);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Barilla sauce tomates basilic - 400 g', 'https://es.openfoodfacts.org/images/products/807/680/951/3722/front_fr.153.400.jpg', 'Barilla', 'Barilla sauce tomates basilic', 1.89, 3, true, 2);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Caldo casero de pollo - Gallina Blanca - 1 L', 'https://es.openfoodfacts.org/images/products/841/030/034/9051/front_es.59.400.jpg', 'Gallina Blanca', 'Caldo casero de pollo', 1.32, 3, true, 2);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Pan de molde grande - Bimbo - 368 g', 'https://es.openfoodfacts.org/images/products/841/260/001/2185/front_es.4.400.jpg', 'Bimbo', 'Pan de molde grande', 1.56, 3, true, 2);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Ristorante Pizza Tonno - Dr. Oetker - 355 g', 'https://es.openfoodfacts.org/images/products/400/172/481/9301/front_de.8.400.jpg', 'Dr. Oetker', 'Ristorante Pizza Tonno', 2.13, 3, true, 3);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Cola Cao El Original - 383 g', 'https://es.openfoodfacts.org/images/products/841/001/447/8733/front_es.59.400.jpg', 'ColaCao', 'ColaCao', 3.34, 3, true, 3);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Diet Nature María sin azúcares - Gullón - 400 g', 'https://es.openfoodfacts.org/images/products/841/037/601/0701/front_es.83.400.jpg', 'Gullon', 'Diet Nature María sin azúcares', 2.60, 3, true, 3);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Crema de chocolate - LU - 300 g', 'https://es.openfoodfacts.org/images/products/762/221/020/4424/front_es.69.400.jpg', 'LU', 'Crema de chocolate', 1.69, 3, true, 3);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Original - Pringles - 165 g', 'https://es.openfoodfacts.org/images/products/505/399/012/7726/front_es.69.400.jpg', 'Pringles', 'Original - Pringles', 1.14, 3, true, 3);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Gazpacho - Alvalle - 1 L', 'https://es.openfoodfacts.org/images/products/541/018/803/1072/front_fr.132.400.jpg', 'Alvalle', 'Gazpacho', 1.32, 3, true, 4);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Crema de calabaza - Knorr', 'https://es.openfoodfacts.org/images/products/871/716/388/9152/front_es.25.400.jpg', 'Knorr', 'Crema de calabaza', 1.29, 3, true, 4);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Crema de Alicia con calabaza, zanahoria y guisantes - Knorr', 'https://es.openfoodfacts.org/images/products/871/716/388/9091/front_es.18.400.jpg', 'Knorr', 'Crema de Alicia con calabaza, zanahoria y guisantes', 1.37, 3, true, 4);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Fresas - Fresón de Palos - 500 g', 'https://es.openfoodfacts.org/images/products/840/004/803/3503/front_es.41.400.jpg', 'Fresón de Palos', 'Fresas', 1.75, 3, true, 4);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Judías verdes planas - Ybarra - 660 g', 'https://es.openfoodfacts.org/images/products/841/008/652/0057/front_es.10.400.jpg', 'Ybarra', 'Judías verdes planas', 1.45, 3, true, 4);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Empanados de verduras vegetarianos - My Best Veggie - 200 g', 'https://es.openfoodfacts.org/images/products/20330736/front_de.4.400.jpg', 'My Best Veggie', 'Empanados de verduras vegetarianos', 2.94, 3, true, 5);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Lentejas con verduras - Litoral - 430 g', 'https://es.openfoodfacts.org/images/products/761/303/466/5676/front_es.6.400.jpg', 'Litoral', 'Lentejas con verduras', 2.37, 3, true, 5);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Maiz dulce - Bonduelle - 150 g', 'https://es.openfoodfacts.org/images/products/841/037/511/0228/front_es.39.400.jpg', 'Bonduelle', 'Maiz dulce', 1.29, 3, true, 5);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Tomate triturado - Freshona', 'https://es.openfoodfacts.org/images/products/405/648/916/8683/front_es.3.400.jpg', 'Freshona', 'Tomate triturado', 1.87, 3, true, 5);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Lechuga baby - Lucas - 4ud', 'https://es.openfoodfacts.org/images/products/843/600/618/0002/front_fr.25.400.jpg', 'Lucas', 'Lechuga baby', 1.18, 3, true, 5);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Yogur artesanal cremoso con fresas sin gluten - Pastoret - 500 g', 'https://es.openfoodfacts.org/images/products/842/479/010/7046/front_es.23.400.jpg', 'Pastoret', 'Yogur artesanal cremoso con fresas sin gluten', 2.58, 3, true, 6);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Yogurt con frutas - Gutbio - 150 g', 'https://es.openfoodfacts.org/images/products/24069052/front_es.49.400.jpg', 'Gutbio', 'Yogurt con frutas', 1.63, 3, true, 6);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Aguacate - Avoax - 700 g', 'https://es.openfoodfacts.org/images/products/20462062/front_es.10.400.jpg', 'Avoax', 'Aguacate', 1.31, 3, true, 6);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Aceite de coco virgen extra - Nat Sanno - 450 g', 'https://es.openfoodfacts.org/images/products/843/654/219/3474/front_es.26.400.jpg', 'Nat Sanno', 'Aceite de coco virgen extra', 3.05, 3, true, 6);
INSERT INTO productos(descripcion, imagen, marca, nombre, precio, preferencia, verificado, tienda_id) VALUES ('Mermelada de frambuesas - La Vieja Fabrica', 'https://es.openfoodfacts.org/images/products/841/013/402/3646/front_es.19.400.jpg', 'La Vieja Fabrica', 'Mermelada de frambuesas', 2.69, 3, true, 6);



INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (1,3);