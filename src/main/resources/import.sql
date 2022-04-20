-- Creacion de tienda y producto
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Calle Mainomiedes, 9', '41009', 'Tienda de alimentacion', 'Alimentacion Carmen', 'Sevilla', '647654945','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Calle Francos, 12, 6', '41009', 'Tienda de alimentacion', 'Taste of America', 'Sevilla', '955286486','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Calle Verano, 8', '41009', 'Tienda de alimentacion', 'Alimentacion y Chuches Arco Iris', 'Sevilla', '654654654','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Avenida de la Barzola, 46', '41008', 'Tienda de alimentacion', 'Alimentacion Chari', 'Sevilla', '647654876','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Grupo Macarena Tres Huertas, 9', '41009', 'Tienda de alimentacion', 'Alimentacion Titi', 'Sevilla', '635903624','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Calle Miguel Mañara, 6', '41001', 'Tienda de ultramarinos', 'Tienda Vending Murillo Sevilla', 'Sevilla', '954216095','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Calle San Eloy, 2', '41002', 'Tienda de alimentacion', 'La Alacena de San Eloy', 'Sevilla', '954215580','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Calle Regina, 24', '41003', 'Tienda de alimentacion', 'La Despensa Ecologica', 'Sevilla', '954221593','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Plaza San Marcos, 3', '41004', 'Tienda de ultramarinos', 'El Rincon Sagrado', 'Sevilla', '717167160','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');
INSERT INTO tiendas(calle,codigo_postal,descripcion,nombre,provincia,telefono,imagen,horario) VALUES ('Avenida Jose Laguillo, 27', '41005', 'Tienda de alimentacion', 'Fruteria y alimentacion El Semeruco', 'Sevilla', '671217460','https://fra1.digitaloceanspaces.com/places/uploads/place/image/file/258238/2021-04-05.jpg','Lunes a Viernes de 10:00 a 20:00');

INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Arroz basmati 250 g (2x125g)',1.15,'Brillante','Vasitos de Arroz basmati de Arroz Brillante. Una guarnición sana y rica para disfrutar en un minuto del arroz más aromático.',1,false,'https://es.openfoodfacts.org/images/products/841/018/480/0068/front_es.62.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Arroz redondo tradicional 250 g (2x125g)',1,'Brillante','Los Vasitos de Arroz Redondo de Arroz Brillante es una guarnición sana y rica para disfrutar en sólo un minuto del arroz más tradicional.',1,false,'https://es.openfoodfacts.org/images/products/841/018/401/3086/front_es.59.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Arroz integral con quinoa 250 g (2x125g)',1.55,'Brillante','Vasitos de Arroz Integral con Quinoa de arroz Brillante. Una sabrosa guarnición que se prepara en un minuto. ',1,false,'https://es.openfoodfacts.org/images/products/841/018/402/3931/front_es.45.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Alubia blanca al natural extra 340g',1.6,'Gumendi','Producto producido y elaborado en Navarra. Las Alubias Blancas poseen un alto contenido de vitaminas, minerales y nutrientes necesarios para dar energía al cuerpo.',1,false,'https://es.openfoodfacts.org/images/products/843/701/288/6025/front_es.3.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Brotes de Soja Verde 345g',2.5,'Didi','Habitual en la cocina asiática. es una germinación de la soja verde o judía mungo (Vigna radiata).​',1,false,'https://es.openfoodfacts.org/images/products/842/696/303/3015/front_es.15.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Garbanzos 570g',1.05,'Luengo','Son sanos y sabrosos, están repletos de fibra y de sabor, te resuelven primer plato o una guarnición en un momento… y encima están riquísimos',1,false,'https://es.openfoodfacts.org/images/products/841/050/527/2017/front_es.18.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Lentejas 570g',1.69,'Cidacos','De calidad extra, tradición a la mesa es la oferta de Cidacos.',1,false,'https://es.openfoodfacts.org/images/products/841/031/333/5812/front_es.6.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Lentejas Riojana 425g',4.21,'Litoral','Lentejas Riojana, con selectos embutidos elaborados en Asturias. Un plato típico de la gastronomía Española preparado con 100% ingredientes naturales, sin gluten y sin aditivos.',1,false,'https://es.openfoodfacts.org/images/products/841/300/006/5764/front_es.25.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Cocido andaluz 425g',4.13,'Litoral','Una deliciosa receta casera y sabrosa, fácil de preparar. Un plato típico de la gastronomía Española preparado con 100% ingredientes naturales, sin gluten y sin aditivos. ',1,false,'https://es.openfoodfacts.org/images/products/841/010/006/7452/front_es.3.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Fabada asturiana 435 g',3.2,'Litoral','Disfruta de la auténtica Fabada Asturiana LITORAL, con selectos embutidos elaborados en Asturias.',1,false,'https://es.openfoodfacts.org/images/products/841/300/006/5504/front_es.18.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Albóndigas con salsa de tomate 300g',3.99,'Carretilla','Jugosas albóndigas, acompañadas de una deliciosa salsa de tomate de sabor casero, que gustan a niños y mayores. ¡No querrás otras!',1,false,'https://es.openfoodfacts.org/images/products/841/041/600/6855/front_es.33.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Leche entera 1l',0.88,'Covap','Con un gran aporte nutricional con minerales como el yodo, calcio, fósforo y potasio.',1,false,'https://es.openfoodfacts.org/images/products/841/158/546/5030/front_es.19.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Leche Semi Desnatada 1l',0.92,'Covap','Leche Semidesnatada con vitaminas A, D y E, está pensada para toda la familia y aquellas personas que quieren disfrutar de la leche de toda la vida sin perder el sabor de siempre.',1,false,'https://es.openfoodfacts.org/images/products/841/158/546/5016/front_es.5.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Leche Desnatada 1l',0.93,'Covap','Con la Leche Desnatada ofrecemos una alternativa para aquellas personas que quieran o deban cuidar la ingesta de grasa, sin renunciar a las propiedades de la leche.',1,false,'https://es.openfoodfacts.org/images/products/841/158/546/5023/front_es.6.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Leche sin lactosa entera 1l',1.1,'Covap','Pensada para atender y solucionar las necesidades de los consumidores intolerantes a la lactosa manteniendo todo el sabor y calidad de la leche de siempre.',1,false,'https://es.openfoodfacts.org/images/products/841/158/557/3001/front_es.3.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Leche de almendras 1l',1.99,'Alpro','Perfecta para Tomar Sola, en Recetas o en el Café.',1,false,'https://es.openfoodfacts.org/images/products/841/029/716/1704/front.6.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Bebida de Soja 1l',1.96,'Alpro','Al elegir esta bebida de soja, decides empezar el día de forma saludable, 100% vegetal y lleno de sabor. ',1,false,'https://es.openfoodfacts.org/images/products/841/029/716/1315/front_es.51.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Batido de chocolate 1l',1.55,'Puleva','La botella 1L es el ideal para compartir en familia o con amigos. ',1,false,'https://es.openfoodfacts.org/images/products/841/170/000/2386/front_es.59.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Red Bull Energy Drink 250 ml',1.49,'Red Bull','La única bebida funcional que da alas cuando las necesitas.',1,false,'https://es.openfoodfacts.org/images/products/900/249/020/5973/front_fr.103.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Ultra Monster Energy 500ml',1.5,'Monster Energy','Bebida energética edulcorada con sucralosa y acesulfamo-K y sin calorías',1,false,'https://es.openfoodfacts.org/images/products/506/033/563/5808/front_fr.62.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Monster Energy 500 ml',1.5,'Monster Energy','Abre un lata de Monster Energy, la bebida más energética en el planeta.',1,false,'https://es.openfoodfacts.org/images/products/506/033/563/2302/front_fr.108.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Plumas rayadas integrales  450 g',1.69,'Gallo','Pasta elaborada a partir de sémola integral de trigo duro. ',1,false,'https://es.openfoodfacts.org/images/products/841/006/901/8458/front_es.17.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Cous cous 500 g',1.89,'Gallo','Delicioso cuscús de grano mediano. Es ideal para acompañar con verduras salteadas.',1,false,'https://es.openfoodfacts.org/images/products/841/006/900/0019/front_es.21.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Spaghetti n.5 500 g',1.79,'Barilla','El favorito de todos, el Spaghetti combina bien con cualquier tipo de salsa, con o sin carne o con verduras.',1,false,'https://es.openfoodfacts.org/images/products/807/680/019/5057/front_es.426.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Penne Rigate Integrale  500g',2.06,'Barilla','Por su forma tubular es ideal para servirse con vegetales y en platillos horneados con queso y salsa.',1,false,'https://es.openfoodfacts.org/images/products/807/680/952/9433/front_de.214.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Tomate frito estándar 350g',0.77,'Orlando','Perfecto para la base de sofrito para paella o como base para numerosos platos de pasta, guisos, platos de pescado…',1,false,'https://es.openfoodfacts.org/images/products/841/006/600/0074/front_es.35.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Salsa de mostaza  290g',0.99,'Orlando','Salsa Mostaza en el icónico formato barrilito.',1,false,'https://es.openfoodfacts.org/images/products/841/006/607/1067/front_es.6.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Salsa brava 290g',0.99,'Orlando','Salsa Brava en el icónico formato barrilito.',1,false,'https://es.openfoodfacts.org/images/products/841/006/607/2064/front_es.23.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Ketchup 290g',0.99,'Orlando','Salsa Ketchup en el icónico formato barrilito.',1,false,'https://es.openfoodfacts.org/images/products/841/006/607/0060/front_es.32.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Lasaña boloñesa 300g',1.85,'Maheso','Lasañas con una selección de carnes, especias y salsa de tomate, siguiendo la receta Boloñesa, con pasta fresca “al dente” y cubiertas de bechamel.',1,false,'https://es.openfoodfacts.org/images/products/841/070/500/3121/front_es.12.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Canelones de atún 300g',1.85,'Maheso','Receta de Mamá con atún y una suave salsa de tomate, con pasta fresca recién hecha y cubiertos de una fina bechamel y queso.',1,false,'https://es.openfoodfacts.org/images/products/841/070/500/3206/front_es.3.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Delicias de pollo 300g',2.41,'Maheso','Crujientes trozos de pechuga de pollo marinados y empanados. Ideales para compartir en familia.',1,false,'https://es.openfoodfacts.org/images/products/841/070/503/7058/front_es.10.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Tempura de vegetales 400g',2.8,'Maheso','Sabrosa Tempura de verduras enharinadas para conseguir un crujiente rebozado.',1,false,'https://es.openfoodfacts.org/images/products/841/070/501/4493/front_es.34.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Menestra de verduras imperial 400g',0.99,'Maheso','Vierta el contenido de este envase, sin descongelar, en agua hirviendo sazonada con sal a su gusto.',1,false,'https://es.openfoodfacts.org/images/products/841/070/500/5828/front_es.9.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Tomate frito 415g',0.85,'Martinete','Salsa de tomate sofrita con cebolla, ajo y aceite de girasol al estilo tradicional, conserva el sabor de un auténtico tomate frito casero.',1,false,'https://es.openfoodfacts.org/images/products/841/107/403/6505/front_es.22.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Tomate natural 810g',1.55,'Martinete','Los tomates frescos, recién recolectados en su óptimo de madurez son triturados y tamizados.',1,false,'https://es.openfoodfacts.org/images/products/841/107/401/2509/front_es.19.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Nata para cocinar 500 ml',0.97,'Central Lechera Asturiana','Ideal para conseguir un sabor inigualable y una gran cremosidad en todas tus salsas, cremas o gratinados.',1,false,'https://es.openfoodfacts.org/images/products/841/029/712/0138/front_es.48.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Nata para cocinar sin lactosa 200 ml',0.79,'Central Lechera Asturiana','Está pensada para aquellas personas que son intolerantes a la lactosa o, simplemente, opten por los productos sin lactosa.',1,false,'https://es.openfoodfacts.org/images/products/841/029/712/0244/front_es.13.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Lasaña Boloñesa 530g',4.08,'La cocinera','Se ha convertido en un plato esencial en muchas casas. Perfecta como plato principal para comidas o cenas.',1,false,'https://es.openfoodfacts.org/images/products/841/023/901/7502/front_fr.11.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Lasaña de espinacas y queso fresco 530g',3.89,'La cocinera','Elaborada con pasta fresca al huevo, esta lasaña de espinacas y queso es el resultado de un cuidado proceso de elaboración y selección de los ingredientes.',1,false,'https://es.openfoodfacts.org/images/products/841/023/900/5196/front_es.25.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Menestra de verduras 300g',2.02,'Carretilla','Con las mejores verduras y hortalizas. Una forma deliciosa de comer un plato saludable.',1,false,'https://es.openfoodfacts.org/images/products/841/041/600/3588/front_es.35.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Pimientos del piquillo rellenos de verduras 300G',2.67,'Carretilla','Con un delicioso relleno de verduras, acompañados de una suave salsa de piquillos y nata.',1,false,'https://es.openfoodfacts.org/images/products/841/041/600/1959/front_es.5.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Ensalada de quinoa 230 g',2.09,'Carretilla','Con quinoa, cereal milenario de la gastronomía andina reconocido por sus beneficios nutricionales, y con un ligero toque de chili.',1,false,'https://es.openfoodfacts.org/images/products/841/041/600/8910/front_es.6.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Arroz con pollo al curry 300 g',3.09,'Carretilla','Para un consumidor más sofisticado, que demanda “Sabores del mundo” más originales.',1,false,'https://es.openfoodfacts.org/images/products/841/041/600/8361/front_es.44.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Ensaladilla rusa 230g',1.89,'Carretilla','La tradicional, con patata, atún, aceitunas… y una ligera salsa fina. Para tomar bien fresca.',1,false,'https://es.openfoodfacts.org/images/products/841/041/600/4400/front_es.16.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Oreo Original  154 g',1.08,'Oreo','Galletas de cacao rellenas de una deliciosa crema.',1,false,'https://es.openfoodfacts.org/images/products/762/230/033/6738/front_en.145.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Principe Crema de chocolate 300 g',1.98,'Lu','Estupendo paquete de la original galleta con crema de chocolate intercalado de Principe.',1,false,'https://es.openfoodfacts.org/images/products/762/221/020/4424/front_es.69.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Mikado chocolate con leche 90 g',1.27,'Lu','Palitos De Galleta Chocolate Con Leche',1,false,'https://es.openfoodfacts.org/images/products/301/776/068/6792/front_fr.148.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Digestive avena naranja  425 g',1.59,'Gullón','Las galletas perfectas para darte un capricho entre horas.',1,false,'https://es.openfoodfacts.org/images/products/841/037/604/7578/front_es.29.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Choco Flakes 550 g',2.45,'Cuétara','Enriquecidos con 8 vitaminas. Representan un desayuno ideal para los niños.',1,false,'https://es.openfoodfacts.org/images/products/843/416/548/2845/front_es.25.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Galletas La Buena Maria 800g',2.09,'Fontaneda','Las clásicas galletas María en su formato original, un desayuno saludable y delicioso para toda la familia',1,false,'https://es.openfoodfacts.org/images/products/841/000/082/6937/front_es.22.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Galleta maría sin gluten 400 g (2 x 200 g)',2.48,'Gullón','Galletas sin gluten, elaborada especialmente para celíacos. ',1,false,'https://es.openfoodfacts.org/images/products/841/037/603/6169/front_es.70.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Cookies de cacao con chips de chocolate sin gluten 200g',2.39,'Gullón','Galleta sin gluten con chips de chocolate, elaborado especialmente para celiacos.',1,false,'https://es.openfoodfacts.org/images/products/841/037/601/7342/front_es.56.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Sharkies Chocolate 250 g',2.44,'Gullón','Galletas sin gluten, elaborada especialmente para celiacos.',1,false,'https://es.openfoodfacts.org/images/products/841/037/604/4959/front_es.25.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Noglut jungla 100g',1.67,'Santiveri','Tienen forma de animalitos que encantan a los niños y están preparadas con ingredientes naturalmente sin gluten y sin lactosa.',1,false,'https://es.openfoodfacts.org/images/products/841/217/002/9415/front_es.23.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Calippo sabor fresa 525 ml',4.05,'Frigo','Refrescante helado de hielo con zumo de fresa que hará que te sientas durante todo el año en verano.',1,false,'https://es.openfoodfacts.org/images/products/872/270/023/1974/front_es.7.200.jpg',' ',0,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Cornetto mini classico 216g',3.90,'Frigo','Mini cono de helado de nata, con trocitos de avellana y topping de salsa de chocolate.',1,false,'https://es.openfoodfacts.org/images/products/871/210/050/1074/front_es.3.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Magnum Mini classic 264 g',4.75,'Magnum','Bombón mini de almendras MAGNUM',1,false,'https://es.openfoodfacts.org/images/products/871/410/063/5674/front_es.85.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Zumo de melocoton 1200gr',0.99,'Juver','Sin azúcares añadidos.',1,false,'https://es.openfoodfacts.org/images/products/14107078/front_es.28.200.jpg',' ',2,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Helado de limón 400g',2.99,'Gutbio','Postre congelado eco a base de bebida vegetal y canela',1,false,'https://es.openfoodfacts.org/images/products/24076357/front_es.29.200.jpg',' ',1,1);
INSERT INTO productos(nombre,precio,marca,descripcion,estado,promocionado,imagen,motivo,preferencia,tienda_id) VALUES ('Capricho de almendras 400g',2.99,'Gutbio','Postre congelado eco a base de bebida vegetal y almendras.',1,false,'https://es.openfoodfacts.org/images/products/200/000/004/9803/front_es.9.200.jpg',' ',1,1);

-- One admin user, named admin1 with passwor 4dm1n and authority admin
INSERT INTO users(username,password,enabled) VALUES ('admin1','4dm1n',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (1,'admin1','admin');
-- Un usuario cliente, llamado cliente1 con la contraseña cli1
INSERT INTO users(username,password,enabled) VALUES ('cliente1','cli1',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (4,'cliente1','cliente');
-- Un usuario cliente, llamado cliente2 con la contraseña cli2
INSERT INTO users(username,password,enabled) VALUES ('cliente2','cli2',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (5,'cliente2','cliente');
-- Un usuario vendedor, llamado vendedor1 con la contraseña vend1
INSERT INTO users(username,password,enabled,first_name,last_name,tienda_id) VALUES ('vendedor1','vend1',TRUE,'Pepe','Cano',5);
INSERT INTO authorities(id,username,authority) VALUES (6,'vendedor1','vendedor');
-- Un usuario vendedor, llamado vendedor2 con la contraseña vend2
INSERT INTO users(username,password,enabled,first_name,last_name) VALUES ('vendedor2','vend2',TRUE,'José','Lopez');
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

INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (2,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (3,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (5,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (11,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (11,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (12,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (13,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (14,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (16,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (17,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (18,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (22,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (23,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (23,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (23,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (24,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (24,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (25,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (25,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (27,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (27,5);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (28,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (29,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (30,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (30,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (30,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (31,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (31,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (31,7);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (32,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (32,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (32,7);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (32,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (32,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,7);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (33,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (37,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (39,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (39,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (39,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (40,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (40,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (40,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,8);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,7);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,16);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (41,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (42,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (42,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (43,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (43,8);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (43,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (43,7);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (43,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (43,16);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (43,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (43,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (44,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (44,8);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (44,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (44,7);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (44,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (44,16);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (44,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (44,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (45,12);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (45,8);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (45,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (45,7);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (45,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (45,16);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (45,13);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (45,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (46,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (46,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (46,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (47,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (47,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (47,6);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (47,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (48,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (48,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (48,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (49,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (49,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (49,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (50,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (50,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (50,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (50,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (51,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (51,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (51,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (52,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (53,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (53,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (54,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (55,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (56,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (57,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (57,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (57,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (58,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (58,10);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (58,11);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (59,1);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (59,2);
INSERT INTO producto_intolerancias(producto_id,intolerancias_id) VALUES (61,11);



INSERT INTO reservas(producto_id,tienda_id, cantidad, precio_total,user_username,estado) VALUES (1,1,2,2.00,'cliente1',0);