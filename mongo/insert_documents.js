// Script para insertar documentos en MongoDB
// Cada bloque corresponde a los datos de los INSERTS del modelo relacional

// TIPOS DE IDENTIFICACIÓN
db.tipo_identificacion.insertMany([
  { tipo_identificacion: 'CEDULA', codigo: 'CC', descripcion: 'Cédula de ciudadanía' },
  { tipo_identificacion: 'TARJETA_IDENTIDAD', codigo: 'TI', descripcion: 'Tarjeta de identidad' },
  { tipo_identificacion: 'CEDULA_EXTRANJERÍA', codigo: 'CE', descripcion: 'Cédula de extranjería' },
  { tipo_identificacion: 'PASAPORTE', codigo: 'PA', descripcion: 'Pasaporte' },
  { tipo_identificacion: 'NIT', codigo: 'NI', descripcion: 'Número de identificación tributaria' }
]);

// TIPOS DE PERSONA
db.tipo_persona.insertMany([
  { tipo_persona: 'NATURAL', codigo: 'PN', descripcion: 'Persona natural' },
  { tipo_persona: 'JURÍDICA', codigo: 'PJ', descripcion: 'Persona jurídica' }
]);

// ROLES
db.rol.insertMany([
  { rol: 'ADMIN', codigo: 'ADM', descripcion: 'Administrador del sistema' },
  { rol: 'CLIENTE', codigo: 'CLI', descripcion: 'Cliente que realiza pedidos' },
  { rol: 'EMPRENDEDOR', codigo: 'EMP', descripcion: 'Usuario que publica productos' },
  { rol: 'REPARTIDOR', codigo: 'REP', descripcion: 'Usuario que entrega pedidos' }
]);

// ESTADOS
db.estado.insertMany([
  { estado: 'ACTIVO', codigo: 'AC', descripcion: 'Registro activo' },
  { estado: 'INACTIVO', codigo: 'IN', descripcion: 'Registro inactivo' },
  { estado: 'ELIMINADO', codigo: 'EL', descripcion: 'Registro eliminado' },
  { estado: 'EN_PROCESO', codigo: 'EP', descripcion: 'Proceso en curso' },
  { estado: 'FINALIZADO', codigo: 'FI', descripcion: 'Proceso finalizado' }
]);

// MÉTODOS DE PAGO
db.metodo_pago.insertMany([
  { nombre_metodo: 'EFECTIVO', codigo: 'EF', detalles: 'Pago en efectivo al recibir' },
  { nombre_metodo: 'TRANSFERENCIA', codigo: 'TR', detalles: 'Transferencia bancaria' },
  { nombre_metodo: 'TARJETA_CREDITO', codigo: 'TC', detalles: 'Pago con tarjeta de crédito' },
  { nombre_metodo: 'TARJETA_DEBITO', codigo: 'TD', detalles: 'Pago con tarjeta de débito' },
  { nombre_metodo: 'PSE', codigo: 'PS', detalles: 'Pago por PSE' }
]);

// CATEGORÍAS DE PRODUCTO
db.categoria_producto.insertMany([
  { nombre: 'Alimentos', descripcion: 'Comidas y bebidas' },
  { nombre: 'Ropa', descripcion: 'Vestimenta y accesorios' },
  { nombre: 'Tecnología', descripcion: 'Electrónica y gadgets' },
  { nombre: 'Hogar', descripcion: 'Productos para el hogar' },
  { nombre: 'Libros', descripcion: 'Libros y revistas' }
]);

// PERSONAS
// id_tipo_identificacion y tipo_persona se asumen como referencias por índice
// fecha_creacion se deja como nueva Date() para simular CURRENT_TIMESTAMP

db.persona.insertMany([
  { primer_nombre: 'María', segundo_nombre: 'Elena', primer_apellido: 'García', segundo_apellido: 'López', id_tipo_identificacion: 1, numero_identificacion: '1234567890', telefono: '3201234567', celular: '3201234567', direccion: 'Calle 12 #34-56', correo_electronico: 'maria.garcia@email.com', tipo_persona: 1, fecha_nacimiento: ISODate('1985-03-15'), genero: 'FEMENINO', usuario_creacion: 'admin', fecha_creacion: new Date() },
  { primer_nombre: 'Juan', segundo_nombre: 'Carlos', primer_apellido: 'Rodríguez', segundo_apellido: 'Martínez', id_tipo_identificacion: 1, numero_identificacion: '9876543210', telefono: '3109876543', celular: '3109876543', direccion: 'Carrera 8 #23-45', correo_electronico: 'juan.rodriguez@email.com', tipo_persona: 1, fecha_nacimiento: ISODate('1990-07-22'), genero: 'MASCULINO', usuario_creacion: 'admin', fecha_creacion: new Date() },
  { primer_nombre: 'Ana', segundo_nombre: 'Sofía', primer_apellido: 'López', segundo_apellido: 'Hernández', id_tipo_identificacion: 1, numero_identificacion: '5555666677', telefono: '3155556666', celular: '3155556666', direccion: 'Avenida 15 #67-89', correo_electronico: 'ana.lopez@email.com', tipo_persona: 1, fecha_nacimiento: ISODate('1988-11-08'), genero: 'FEMENINO', usuario_creacion: 'admin', fecha_creacion: new Date() },
  { primer_nombre: 'Carlos', segundo_nombre: 'Andrés', primer_apellido: 'Martínez', segundo_apellido: 'González', id_tipo_identificacion: 1, numero_identificacion: '1111222233', telefono: '3021112222', celular: '3021112222', direccion: 'Calle 5 #12-34', correo_electronico: 'carlos.martinez@email.com', tipo_persona: 1, fecha_nacimiento: ISODate('1992-01-30'), genero: 'MASCULINO', usuario_creacion: 'admin', fecha_creacion: new Date() },
  { primer_nombre: 'Laura', segundo_nombre: 'Patricia', primer_apellido: 'Sánchez', segundo_apellido: 'Ramírez', id_tipo_identificacion: 1, numero_identificacion: '4444555566', telefono: '3174445555', celular: '3174445555', direccion: 'Carrera 20 #45-67', correo_electronico: 'laura.sanchez@email.com', tipo_persona: 1, fecha_nacimiento: ISODate('1987-06-14'), genero: 'FEMENINO', usuario_creacion: 'admin', fecha_creacion: new Date() },
]);

// USUARIOS
db.usuario.insertMany([
  { id_persona: 1, nombre_usuario: 'maria.garcia', contrasena_hash: 'hash123456789', estado: 1, usuario_creacion: 'admin', fecha_creacion: new Date() },
  { id_persona: 2, nombre_usuario: 'juan.rodriguez', contrasena_hash: 'hash987654321', estado: 1, usuario_creacion: 'admin', fecha_creacion: new Date() },
  { id_persona: 3, nombre_usuario: 'ana.lopez', contrasena_hash: 'hash555666777', estado: 1, usuario_creacion: 'admin', fecha_creacion: new Date() },
]);

// ROL_PERSONA
db.rol_persona.insertMany([
  { id_persona: 1, id_rol: 1, usuario_creacion: 'admin', fecha_creacion: new Date() },
  { id_persona: 2, id_rol: 1, usuario_creacion: 'admin', fecha_creacion: new Date() },
  { id_persona: 3, id_rol: 3, usuario_creacion: 'admin', fecha_creacion: new Date() },
]);

// PRODUCTOS
db.producto.insertMany([
  { id_emprendedor: 3, nombre: 'Empanadas de Carne', descripcion: 'Deliciosas empanadas caseras de carne', precio: 2500.00, estado: 1, fecha_publicacion: new Date(), stock: 50, imagen_url: 'https://example.com/empanadas.jpg', id_categoria: 1, usuario_creacion: 'ana.lopez', fecha_creacion: new Date() },
  { id_emprendedor: 4, nombre: 'Camiseta Básica', descripcion: 'Camiseta de algodón 100% en varios colores', precio: 25000.00, estado: 1, fecha_publicacion: new Date(), stock: 30, imagen_url: 'https://example.com/camiseta.jpg', id_categoria: 2, usuario_creacion: 'carlos.martinez', fecha_creacion: new Date() },
]);

// PEDIDOS
db.pedido.insertMany([
  { id_cliente: 11, fecha_pedido: ISODate('2024-01-15T10:30:00Z'), total_pedido: 7500.00, estado: 5, usuario_creacion: 'patricia.vasquez', fecha_creacion: ISODate('2024-01-15T10:30:00Z') },
  { id_cliente: 12, fecha_pedido: ISODate('2024-01-16T14:20:00Z'), total_pedido: 125000.00, estado: 5, usuario_creacion: 'miguel.ramirez', fecha_creacion: ISODate('2024-01-16T14:20:00Z') },
]);

// DETALLE_PEDIDO
db.detalle_pedido.insertMany([
  { id_pedido: 1, id_producto: 1, cantidad_productos: 3, usuario_creacion: 'patricia.vasquez', fecha_creacion: ISODate('2024-01-15T10:30:00Z') },
  { id_pedido: 2, id_producto: 2, cantidad_productos: 5, usuario_creacion: 'miguel.ramirez', fecha_creacion: ISODate('2024-01-16T14:20:00Z') },
]);

// FACTURAS
db.factura.insertMany([
  { id_pedido: 1, metodo_pago: 1, fecha: ISODate('2024-01-15T10:35:00Z'), total: 7500.00, estado_factura: 1 },
  { id_pedido: 2, metodo_pago: 2, fecha: ISODate('2024-01-16T14:25:00Z'), total: 125000.00, estado_factura: 1 },
]);

// PRIVILEGIOS
// Creamos la colección privilegio y agregamos los privilegios

db.privilegio.insertMany([
  { nombre: 'gestionar_usuarios', descripcion: 'Puede crear, editar y eliminar usuarios' },
  { nombre: 'gestionar_productos', descripcion: 'Puede crear, editar y eliminar productos' },
  { nombre: 'realizar_pedidos', descripcion: 'Puede realizar pedidos de productos' },
  { nombre: 'ver_productos', descripcion: 'Puede ver productos disponibles' },
  { nombre: 'publicar_productos', descripcion: 'Puede publicar productos para la venta' },
  { nombre: 'ver_pedidos', descripcion: 'Puede ver pedidos realizados' }
]);

// ROLES CON PRIVILEGIOS EMBEBIDOS
// Cada rol tiene un array de privilegios

db.rol.insertOne({
  rol: 'ADMIN',
  codigo: 'ADM',
  descripcion: 'Administrador del sistema',
  privilegios: [
    { nombre: 'gestionar_usuarios', descripcion: 'Puede crear, editar y eliminar usuarios' },
    { nombre: 'gestionar_productos', descripcion: 'Puede crear, editar y eliminar productos' }
  ]
});

db.rol.insertOne({
  rol: 'CLIENTE',
  codigo: 'CLI',
  descripcion: 'Cliente que realiza pedidos',
  privilegios: [
    { nombre: 'realizar_pedidos', descripcion: 'Puede realizar pedidos de productos' },
    { nombre: 'ver_productos', descripcion: 'Puede ver productos disponibles' }
  ]
});

db.rol.insertOne({
  rol: 'EMPRENDEDOR',
  codigo: 'EMP',
  descripcion: 'Usuario que publica productos',
  privilegios: [
    { nombre: 'publicar_productos', descripcion: 'Puede publicar productos para la venta' },
    { nombre: 'ver_pedidos', descripcion: 'Puede ver pedidos realizados' }
  ]
});

// Detalles de pedido embebidos en el pedido
// En vez de tener una colección detalle_pedido, los detalles se guardan dentro del pedido

db.pedido.insertOne({
  id_cliente: 11,
  fecha_pedido: ISODate('2024-01-15T10:30:00Z'),
  total_pedido: 7500.00,
  estado: 5,
  usuario_creacion: 'patricia.vasquez',
  fecha_creacion: ISODate('2024-01-15T10:30:00Z'),
  detalles: [
    { id_producto: 1, cantidad_productos: 3, usuario_creacion: 'patricia.vasquez', fecha_creacion: ISODate('2024-01-15T10:30:00Z') }
  ]
});

// Productos embebidos en persona (emprendedor)
// Los productos publicados por un emprendedor se guardan dentro del documento persona

db.persona.insertOne({
  primer_nombre: 'Ana',
  segundo_nombre: 'Sofía',
  primer_apellido: 'López',
  segundo_apellido: 'Hernández',
  id_tipo_identificacion: 1,
  numero_identificacion: '5555666677',
  telefono: '3155556666',
  celular: '3155556666',
  direccion: 'Avenida 15 #67-89',
  correo_electronico: 'ana.lopez@email.com',
  tipo_persona: 1,
  fecha_nacimiento: ISODate('1988-11-08'),
  genero: 'FEMENINO',
  usuario_creacion: 'admin',
  fecha_creacion: new Date(),
  productos: [
    {
      nombre: 'Empanadas de Carne',
      descripcion: 'Deliciosas empanadas caseras de carne',
      precio: 2500.00,
      estado: 1,
      fecha_publicacion: new Date(),
      stock: 50,
      imagen_url: 'https://example.com/empanadas.jpg',
      id_categoria: 1,
      usuario_creacion: 'ana.lopez',
      fecha_creacion: new Date()
    }
  ]
});

// REFERENCIAS MANUALES EN MONGODB
// Ejemplo 1: Usuario con referencia manual a persona

const personaId = ObjectId('6533e1f1a1b2c3d4e5f67890'); // Ejemplo de _id de persona

db.usuario.insertOne({
  nombre_usuario: 'maria.garcia',
  contrasena_hash: 'hash123456789',
  estado: 1,
  usuario_creacion: 'admin',
  fecha_creacion: new Date(),
  id_persona: personaId // referencia manual
});

// El campo id_categoria almacena el _id del documento categoria_producto relacionado

const categoriaId = ObjectId('6533e1f1a1b2c3d4e5f67999'); // Ejemplo de _id de categoría

db.producto.insertOne({
  id_emprendedor: personaId, // también puede ser referencia manual
  nombre: 'Empanadas de Carne',
  descripcion: 'Deliciosas empanadas caseras de carne',
  precio: 2500.00,
  estado: 1,
  fecha_publicacion: new Date(),
  stock: 50,
  imagen_url: 'https://example.com/empanadas.jpg',
  id_categoria: categoriaId // referencia manual
});

// EJEMPLO DE $lookup EN MONGODB
// Unir usuario con persona usando el campo id_persona
// Esto se ejecuta en la shell de mongo o en un script JS

// Consulta: obtener usuarios junto con los datos de la persona relacionada

db.usuario.aggregate([
  {
    $lookup: {
      from: 'persona',
      localField: 'id_persona',
      foreignField: '_id',
      as: 'datos_persona'
    }
  },
  {
    $unwind: '$datos_persona'
  },
  {
    $project: {
      nombre_usuario: 1,
      estado: 1,
      'datos_persona.primer_nombre': 1,
      'datos_persona.segundo_nombre': 1,
      'datos_persona.primer_apellido': 1
    }
  }
]);

// Este ejemplo muestra cómo unir los datos básicos de usuario y persona
// Puedes modificar los campos en $project según lo que necesites mostrar
