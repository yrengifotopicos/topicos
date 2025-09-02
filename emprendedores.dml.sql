  -- ========================================
  -- INSERTS PARA TABLAS ESTÁTICAS DEL MODELO
  -- ========================================

  -- TIPOS DE IDENTIFICACIÓN
  INSERT INTO tipo_identificacion (tipo_identificacion, codigo, descripcion) VALUES 
  ('CEDULA', 'CC', 'Cédula de ciudadanía'),
  ('TARJETA_IDENTIDAD', 'TI', 'Tarjeta de identidad'),
  ('CEDULA_EXTRANJERÍA', 'CE', 'Cédula de extranjería'),
  ('PASAPORTE', 'PA', 'Pasaporte'),
  ('NIT', 'NI', 'Número de identificación tributaria');

  -- TIPOS DE PERSONA
  INSERT INTO tipo_persona (tipo_persona, codigo, descripcion) VALUES 
  ('NATURAL', 'PN', 'Persona natural'),
  ('JURÍDICA', 'PJ', 'Persona jurídica');

  -- ROLES
  INSERT INTO rol (rol, codigo, descripcion) VALUES 
  ('ADMIN', 'ADM', 'Administrador del sistema'),
  ('CLIENTE', 'CLI', 'Cliente que realiza pedidos'),
  ('EMPRENDEDOR', 'EMP', 'Usuario que publica productos'),
  ('REPARTIDOR', 'REP', 'Usuario que entrega pedidos');

  -- ESTADOS
  INSERT INTO estado (estado, codigo, descripcion) VALUES 
  ('ACTIVO', 'AC', 'Registro activo'),
  ('INACTIVO', 'IN', 'Registro inactivo'),
  ('ELIMINADO', 'EL', 'Registro eliminado'),
  ('EN_PROCESO', 'EP', 'Proceso en curso'),
  ('FINALIZADO', 'FI', 'Proceso finalizado');

  -- MÉTODOS DE PAGO
  INSERT INTO metodo_pago (nombre_metodo, codigo, detalles) VALUES 
  ('EFECTIVO', 'EF', 'Pago en efectivo al recibir'),
  ('TRANSFERENCIA', 'TR', 'Transferencia bancaria'),
  ('TARJETA_CREDITO', 'TC', 'Pago con tarjeta de crédito'),
  ('TARJETA_DEBITO', 'TD', 'Pago con tarjeta de débito'),
  ('PSE', 'PS', 'Pago por PSE');

  -- CATEGORÍAS DE PRODUCTO
  INSERT INTO categoria_producto (nombre, descripcion) VALUES 
  ('Alimentos', 'Comidas y bebidas'),
  ('Ropa', 'Vestimenta y accesorios'),
  ('Tecnología', 'Electrónica y gadgets'),
  ('Hogar', 'Productos para el hogar'),
  ('Libros', 'Libros y revistas');

  -- ========================================
  -- INSERTS PARA PERSONAS (50 registros)
  -- ========================================
  INSERT INTO persona (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_tipo_identificacion, numero_identificacion, telefono, celular, direccion, correo_electronico, tipo_persona, fecha_nacimiento, genero, usuario_creacion, fecha_creacion) VALUES 
  ('María', 'Elena', 'García', 'López', 1, '1234567890', '3201234567', '3201234567', 'Calle 12 #34-56', 'maria.garcia@email.com', 1, '1985-03-15', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Juan', 'Carlos', 'Rodríguez', 'Martínez', 1, '9876543210', '3109876543', '3109876543', 'Carrera 8 #23-45', 'juan.rodriguez@email.com', 1, '1990-07-22', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Ana', 'Sofía', 'López', 'Hernández', 1, '5555666677', '3155556666', '3155556666', 'Avenida 15 #67-89', 'ana.lopez@email.com', 1, '1988-11-08', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Carlos', 'Andrés', 'Martínez', 'González', 1, '1111222233', '3021112222', '3021112222', 'Calle 5 #12-34', 'carlos.martinez@email.com', 1, '1992-01-30', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Laura', 'Patricia', 'Sánchez', 'Ramírez', 1, '4444555566', '3174445555', '3174445555', 'Carrera 20 #45-67', 'laura.sanchez@email.com', 1, '1987-06-14', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Diego', 'Alejandro', 'Pérez', 'Torres', 1, '7777888899', '3187778888', '3187778888', 'Calle 30 #78-90', 'diego.perez@email.com', 1, '1991-09-25', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Claudia', 'Marcela', 'Jiménez', 'Vargas', 1, '2222333344', '3052223333', '3052223333', 'Avenida 10 #34-56', 'claudia.jimenez@email.com', 1, '1989-04-18', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Andrés', 'Felipe', 'Morales', 'Castro', 1, '8888999900', '3148889999', '3148889999', 'Carrera 12 #56-78', 'andres.morales@email.com', 1, '1986-12-03', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Natalia', 'Fernanda', 'Ruiz', 'Mendoza', 1, '3333444455', '3193334444', '3193334444', 'Calle 25 #67-89', 'natalia.ruiz@email.com', 1, '1993-05-27', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Ricardo', 'Javier', 'Herrera', 'Silva', 1, '6666777788', '3016667777', '3016667777', 'Avenida 18 #90-12', 'ricardo.herrera@email.com', 1, '1984-10-12', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Patricia', 'Isabel', 'Vásquez', 'Ortiz', 1, '5432167890', '3215432167', '3215432167', 'Calle 40 #12-34', 'patricia.vasquez@email.com', 1, '1990-02-08', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Miguel', 'Ángel', 'Ramírez', 'Gómez', 1, '9876512345', '3109876512', '3109876512', 'Carrera 6 #45-67', 'miguel.ramirez@email.com', 1, '1988-08-19', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Valentina', 'Andrea', 'Torres', 'Moreno', 1, '1357924680', '3181357924', '3181357924', 'Avenida 22 #78-90', 'valentina.torres@email.com', 1, '1995-01-15', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Sebastián', 'David', 'Castro', 'Restrepo', 1, '2468135790', '3172468135', '3172468135', 'Calle 35 #23-45', 'sebastian.castro@email.com', 1, '1987-11-30', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Isabella', 'María', 'Gómez', 'Vargas', 1, '9753186420', '3069753186', '3069753186', 'Carrera 14 #56-78', 'isabella.gomez@email.com', 1, '1992-07-04', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Fernando', 'Luis', 'Mendoza', 'Aguilar', 1, '8642097531', '3158642097', '3158642097', 'Avenida 28 #89-01', 'fernando.mendoza@email.com', 1, '1985-04-22', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Camila', 'Alejandra', 'Silva', 'Rojas', 1, '7531864209', '3207531864', '3207531864', 'Calle 18 #34-56', 'camila.silva@email.com', 1, '1994-09-11', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Javier', 'Alberto', 'Rojas', 'Delgado', 1, '4208653197', '3054208653', '3054208653', 'Carrera 26 #67-89', 'javier.rojas@email.com', 1, '1989-12-28', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Alejandra', 'Cristina', 'Delgado', 'Páramo', 1, '3197420865', '3143197420', '3143197420', 'Avenida 32 #90-12', 'alejandra.delgado@email.com', 1, '1991-03-17', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Nicolás', 'Eduardo', 'Páramo', 'Quintero', 1, '8653197420', '3048653197', '3048653197', 'Calle 44 #23-45', 'nicolas.paramo@email.com', 1, '1986-06-05', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Gabriela', 'Esperanza', 'Quintero', 'Becerra', 1, '6428531907', '3196428531', '3196428531', 'Carrera 38 #56-78', 'gabriela.quintero@email.com', 1, '1993-10-23', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Esteban', 'Mauricio', 'Becerra', 'León', 1, '1907642853', '3171907642', '3171907642', 'Avenida 42 #78-90', 'esteban.becerra@email.com', 1, '1988-01-09', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Victoria', 'Amparo', 'León', 'Medina', 1, '5319074286', '3185319074', '3185319074', 'Calle 26 #89-01', 'victoria.leon@email.com', 1, '1990-05-31', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Mateo', 'Santiago', 'Medina', 'Parra', 1, '7428531906', '3057428531', '3057428531', 'Carrera 50 #12-34', 'mateo.medina@email.com', 1, '1987-08-16', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Sofía', 'Valeria', 'Parra', 'Osorio', 1, '9074285319', '3149074285', '3149074285', 'Avenida 36 #45-67', 'sofia.parra@email.com', 1, '1995-12-02', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Leonardo', 'Arturo', 'Osorio', 'Suárez', 1, '4285319074', '3204285319', '3204285319', 'Calle 52 #67-89', 'leonardo.osorio@email.com', 1, '1984-03-25', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Mariana', 'Lucía', 'Suárez', 'Arias', 1, '8531907428', '3068531907', '3068531907', 'Carrera 46 #90-12', 'mariana.suarez@email.com', 1, '1992-11-14', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Tomás', 'Emilio', 'Arias', 'Franco', 1, '3190742853', '3153190742', '3153190742', 'Avenida 48 #23-45', 'tomas.arias@email.com', 1, '1989-04-07', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Daniela', 'Carolina', 'Franco', 'Vega', 1, '0742853190', '3170742853', '3170742853', 'Calle 54 #56-78', 'daniela.franco@email.com', 1, '1991-09-20', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Samuel', 'Ignacio', 'Vega', 'Morales', 1, '2853190742', '3182853190', '3182853190', 'Carrera 58 #78-90', 'samuel.vega@email.com', 1, '1986-02-13', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Carolina', 'Beatriz', 'Morales', 'Leal', 1, '5319074281', '3075319074', '3075319074', 'Avenida 60 #89-01', 'carolina.morales@email.com', 1, '1994-07-29', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Álvaro', 'Gonzalo', 'Leal', 'Cortés', 1, '9074285312', '3149074285', '3149074285', 'Calle 62 #01-23', 'alvaro.leal@email.com', 1, '1988-12-16', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Paola', 'Viviana', 'Cortés', 'Ramos', 1, '4285319073', '3204285319', '3204285319', 'Carrera 64 #34-56', 'paola.cortes@email.com', 1, '1990-06-01', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Rodrigo', 'Enrique', 'Ramos', 'Peña', 1, '8531907421', '3068531907', '3068531907', 'Avenida 66 #67-89', 'rodrigo.ramos@email.com', 1, '1985-10-18', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Adriana', 'Mercedes', 'Peña', 'Cabrera', 1, '3190742854', '3153190742', '3153190742', 'Calle 68 #90-12', 'adriana.pena@email.com', 1, '1993-03-06', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Raúl', 'Humberto', 'Cabrera', 'Flores', 1, '0742853191', '3170742853', '3170742853', 'Carrera 70 #23-45', 'raul.cabrera@email.com', 1, '1987-08-23', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Mónica', 'Stella', 'Flores', 'Maldonado', 1, '2853190743', '3182853190', '3182853190', 'Avenida 72 #56-78', 'monica.flores@email.com', 1, '1991-01-10', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Iván', 'Guillermo', 'Maldonado', 'Gutiérrez', 1, '5319074282', '3075319074', '3075319074', 'Calle 74 #78-90', 'ivan.maldonado@email.com', 1, '1989-05-27', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Lucía', 'Esperanza', 'Gutiérrez', 'Pachón', 1, '9074285313', '3149074285', '3149074285', 'Carrera 76 #89-01', 'lucia.gutierrez@email.com', 1, '1992-09-14', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Óscar', 'Reinaldo', 'Pachón', 'Espinosa', 1, '4285319075', '3204285319', '3204285319', 'Avenida 78 #01-23', 'oscar.pachon@email.com', 1, '1986-12-31', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Lina', 'Alexandra', 'Espinosa', 'Varón', 1, '8531907422', '3068531907', '3068531907', 'Calle 80 #34-56', 'lina.espinosa@email.com', 1, '1994-04-19', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Fabián', 'Orlando', 'Varón', 'Molina', 1, '3190742855', '3153190742', '3153190742', 'Carrera 82 #67-89', 'fabian.varon@email.com', 1, '1988-07-06', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Sandra', 'Milena', 'Molina', 'Cardona', 1, '0742853192', '3170742853', '3170742853', 'Avenida 84 #90-12', 'sandra.molina@email.com', 1, '1990-11-22', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Germán', 'Aurelio', 'Cardona', 'Navas', 1, '2853190744', '3182853190', '3182853190', 'Calle 86 #23-45', 'german.cardona@email.com', 1, '1987-02-15', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Yenny', 'Rocío', 'Navas', 'Bernal', 1, '5319074283', '3075319074', '3075319074', 'Carrera 88 #56-78', 'yenny.navas@email.com', 1, '1995-06-03', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Héctor', 'Jaime', 'Bernal', 'Acosta', 1, '9074285314', '3149074285', '3149074285', 'Avenida 90 #78-90', 'hector.bernal@email.com', 1, '1984-09-28', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Liliana', 'Ruth', 'Acosta', 'Salazar', 1, '4285319077', '3204285319', '3204285319', 'Calle 92 #89-01', 'liliana.acosta@email.com', 1, '1993-01-24', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Édgar', 'Augusto', 'Salazar', 'Prieto', 1, '8531907423', '3068531907', '3068531907', 'Carrera 94 #01-23', 'edgar.salazar@email.com', 1, '1991-05-11', 'MASCULINO', 'admin', CURRENT_TIMESTAMP),
  ('Gloria', 'Elena', 'Prieto', 'Guerrero', 1, '3190742856', '3153190742', '3153190742', 'Avenida 96 #34-56', 'gloria.prieto@email.com', 1, '1989-10-08', 'FEMENINO', 'admin', CURRENT_TIMESTAMP),
  ('Wilson', 'Alberto', 'Guerrero', 'Santamaría', 1, '0742853193', '3170742853', '3170742853', 'Calle 98 #67-89', 'wilson.guerrero@email.com', 1, '1986-03-26', 'MASCULINO', 'admin', CURRENT_TIMESTAMP);

  -- ========================================
  -- INSERTS PARA USUARIOS (30 registros)
  -- ========================================
  INSERT INTO usuario (id_persona, nombre_usuario, contrasena_hash, estado, usuario_creacion, fecha_creacion) VALUES 
  (1, 'maria.garcia', 'hash123456789', 1, 'admin', CURRENT_TIMESTAMP),
  (2, 'juan.rodriguez', 'hash987654321', 1, 'admin', CURRENT_TIMESTAMP),
  (3, 'ana.lopez', 'hash555666777', 1, 'admin', CURRENT_TIMESTAMP),
  (4, 'carlos.martinez', 'hash111222333', 1, 'admin', CURRENT_TIMESTAMP),
  (5, 'laura.sanchez', 'hash444555666', 1, 'admin', CURRENT_TIMESTAMP),
  (6, 'diego.perez', 'hash777888999', 1, 'admin', CURRENT_TIMESTAMP),
  (7, 'claudia.jimenez', 'hash222333444', 1, 'admin', CURRENT_TIMESTAMP),
  (8, 'andres.morales', 'hash888999000', 1, 'admin', CURRENT_TIMESTAMP),
  (9, 'natalia.ruiz', 'hash333444555', 1, 'admin', CURRENT_TIMESTAMP),
  (10, 'ricardo.herrera', 'hash666777888', 1, 'admin', CURRENT_TIMESTAMP),
  (11, 'patricia.vasquez', 'hash543216789', 1, 'admin', CURRENT_TIMESTAMP),
  (12, 'miguel.ramirez', 'hash987651234', 1, 'admin', CURRENT_TIMESTAMP),
  (13, 'valentina.torres', 'hash135792468', 1, 'admin', CURRENT_TIMESTAMP),
  (14, 'sebastian.castro', 'hash246813579', 1, 'admin', CURRENT_TIMESTAMP),
  (15, 'isabella.gomez', 'hash975318642', 1, 'admin', CURRENT_TIMESTAMP),
  (16, 'fernando.mendoza', 'hash864209753', 1, 'admin', CURRENT_TIMESTAMP),
  (17, 'camila.silva', 'hash753186420', 1, 'admin', CURRENT_TIMESTAMP),
  (18, 'javier.rojas', 'hash420865319', 1, 'admin', CURRENT_TIMESTAMP),
  (19, 'alejandra.delgado', 'hash319742086', 1, 'admin', CURRENT_TIMESTAMP),
  (20, 'nicolas.paramo', 'hash865319742', 1, 'admin', CURRENT_TIMESTAMP),
  (21, 'gabriela.quintero', 'hash642853190', 1, 'admin', CURRENT_TIMESTAMP),
  (22, 'esteban.becerra', 'hash190764285', 1, 'admin', CURRENT_TIMESTAMP),
  (23, 'victoria.leon', 'hash531907428', 1, 'admin', CURRENT_TIMESTAMP),
  (24, 'mateo.medina', 'hash742853190', 1, 'admin', CURRENT_TIMESTAMP),
  (25, 'sofia.parra', 'hash907428531', 1, 'admin', CURRENT_TIMESTAMP),
  (26, 'leonardo.osorio', 'hash428531907', 1, 'admin', CURRENT_TIMESTAMP),
  (27, 'mariana.suarez', 'hash853190742', 1, 'admin', CURRENT_TIMESTAMP),
  (28, 'tomas.arias', 'hash319074285', 1, 'admin', CURRENT_TIMESTAMP),
  (29, 'daniela.franco', 'hash074285319', 1, 'admin', CURRENT_TIMESTAMP),
  (30, 'samuel.vega', 'hash285319074', 1, 'admin', CURRENT_TIMESTAMP);

  -- ========================================
  -- INSERTS PARA ROL_PERSONA 
  -- ========================================
  INSERT INTO rol_persona (id_persona, id_rol, usuario_creacion, fecha_creacion) VALUES 
  -- Admins
  (1, 1, 'admin', CURRENT_TIMESTAMP),
  (2, 1, 'admin', CURRENT_TIMESTAMP),
  -- Emprendedores
  (3, 3, 'admin', CURRENT_TIMESTAMP),
  (4, 3, 'admin', CURRENT_TIMESTAMP),
  (5, 3, 'admin', CURRENT_TIMESTAMP),
  (6, 3, 'admin', CURRENT_TIMESTAMP),
  (7, 3, 'admin', CURRENT_TIMESTAMP),
  (8, 3, 'admin', CURRENT_TIMESTAMP),
  (9, 3, 'admin', CURRENT_TIMESTAMP),
  (10, 3, 'admin', CURRENT_TIMESTAMP),
  -- Clientes
  (11, 2, 'admin', CURRENT_TIMESTAMP),
  (12, 2, 'admin', CURRENT_TIMESTAMP),
  (13, 2, 'admin', CURRENT_TIMESTAMP),
  (14, 2, 'admin', CURRENT_TIMESTAMP),
  (15, 2, 'admin', CURRENT_TIMESTAMP),
  (16, 2, 'admin', CURRENT_TIMESTAMP),
  (17, 2, 'admin', CURRENT_TIMESTAMP),
  (18, 2, 'admin', CURRENT_TIMESTAMP),
  (19, 2, 'admin', CURRENT_TIMESTAMP),
  (20, 2, 'admin', CURRENT_TIMESTAMP),
  (21, 2, 'admin', CURRENT_TIMESTAMP),
  (22, 2, 'admin', CURRENT_TIMESTAMP),
  (23, 2, 'admin', CURRENT_TIMESTAMP),
  (24, 2, 'admin', CURRENT_TIMESTAMP),
  (25, 2, 'admin', CURRENT_TIMESTAMP),
  (26, 2, 'admin', CURRENT_TIMESTAMP),
  (27, 2, 'admin', CURRENT_TIMESTAMP),
  (28, 2, 'admin', CURRENT_TIMESTAMP),
  (29, 2, 'admin', CURRENT_TIMESTAMP),
  (30, 2, 'admin', CURRENT_TIMESTAMP);

  -- ========================================
  -- INSERTS PARA PRODUCTOS (necesarios para pedidos)
  -- ========================================
  INSERT INTO producto (id_emprendedor, nombre, descripcion, precio, estado, fecha_publicacion, stock, imagen_url, id_categoria, usuario_creacion, fecha_creacion) VALUES 
  (3, 'Empanadas de Carne', 'Deliciosas empanadas caseras de carne', 2500.00, 1, CURRENT_TIMESTAMP, 50, 'https://example.com/empanadas.jpg', 1, 'ana.lopez', CURRENT_TIMESTAMP),
  (4, 'Camiseta Básica', 'Camiseta de algodón 100% en varios colores', 25000.00, 1, CURRENT_TIMESTAMP, 30, 'https://example.com/camiseta.jpg', 2, 'carlos.martinez', CURRENT_TIMESTAMP),
  (5, 'Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 150000.00, 1, CURRENT_TIMESTAMP, 15, 'https://example.com/auriculares.jpg', 3, 'laura.sanchez', CURRENT_TIMESTAMP),
  (6, 'Set de Tazas', 'Juego de 4 tazas de cerámica artesanal', 40000.00, 1, CURRENT_TIMESTAMP, 20, 'https://example.com/tazas.jpg', 4, 'diego.perez', CURRENT_TIMESTAMP),
  (7, 'Novela Bestseller', 'Última novela del autor reconocido', 35000.00, 1, CURRENT_TIMESTAMP, 25, 'https://example.com/libro.jpg', 5, 'claudia.jimenez', CURRENT_TIMESTAMP),
  (8, 'Arepa con Queso', 'Arepa rellena de queso fresco', 3500.00, 1, CURRENT_TIMESTAMP, 100, 'https://example.com/arepa.jpg', 1, 'andres.morales', CURRENT_TIMESTAMP),
  (9, 'Pantalón Jean', 'Jean clásico de mezclilla azul', 80000.00, 1, CURRENT_TIMESTAMP, 12, 'https://example.com/jean.jpg', 2, 'natalia.ruiz', CURRENT_TIMESTAMP),
  (10, 'Mouse Inalámbrico', 'Mouse ergonómico inalámbrico', 45000.00, 1, CURRENT_TIMESTAMP, 40, 'https://example.com/mouse.jpg', 3, 'ricardo.herrera', CURRENT_TIMESTAMP);

  -- ========================================
  -- INSERTS PARA PEDIDOS (20 registros)
  -- ========================================
  INSERT INTO pedido (id_cliente, fecha_pedido, total_pedido, estado, usuario_creacion, fecha_creacion) VALUES 
  (11, '2024-01-15 10:30:00', 7500.00, 5, 'patricia.vasquez', '2024-01-15 10:30:00'),
  (12, '2024-01-16 14:20:00', 125000.00, 5, 'miguel.ramirez', '2024-01-16 14:20:00'),
  (13, '2024-01-17 09:15:00', 40000.00, 4, 'valentina.torres', '2024-01-17 09:15:00'),
  (14, '2024-01-18 16:45:00', 150000.00, 5, 'sebastian.castro', '2024-01-18 16:45:00'),
  (15, '2024-01-19 11:20:00', 35000.00, 5, 'isabella.gomez', '2024-01-19 11:20:00'),
  (16, '2024-01-20 13:30:00', 10500.00, 4, 'fernando.mendoza', '2024-01-20 13:30:00'),
  (17, '2024-01-21 08:45:00', 80000.00, 5, 'camila.silva', '2024-01-21 08:45:00'),
  (18, '2024-01-22 15:10:00', 45000.00, 5, 'javier.rojas', '2024-01-22 15:10:00'),
  (19, '2024-01-23 12:25:00', 105000.00, 4, 'alejandra.delgado', '2024-01-23 12:25:00'),
  (20, '2024-01-24 17:40:00', 25000.00, 5, 'nicolas.paramo', '2024-01-24 17:40:00'),
  (21, '2024-01-25 09:55:00', 70000.00, 5, 'gabriela.quintero', '2024-01-25 09:55:00'),
  (22, '2024-01-26 14:15:00', 3500.00, 4, 'esteban.becerra', '2024-01-26 14:15:00'),
  (23, '2024-01-27 11:30:00', 160000.00, 5, 'victoria.leon', '2024-01-27 11:30:00'),
  (24, '2024-01-28 16:20:00', 27500.00, 5, 'mateo.medina', '2024-01-28 16:20:00'),
  (25, '2024-01-29 10:45:00', 90000.00, 4, 'sofia.parra', '2024-01-29 10:45:00'),
  (26, '2024-01-30 13:50:00', 115000.00, 5, 'leonardo.osorio', '2024-01-30 13:50:00'),
  (27, '2024-02-01 08:25:00', 50000.00, 5, 'mariana.suarez', '2024-02-01 08:25:00'),
  (28, '2024-02-02 15:35:00', 75000.00, 4, 'tomas.arias', '2024-02-02 15:35:00'),
  (29, '2024-02-03 12:10:00', 22500.00, 5, 'daniela.franco', '2024-02-03 12:10:00'),
  (30, '2024-02-04 09:40:00', 135000.00, 5, 'samuel.vega', '2024-02-04 09:40:00');

  -- ========================================
  -- INSERTS PARA DETALLE_PEDIDO 
  -- ========================================
  INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad_productos, usuario_creacion, fecha_creacion) VALUES 
  -- Pedido 1
  (1, 1, 3, 'patricia.vasquez', '2024-01-15 10:30:00'),
  -- Pedido 2
  (2, 2, 5, 'miguel.ramirez', '2024-01-16 14:20:00'),
  -- Pedido 3
  (3, 6, 1, 'valentina.torres', '2024-01-17 09:15:00'),
  -- Pedido 4
  (4, 5, 1, 'sebastian.castro', '2024-01-18 16:45:00'),
  -- Pedido 5
  (5, 7, 1, 'isabella.gomez', '2024-01-19 11:20:00'),
  -- Pedido 6
  (6, 8, 3, 'fernando.mendoza', '2024-01-20 13:30:00'),
  -- Pedido 7
  (7, 9, 1, 'camila.silva', '2024-01-21 08:45:00'),
  -- Pedido 8
  (8, 10, 1, 'javier.rojas', '2024-01-22 15:10:00'),
  -- Pedido 9
  (9, 2, 3, 'alejandra.delgado', '2024-01-23 12:25:00'),
  (9, 5, 1, 'alejandra.delgado', '2024-01-23 12:25:00'),
  -- Pedido 10
  (10, 2, 1, 'nicolas.paramo', '2024-01-24 17:40:00'),
  -- Pedido 11
  (11, 7, 2, 'gabriela.quintero', '2024-01-25 09:55:00'),
  -- Pedido 12
  (12, 8, 1, 'esteban.becerra', '2024-01-26 14:15:00'),
  -- Pedido 13
  (13, 9, 2, 'victoria.leon', '2024-01-27 11:30:00'),
  -- Pedido 14
  (14, 1, 10, 'mateo.medina', '2024-01-28 16:20:00'),
  (14, 8, 1, 'mateo.medina', '2024-01-28 16:20:00'),
  -- Pedido 15
  (15, 10, 2, 'sofia.parra', '2024-01-29 10:45:00'),
  -- Pedido 16
  (16, 7, 2, 'leonardo.osorio', '2024-01-30 13:50:00'),
  (16, 10, 1, 'leonardo.osorio', '2024-01-30 13:50:00'),
  -- Pedido 17
  (17, 6, 1, 'mariana.suarez', '2024-02-01 08:25:00'),
  (17, 10, 1, 'mariana.suarez', '2024-02-01 08:25:00'),
  -- Pedido 18
  (18, 2, 3, 'tomas.arias', '2024-02-02 15:35:00'),
  -- Pedido 19
  (19, 1, 9, 'daniela.franco', '2024-02-03 12:10:00'),
  -- Pedido 20
  (20, 5, 1, 'samuel.vega', '2024-02-04 09:40:00');

  -- ========================================
  -- INSERTS PARA FACTURAS (20 registros)
  -- ========================================
  INSERT INTO factura (id_pedido, metodo_pago, fecha, total, estado_factura) VALUES 
  (1, 1, '2024-01-15 10:35:00', 7500.00, 1),
  (2, 2, '2024-01-16 14:25:00', 125000.00, 1),
  (3, 3, '2024-01-17 09:20:00', 40000.00, 1),
  (4, 4, '2024-01-18 16:50:00', 150000.00, 1),
  (5, 5, '2024-01-19 11:25:00', 35000.00, 1),
  (6, 1, '2024-01-20 13:35:00', 10500.00, 1),
  (7, 2, '2024-01-21 08:50:00', 80000.00, 1),
  (8, 3, '2024-01-22 15:15:00', 45000.00, 1),
  (9, 4, '2024-01-23 12:30:00', 105000.00, 1),
  (10, 5, '2024-01-24 17:45:00', 25000.00, 1),
  (11, 1, '2024-01-25 10:00:00', 70000.00, 1),
  (12, 2, '2024-01-26 14:20:00', 3500.00, 1),
  (13, 3, '2024-01-27 11:35:00', 160000.00, 1),
  (14, 4, '2024-01-28 16:25:00', 27500.00, 1),
  (15, 5, '2024-01-29 10:50:00', 90000.00, 1),
  (16, 1, '2024-01-30 13:55:00', 115000.00, 1),
  (17, 2, '2024-02-01 08:30:00', 50000.00, 1),
  (18, 3, '2024-02-02 15:40:00', 75000.00, 1),
  (19, 4, '2024-02-03 12:15:00', 22500.00, 1),
  (20, 5, '2024-02-04 09:45:00', 135000.00, 1);