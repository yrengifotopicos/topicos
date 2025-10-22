// Script para crear colecciones en MongoDB
// Cada colección corresponde a una tabla del modelo relacional

// Para ejecutar este script, usar en la shell de mongo:
// > load('E:\Uni\topicos\mongo\create_collections.js')

// db use emprendedores; 

// Colecciones principales

db.createCollection('persona'); // Tabla: persona
db.createCollection('tipo_identificacion'); // Tabla: tipo_identificacion
db.createCollection('tipo_persona'); // Tabla: tipo_persona
db.createCollection('rol'); // Tabla: rol
db.createCollection('estado'); // Tabla: estado
db.createCollection('usuario'); // Tabla: usuario
db.createCollection('notificacion'); // Tabla: notificacion
db.createCollection('rol_persona'); // Tabla: rol_persona
db.createCollection('producto'); // Tabla: producto
db.createCollection('categoria_producto'); // Tabla: categoria_producto
db.createCollection('pedido'); // Tabla: pedido
db.createCollection('detalle_pedido'); // Tabla: detalle_pedido
db.createCollection('metodo_pago'); // Tabla: metodo_pago
db.createCollection('factura'); // Tabla: factura

// Colecciones históricas

db.createCollection('persona_hist'); // Tabla: persona_hist
db.createCollection('usuario_hist'); // Tabla: usuario_hist
db.createCollection('producto_hist'); // Tabla: producto_hist
db.createCollection('pedido_hist'); // Tabla: pedido_hist
db.createCollection('factura_hist'); // Tabla: factura_hist
db.createCollection('detalle_pedido_hist'); // Tabla: detalle_pedido_hist
