//
// Script para crear roles de base de datos en MongoDB
// Cada rol se crea con dos privilegios usando db.createRole

// Rol 1: gestorUsuarios
// Privilegios: leer y escribir en la colección usuario

db.createRole({
  role: 'gestorUsuarios',
  privileges: [
    { resource: { db: 'emprendedores', collection: 'usuario' }, actions: ['find'] },
    { resource: { db: 'emprendedores', collection: 'usuario' }, actions: ['insert', 'update'] }
  ],
  roles: []
});

db.createRole({
  role: 'gestorProductos',
  privileges: [
    { resource: { db: 'emprendedores', collection: 'producto' }, actions: ['find'] },
    { resource: { db: 'emprendedores', collection: 'producto' }, actions: ['insert', 'update'] }
  ],
  roles: []
});

db.createRole({
  role: 'gestorPedidos',
  privileges: [
    { resource: { db: 'emprendedores', collection: 'pedido' }, actions: ['find'] },
    { resource: { db: 'emprendedores', collection: 'pedido' }, actions: ['insert', 'update'] }
  ],
  roles: []
});

// USUARIOS DE BASE DE DATOS Y ASIGNACIÓN DE ROLES
// Cada usuario se crea y se le asigna uno de los roles definidos arriba

// Usuario 1: adminUsuarios con rol gestorUsuarios
db.createUser({
  user: 'adminUsuarios',
  pwd: 'adminUsuarios123',
  roles: [ { role: 'gestorUsuarios', db: 'emprendedores' } ]
});

db.createUser({
  user: 'adminProductos',
  pwd: 'adminProductos123',
  roles: [ { role: 'gestorProductos', db: 'emprendedores' } ]
});

db.createUser({
  user: 'adminPedidos',
  pwd: 'adminPedidos123',
  roles: [ { role: 'gestorPedidos', db: 'emprendedores' } ]
});